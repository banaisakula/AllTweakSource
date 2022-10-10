#import <UIKit/UIKit.h>
#import <spawn.h>
#import <FrontBoardServices/FBSSystemService.h>

@interface SBLeafIcon : NSObject
-(void)launchFromLocation:(id)arg1 context:(id)arg2 ;
-(id)applicationBundleID;
@end

@interface FBSystemService : NSObject
+(id)sharedInstance;
-(void)shutdownAndReboot:(BOOL)arg1;
@end

@interface SBApplication
@property (nonatomic,readonly) NSString * bundleIdentifier;                                                                                     //@synthesize bundleIdentifier=_bundleIdentifier - In the implementation block
@property (nonatomic,readonly) NSString * iconIdentifier;
@property (nonatomic,readonly) NSString * displayName;
@end

int modespecifier;

%hook SBLeafIcon
-(void)launchFromLocation:(id)arg1 context:(id)arg2 {
  NSMutableDictionary *applist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.greg0109.banavoiderapplist"];
  if ([[applist valueForKey:[self applicationBundleID]] boolValue]) {
    UIAlertController* alertCtrl = [UIAlertController alertControllerWithTitle:@"You are jailbroken!" message:@"Do you want to disable the jailbreak or exit?" preferredStyle:UIAlertControllerStyleAlert];
    [alertCtrl addAction:[UIAlertAction actionWithTitle:@"Exit" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}]];
    if (modespecifier == 0) {
      [alertCtrl addAction:[UIAlertAction actionWithTitle:@"Reboot" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[%c(FBSystemService) sharedInstance] shutdownAndReboot:YES];}]];
    } else if (modespecifier == 1) {
      [alertCtrl addAction:[UIAlertAction actionWithTitle:@"Safemode" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        pid_t pid;
        int status;
        const char* args[] = {"killall", "-SEGV", "SpringBoard", NULL};
        posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
        waitpid(pid, &status, WEXITED);
      }]];
    }
    [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertCtrl animated:YES completion:^{}];
  } else {
    %orig;
  }
}
%end

%hook SpringBoard
-(void)frontDisplayDidChange:(SBApplication *)arg1 {
  NSMutableDictionary *applist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.greg0109.banavoiderapplist"];
  if ([[applist valueForKey:arg1.bundleIdentifier] boolValue]) {
    UIAlertController* alertCtrl = [UIAlertController alertControllerWithTitle:@"You are jailbroken!" message:@"Do you want to disable the jailbreak or exit?" preferredStyle:UIAlertControllerStyleAlert];
    [alertCtrl addAction:[UIAlertAction actionWithTitle:@"Exit" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}]];
    if (modespecifier == 0) {
      [alertCtrl addAction:[UIAlertAction actionWithTitle:@"Reboot" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[%c(FBSystemService) sharedInstance] shutdownAndReboot:YES];}]];
    } else if (modespecifier == 1) {
      [alertCtrl addAction:[UIAlertAction actionWithTitle:@"Safemode" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        pid_t pid;
        int status;
        const char* args[] = {"killall", "-SEGV", "SpringBoard", NULL};
        posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
        waitpid(pid, &status, WEXITED);
      }]];
    }
    [[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertCtrl animated:YES completion:^{}];
  } else {
    %orig;
  }
}
%end

%ctor {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:[NSHomeDirectory() stringByAppendingFormat:@"/Library/Preferences/com.greg0109.banavoiderprefs.plist"]];
	BOOL enabled = prefs[@"enabled"] ? [prefs[@"enabled"] boolValue] : NO;
  modespecifier = prefs[@"modespecifier"] ? [prefs[@"modespecifier"] intValue] : 0;
  if (enabled) {
    %init();
  }
}
