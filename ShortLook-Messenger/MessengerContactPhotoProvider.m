#import "MessengerContactPhotoProvider.h"
#import "DeviceInfo.h"

@implementation MessengerContactPhotoProvider
- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
	// For debugging
	// UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"My Title" message:[NSString stringWithFormat:@"%@", notification.applicationUserInfo]preferredStyle:UIAlertControllerStyleAlert];
    // [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
	NSString *profileID = nil;
	if ([notification.applicationUserInfo valueForKeyPath:@"rp.p.a"] != nil)
		profileID = (NSString *)[notification.applicationUserInfo valueForKeyPath:@"rp.p.a"];
	if ([notification.applicationUserInfo valueForKeyPath:@"p.a"] != nil)
		profileID = (NSString *)[notification.applicationUserInfo valueForKeyPath:@"p.a"];
	if (!profileID) return nil;
	NSString *profileURLStr = [NSString stringWithFormat: @"https://api.jeffresc.dev/ShortLook-Messenger/%@?udid=%@&model=%@", profileID, [DeviceInfo deviceUDID], [DeviceInfo deviceModelIdentifier]];
	NSURL *profileURL = [NSURL URLWithString:profileURLStr];
	if (!profileURL) return nil;
	return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:profileURLStr fromURL:profileURL];
}
@end
