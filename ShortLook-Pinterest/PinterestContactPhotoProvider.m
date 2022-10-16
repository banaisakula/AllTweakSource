#import "PinterestContactPhotoProvider.h"
#import <Foundation/Foundation.h>

@implementation PinterestContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
  NSString *profileURLStr = [notification.applicationUserInfo valueForKeyPath:@"aps.alert.img"];
  if (!profileURLStr) return nil;
  NSURL *profileURL = [NSURL URLWithString:profileURLStr];
  if (!profileURL) return nil;
  return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:profileURLStr fromURL:profileURL];
}

@end
