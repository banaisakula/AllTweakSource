#import "TumblrContactPhotoProvider.h"
#import <Foundation/Foundation.h>
#include <os/log.h>

@implementation TumblrContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:[[notification.applicationUserInfo valueForKeyPath:@"message"] dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    if (!json || error) { return nil; }
    NSString *photoURLStr = json[@"icon"];
    if (!photoURLStr) return nil;
    NSURL *photoURL = [NSURL URLWithString:photoURLStr];
    if (!photoURL) return nil;
    return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:photoURLStr fromURL:photoURL];
}

@end
