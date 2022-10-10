#import <UIKit/UIKit.h>

@interface SBRestartTransitionRequest : NSObject
- (id)initWithRequester:(NSString *)requester reason:(NSString *)reason ;
@end

@interface SBRestartManager : NSObject
- (void)restartWithTransitionRequest:(SBRestartTransitionRequest *)request ;
@end

@interface SpringBoard : UIApplication
- (void)_relaunchSpringBoardNow;
- (void)reboot;
- (void)powerDown;
@property (nonatomic,readonly) SBRestartManager * restartManager;
@end

@interface FBSystemApp : UIApplication
- (void)sendActionsToBackboard:(NSSet *)actions;
@end

@interface FBSystemService : NSObject
+ (id)sharedInstance;
- (void)shutdownAndReboot:(bool)arg1;
@end

@interface BKSRestartAction : NSObject
+ (id)actionWithOptions:(NSInteger)options;
@end

@interface UIImage ()
+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;
@end