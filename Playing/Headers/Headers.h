#import "MediaRemote.h"
#import "MobileGestalt.h"
#import "BBServer.h"
#import <Cephei/HBPreferences.h>
#import <objc/runtime.h>
#import <dlfcn.h>

@interface CPNotification : NSObject
+ (void)showAlertWithTitle:(NSString*)title message:(NSString*)message userInfo:(NSDictionary*)userInfo badgeCount:(int)badgeCount soundName:(NSString*)soundName delay:(double)delay repeats:(BOOL)repeats bundleId:(nonnull NSString*)bundleId;
@end