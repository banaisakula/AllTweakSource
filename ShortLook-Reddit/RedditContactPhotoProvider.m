#import "RedditContactPhotoProvider.h"
#import <Foundation/Foundation.h>

@implementation RedditContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
  NSString *notificationTitle = [notification.applicationUserInfo valueForKeyPath:@"aps.alert.title"];
  NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:@"u/[A-Za-z0-9_-]+" options:0 error:nil];
  long n = [regex numberOfMatchesInString:notificationTitle options:0 range:NSMakeRange(0, [notificationTitle length])];
  if (n> 0) {
	NSArray *matches = [regex matchesInString:notificationTitle options:0 range:NSMakeRange(0, [notificationTitle length])];
      for (NSTextCheckingResult *match in matches) {
        NSString *username = [notificationTitle substringWithRange:[match range]];
		NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:[NSString stringWithFormat:@"https://www.reddit.com/%@/about.json",username]]];
		NSError* error;
		NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
		if(error) { return nil; }
		NSString *photoURLStr = json[@"data"][@"icon_img"];
		NSURL *photoURL = [NSURL URLWithString:photoURLStr];
		if (!photoURL) return nil;
		return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:photoURLStr fromURL:photoURL];
      }
	  return nil;
  } else {
	return nil;
  }
}

@end
