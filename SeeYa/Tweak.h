#import <UIKit/UIKit.h>
#import <UIKit/UIBezierPath.h>
#import "FolderFinder.h"

@interface NCNotificationContent : NSObject {
	NSArray* _icons;
  NSString* _header;
}
@property (nonatomic,copy,readonly) NSString * header;                                     //@synthesize header=_header - In the implementation block
@end

@interface NCNotificationRequest : NSObject {
	NCNotificationContent* _content;
}
@property (nonatomic,readonly) NCNotificationContent * content;                                          //@synthesize content=_content - In the implementation block
@property (nonatomic,readonly) UNNotification * userNotification;                                        //@synthesize userNotification=_userNotification - In the implementation block
-(NSString *)threadIdentifier;
@end

@interface CSNotificationDispatcher : NSObject
// %new
-(UIImage *)getImageFrom:(NSString *)contactName;
- (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size;
@end
