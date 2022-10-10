#line 1 "Tweak.x"
@interface SBSApplicationShortcutItem : NSObject
@property (nonatomic,copy) NSString* type;
@property (nonatomic,copy) NSString* localizedTitle;
@property (nonatomic,copy) NSString* localizedSubtitle;
@property (nonatomic,copy) NSDictionary* userInfo;
@property (assign,nonatomic) NSUInteger activationMode;
@property (nonatomic,copy) NSString* bundleIdentifierToLaunch;
@end

@interface SBIconView : NSObject
- (NSString*)applicationBundleIdentifier;
- (NSString*)applicationBundleIdentifierForShortcuts;
@end

@interface SBUIAppIconForceTouchControllerDataProvider : NSObject
- (NSString*)applicationBundleIdentifier;
@end

@class BBContent;
@interface BBContent : NSObject
@property (nonatomic,retain) NSString * message;
@property (nonatomic,retain) NSString * title;
@end

@interface BBBulletin : NSObject
@property (nonatomic,retain) NSString * sectionID;
@property (nonatomic,retain) BBContent * content;
@end

@interface BBServer
-(void)publishBulletin:(id)arg1 destinations:(unsigned long long)arg2 ;
@end

static BOOL appNotificationStatus(NSString *bundleID) {
	NSString *quietApps = [[NSUserDefaults standardUserDefaults] stringForKey:@"QuietApps"];
	NSArray *quietArray = [quietApps componentsSeparatedByString:@";"];
	if ([quietArray containsObject:bundleID]) {
		return YES;
	} else {
		return NO;
	}
}

static void removeOrAdd(NSString *bundleID) {
	if ([[NSUserDefaults standardUserDefaults] stringForKey:@"QuietApps"]) {
		NSString *quietApps = [[NSUserDefaults standardUserDefaults] stringForKey:@"QuietApps"];
		NSArray *quietnormalArray = [quietApps componentsSeparatedByString:@";"];
		NSMutableArray *quietArray = [quietnormalArray mutableCopy];
		if ([quietArray containsObject:bundleID]) {
			for(NSString *appID in quietArray) {
				if([appID isEqual:bundleID]) {
					[quietArray removeObject:appID];
					break;
				}
			}
		} else {
			[quietArray addObject:bundleID];
		}
		NSString *newString = [quietArray componentsJoinedByString:@";"];
		[[NSUserDefaults standardUserDefaults] setObject:newString forKey:@"QuietApps"];
	} else {
		NSString *testString = [NSString stringWithFormat:@"%@;",bundleID];
		[[NSUserDefaults standardUserDefaults] setObject:testString forKey:@"QuietApps"];
	}
}


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBIconView; @class SBSApplicationShortcutItem; @class BBServer; 
static NSArray * (*_logos_orig$_ungrouped$SBIconView$applicationShortcutItems)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static NSArray * _logos_method$_ungrouped$SBIconView$applicationShortcutItems(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void (*_logos_meta_orig$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, SBSApplicationShortcutItem*, NSString*, id); static void _logos_meta_method$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, SBSApplicationShortcutItem*, NSString*, id); static void (*_logos_orig$_ungrouped$BBServer$publishBulletin$destinations$)(_LOGOS_SELF_TYPE_NORMAL BBServer* _LOGOS_SELF_CONST, SEL, BBBulletin *, unsigned long long); static void _logos_method$_ungrouped$BBServer$publishBulletin$destinations$(_LOGOS_SELF_TYPE_NORMAL BBServer* _LOGOS_SELF_CONST, SEL, BBBulletin *, unsigned long long); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBSApplicationShortcutItem(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBSApplicationShortcutItem"); } return _klass; }
#line 67 "Tweak.x"

static NSArray * _logos_method$_ungrouped$SBIconView$applicationShortcutItems(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	NSArray *orig = _logos_orig$_ungrouped$SBIconView$applicationShortcutItems(self, _cmd);
	NSString *bundleID;
	if ([self respondsToSelector:@selector(applicationBundleIdentifier)]){
		bundleID = [self applicationBundleIdentifier];
	} else if ([self respondsToSelector:@selector(applicationBundleIdentifierForShortcuts)]){
		bundleID = [self applicationBundleIdentifierForShortcuts];
	}
	if(!bundleID){
		return orig;
	}
    SBSApplicationShortcutItem* Quiet = [[_logos_static_class_lookup$SBSApplicationShortcutItem() alloc] init];
    if (!appNotificationStatus(bundleID)) {
		Quiet.localizedTitle = [NSString stringWithFormat:@"Disable Notifications"];
	} else {
		Quiet.localizedTitle = [NSString stringWithFormat:@"Enable Notifications"];
	}
    Quiet.type = @"com.greg0109.quiet.item";
    return [orig arrayByAddingObject:Quiet];
}

static void _logos_meta_method$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, SBSApplicationShortcutItem* item, NSString* bundleID, id iconView){
	if ([[item type] isEqualToString:@"com.greg0109.quiet.item"]){
		removeOrAdd(bundleID);
	} else {
		_logos_meta_orig$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$(self, _cmd, item, bundleID, iconView);
	}
}



static void _logos_method$_ungrouped$BBServer$publishBulletin$destinations$(_LOGOS_SELF_TYPE_NORMAL BBServer* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BBBulletin * arg1, unsigned long long arg2) {
  NSString *bundleID = arg1.sectionID;
  if (!appNotificationStatus(bundleID)) {
	  _logos_orig$_ungrouped$BBServer$publishBulletin$destinations$(self, _cmd, arg1, arg2);
  }
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBIconView = objc_getClass("SBIconView"); Class _logos_metaclass$_ungrouped$SBIconView = object_getClass(_logos_class$_ungrouped$SBIconView); { MSHookMessageEx(_logos_class$_ungrouped$SBIconView, @selector(applicationShortcutItems), (IMP)&_logos_method$_ungrouped$SBIconView$applicationShortcutItems, (IMP*)&_logos_orig$_ungrouped$SBIconView$applicationShortcutItems);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$SBIconView, @selector(activateShortcut:withBundleIdentifier:forIconView:), (IMP)&_logos_meta_method$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$, (IMP*)&_logos_meta_orig$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$);}Class _logos_class$_ungrouped$BBServer = objc_getClass("BBServer"); { MSHookMessageEx(_logos_class$_ungrouped$BBServer, @selector(publishBulletin:destinations:), (IMP)&_logos_method$_ungrouped$BBServer$publishBulletin$destinations$, (IMP*)&_logos_orig$_ungrouped$BBServer$publishBulletin$destinations$);}} }
#line 106 "Tweak.x"
