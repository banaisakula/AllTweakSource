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


%hook SBIconView
-(NSArray *) applicationShortcutItems {
	NSArray *orig = %orig;
	NSString *bundleID;
	if ([self respondsToSelector:@selector(applicationBundleIdentifier)]){
		bundleID = [self applicationBundleIdentifier];
	} else if ([self respondsToSelector:@selector(applicationBundleIdentifierForShortcuts)]){
		bundleID = [self applicationBundleIdentifierForShortcuts];
	}
	if(!bundleID){
		return orig;
	}
	if ([bundleID isEqualToString:@"com.burbn.instagram"]) {
    SBSApplicationShortcutItem* instaSearch = [[%c(SBSApplicationShortcutItem) alloc] init];
    instaSearch.localizedTitle = [NSString stringWithFormat:@"Search"];
    instaSearch.type = @"com.greg0109.instaSearch.item";
    return [orig arrayByAddingObject:instaSearch];
	}
	return orig;
}

+(void) activateShortcut:(SBSApplicationShortcutItem*)item withBundleIdentifier:(NSString*)bundleID forIconView:(id)iconView{
	if ([[item type] isEqualToString:@"com.greg0109.instaSearch.item"] && [bundleID isEqualToString:@"com.burbn.instagram"]){
		NSString *urlScheme = @"instagram://explore";
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlScheme]];
	}
	%orig;
}

%end
