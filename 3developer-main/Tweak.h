#include "NSTask.h"
#include <SpringBoard/SBApplication.h>
#include <SpringBoard/SBApplicationController.h>
#include <SpringBoard/SBApplicationInfo.h>
#include <Foundation/Foundation.h>

@interface SBSApplicationShortcutIcon : NSObject
@end

@interface SBApplication (private)
@property(retain, nonatomic) SBApplicationInfo *info; // ivar: _appInfo
@end

@interface UIApplication (private)
- (void)applicationOpenURL:(id)arg1;
- (bool)launchApplicationWithIdentifier:(id)arg1 suspended:(bool)arg2;
@end

@interface SBSApplicationShortcutItem : NSObject
@property(nonatomic, retain) NSString *type;
@property(nonatomic, copy) NSString *localizedTitle;
@property (copy, nonatomic) NSString *localizedSubtitle; // ivar: _localizedSubtitle
@property (copy, nonatomic) NSString *bundleIdentifierToLaunch; // ivar: _bundleIdentifierToLaunch
@property(nonatomic, copy) SBSApplicationShortcutIcon *icon;
@property (copy, nonatomic) NSDictionary *userInfo;
@end

@interface SBIconView : UIView
@property (readonly, copy, nonatomic) NSString *applicationBundleIdentifierForShortcuts;
@end

@interface SBSApplicationShortcutSystemPrivateIcon : SBSApplicationShortcutIcon
- (id)initWithSystemImageName:(id)arg1;
@end
