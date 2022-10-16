// Thanks! - https://github.com/guillermo-moran/Packix-DRM-Middleman/blob/master/DRMUtils.h
#import <sys/utsname.h>
#include <UIKit/UIKit.h>

OBJC_EXTERN CFStringRef MGCopyAnswer(CFStringRef key) WEAK_IMPORT_ATTRIBUTE;

@interface DeviceInfo : NSObject {}

+ (NSString*)deviceModelIdentifier;
+ (NSString*)deviceUDID;

@end