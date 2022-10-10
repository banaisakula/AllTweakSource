@interface TUCall
-(id)init;
-(NSString *)name;
-(BOOL)isIncoming;
-(int)callStatus;
-(void)setShouldSuppressRingtone:(BOOL)arg1 ;
@end

@interface CXCall
-(BOOL)hasEnded;
@end

@interface NCNotificationRequest
-(NSString *)sectionIdentifier;
-(id)sound;
@end

@interface SpringBoard
+(id)sharedApplication;
-(void)_updateRingerState:(int)arg1 withVisuals:(BOOL)arg2 updatePreferenceRegister:(BOOL)arg3;
-(void)applicationDidFinishLaunching:(id)arg1;
-(void)callhiderringer:(NSNotification *)notification;
-(void)_simulateLockButtonPress;
-(void)_simulateHomeButtonPress;
@end

@interface SBLockStateAggregator : NSObject
+(id)sharedInstance;
-(id)init;
-(void)dealloc;
-(id)description;
-(unsigned long long)lockState;
-(void)_updateLockState;
-(BOOL)hasAnyLockState;
-(id)_descriptionForLockState:(unsigned long long)arg1 ;
@end


@interface SBRemoteAlertHandleServer
-(void)activate;
@end

@interface NSDistributedNotificationCenter : NSNotificationCenter
+ (instancetype)defaultCenter;
- (void)postNotificationName:(NSString *)name object:(NSString *)object userInfo:(NSDictionary *)userInfo;
@end

@interface SBVolumeControl
+(id)sharedInstance;
-(void)setVolume:(float)arg1 forCategory:(NSString *)arg1;
-(BOOL)_HUDIsDisplayableForCategory:(id)arg1 ;
-(void)toggleMute;
@end

NSArray *contactnamearray;
NSArray *timeSlotArray;
NSString *fakename;
NSString *realName;
NSDate *oldDate;
NSDate *newDate;
BOOL mask;
BOOL ringer;
BOOL ringertime;
BOOL hidecall;

%group ringertimeslots
static BOOL checkDate() {
  for (NSString *timeSlot in timeSlotArray) {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSArray *hours = [timeSlot componentsSeparatedByString:@"-"];
    NSDate *startHour = [dateFormatter dateFromString:[hours objectAtIndex:0]];
    NSDate *endHour = [dateFormatter dateFromString:[hours objectAtIndex:1]];
    NSDate *currentHour = [dateFormatter dateFromString:[dateFormatter stringFromDate:[NSDate date]]];
    if (([currentHour compare:startHour] == NSOrderedDescending) && ([currentHour compare:endHour] == NSOrderedAscending)) {
      return YES;
    } else {
      continue;
    }
  }
  return NO;
}

%hook NCNotificationRequest
-(NSString *)sectionIdentifier {
  return %orig;
}
-(id)sound {
  NSMutableDictionary *applist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.greg0109.callhiderapplist"];
  if ([applist valueForKey:[self sectionIdentifier]] && checkDate()) {
    return nil;
  }
  return %orig;
}
%end
%end

%hook TUCall
-(NSString *)displayName {
  realName = %orig;
  NSMutableDictionary *defaults = [NSMutableDictionary dictionaryWithContentsOfFile:@"/User/Library/Preferences/com.apple.springboard.plist"];
  if (ringertime) {
    if (checkDate()) {
      NSLog(@"CallHider: Tweak is enabled");
      [defaults setValue:@"1" forKey:@"CallHider-Status"];
    } else {
      NSLog(@"CallHider: Tweak is disabled");
      [defaults setValue:@"0" forKey:@"CallHider-Status"];
    }
  }
  if ([defaults[@"CallHider-Status"] boolValue]) {
    for (NSString *contact in contactnamearray) {
      if ([realName containsString:contact]) {
        if (mask) {
          realName = fakename;
        }
        if (ringer) {
          if (ringertime && checkDate()) {
            NSLog(@"CallHider: Supress ringtone");
            [self setShouldSuppressRingtone:YES];
          } else if (!ringertime) {
            [self setShouldSuppressRingtone:YES];
          }
        }
        return realName;
      }
    }
  }
  if (hidecall) {
    [[NSDistributedNotificationCenter defaultCenter] postNotificationName:@"CallHider-Show" object:nil userInfo:nil];
  }
  return realName;
}
%end

%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)arg1 {
  if (hidecall) {
		[[NSDistributedNotificationCenter defaultCenter] addObserverForName:@"CallHider-Show" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification) {
	    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
	      newDate = [NSDate date];
	      if ([newDate timeIntervalSinceDate:oldDate] > 3 || oldDate == nil) {
	        [self _simulateLockButtonPress];
	        oldDate = [NSDate date];
	      }
	    });
	  }];
	}
  %orig;
}
%end

%hook SBRemoteAlertHandleServer
-(void)activate {
  if (!hidecall) {
    %orig;
  }
}
%end

%ctor {
  NSMutableDictionary *prefs = [NSMutableDictionary dictionaryWithContentsOfFile:@"/User/Library/Preferences/com.greg0109.callhiderprefs.plist"];
  BOOL enable = prefs[@"enabled"] ? [prefs[@"enabled"] boolValue] : YES;
  mask = prefs[@"mask"] ? [prefs[@"mask"] boolValue] : YES;
  ringer = prefs[@"ringer"] ? [prefs[@"ringer"] boolValue] : NO;
  ringertime = prefs[@"ringertime"] ? [prefs[@"ringertime"] boolValue] : NO;
  hidecall = prefs[@"hidecall"] ? [prefs[@"hidecall"] boolValue] : NO;
  NSString *timeslot = prefs[@"timeslot"] && !([prefs[@"timeslot"] isEqualToString:@""]) ? [prefs[@"timeslot"] stringValue] : @"00:00-00:00";
  timeSlotArray = [timeslot componentsSeparatedByString:@";"];
  NSString *contactname = prefs[@"contactname"] && !([prefs[@"contactname"] isEqualToString:@""]) ? [prefs[@"contactname"] stringValue] : @"contact name;contact name";
  contactnamearray = [contactname componentsSeparatedByString:@";"];
  fakename = prefs[@"fakename"] && !([prefs[@"fakename"] isEqualToString:@""]) ? [prefs[@"fakename"] stringValue] : @"Fake Name";
  if (enable) {
    %init();
  }
  if (ringertime) {
    %init(ringertimeslots);
  }
}
