#import "Tweak.h"

extern dispatch_queue_t __BBServerQueue;
static NSString *const kFlashNotifyBulletinID = @"com.greg0109.FlashNotify-ID";
static NSString *const kFlashNotifyBulletinAction = @"!com.greg0109.FlashNotify-Action";

PCSimpleTimer *timer;
BBServer *server;

BOOL enabled;
NSInteger remind;
BOOL charging;
NSInteger remindCharging;
BOOL autooff;
NSInteger autooffTimer;

static void removeBulletin() {
  if(server) {
    dispatch_async(__BBServerQueue, ^{
      [server withdrawBulletinRequestsWithPublisherBulletinID:kFlashNotifyBulletinID forSectionID:@"com.apple.Preferences"];
    });
  }
}

static void sendNotif() {
  if (!autooff && remind) {
    BBBulletinRequest *bulletin = [[BBBulletinRequest alloc] init];
    bulletin.header = @"FLASHNOTIFY";
    bulletin.title = @"Your flashlight is still on";
    bulletin.message = @"Tap here to turn it off";
    bulletin.sectionID = @"com.apple.Preferences";
    bulletin.bulletinID = [[NSProcessInfo processInfo] globallyUniqueString];
    bulletin.recordID = [[NSProcessInfo processInfo] globallyUniqueString];
    bulletin.publisherBulletinID = kFlashNotifyBulletinID;
    bulletin.turnsOnDisplay = YES;
    bulletin.lockScreenPriority = 3;
    bulletin.preventAutomaticRemovalFromLockScreen = YES;

    BBAction *disableFlashlight = [BBAction actionWithIdentifier:kFlashNotifyBulletinAction];
    bulletin.defaultAction = disableFlashlight;

    if(server) {
      dispatch_async(__BBServerQueue, ^{
        [server publishBulletinRequest:bulletin destinations:15];
      });
    }
  } else {
    SBUIFlashlightController *flashlightController = [%c(SBUIFlashlightController) sharedInstance];
    if (flashlightController.level > 0) {
      [flashlightController setLevel:0];
    }
  }
}

static void startTimer(NSInteger timeInterval) {
  if(timer) {
    [timer invalidate];
    timer = nil;
  }
  id selectorBlock = [^{sendNotif();} copy];
  //NSInteger timeInterval = ([UIDevice currentDevice].batteryState == 2 && notifyWhileCharging) ? chargingNotificationDelay : unpluggedNotificationDelay;
  timer = [[%c(PCSimpleTimer) alloc] initWithTimeInterval:timeInterval serviceIdentifier:kFlashNotifyBulletinID target:selectorBlock selector:@selector(invoke) userInfo:nil];
  timer.disableSystemWaking = NO;
  [timer scheduleInRunLoop:[NSRunLoop mainRunLoop]];
}

static void stopTimer() {
  if(timer) {
    [timer invalidate];
    timer = nil;
  }
}

%hook SBUIController
-(void)playChargingChimeIfAppropriate {
  if (charging) {
    SBUIFlashlightController *flashlightController = [%c(SBUIFlashlightController) sharedInstance];
  	if (self.isConnectedToExternalChargingSource && !self.isBatteryCharging && flashlightController.level > 0) {
      startTimer(remindCharging);
  	}
  }
  %orig;
}
%end

%hook SBUIFlashlightController
-(void)turnFlashlightOnForReason:(id)arg1 {
  SBUIController *controller = [%c(SBUIController) sharedInstance];
  if (!autooff) {
    startTimer(remind);
  } else {
    startTimer(autooffTimer);
  }
  if (charging && controller.isConnectedToExternalChargingSource) {
    startTimer(remindCharging);
  }
  %orig;
}

-(void)turnFlashlightOffForReason:(id)arg1 {
  stopTimer();
  removeBulletin();
  %orig;
}
%end

%hook BBServer
-(id)initWithQueue:(id)arg1 {
  return server = %orig;
}
%end

%hook BBBulletin
-(id)responseForAction:(BBAction *)arg1 {
  if([arg1.identifier isEqualToString:kFlashNotifyBulletinAction]) {
    SBUIFlashlightController *flashlightController = [%c(SBUIFlashlightController) sharedInstance];
    if(flashlightController.level > 0) {
      [flashlightController setLevel:0];
    }
    return nil;
  }
  return %orig;
}
%end

%ctor {
  NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:@"/User/Library/Preferences/com.greg0109.flashnotifyprefs.plist"];
  enabled = prefs[@"enabled"] ? [prefs[@"enabled"] boolValue] : YES;
  remind = prefs[@"remind"] ? [prefs[@"remind"] integerValue] : 120;
  charging = prefs[@"charging"] ? [prefs[@"charging"] boolValue] : YES;
  remindCharging = prefs[@"remindCharging"] ? [prefs[@"remindCharging"] integerValue] : 30;
  autooff = prefs[@"autooff"] ? [prefs[@"autooff"] boolValue] : NO;
  autooffTimer = prefs[@"autooffTimer"] ? [prefs[@"autooffTimer"] integerValue] : 30;
  if (enabled) {
    %init();
  }
}
