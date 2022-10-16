#import <Foundation/Foundation.h>
#import <libhdev/HUtilities/HDownloadMedia.h>

#define PLIST_PATH "/var/mobile/Library/Preferences/com.haoict.gmailnoadspref.plist"
#define PREF_CHANGED_NOTIF "com.haoict.gmailnoadspref/PrefChanged"

@interface GBTMailListViewControllerImpl : UIViewController
- (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2;
@end