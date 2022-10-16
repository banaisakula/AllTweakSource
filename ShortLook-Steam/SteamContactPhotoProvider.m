#import "SteamContactPhotoProvider.h"
#import <Foundation/Foundation.h>

@implementation SteamContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
  NSString *userID = [[[notification.applicationUserInfo valueForKeyPath:@"data.a0"] componentsSeparatedByString:@":"] objectAtIndex:1];
  if (!userID) return nil;
  NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:[NSString stringWithFormat:@"https://steamcommunity.com/profiles/%@?xml=1",userID]]];
  if (!data) return nil;
  NSString* dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  NSString *profileURLStr = [[[[dataStr componentsSeparatedByString:@"<avatarFull><![CDATA["] objectAtIndex:1] componentsSeparatedByString:@"]]></avatarFull>"] objectAtIndex:0];
  if (!profileURLStr) return nil;
  NSURL *profileURL = [NSURL URLWithString:profileURLStr];
  if (!profileURL) return nil;
  return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:profileURLStr fromURL:profileURL];
}

@end
