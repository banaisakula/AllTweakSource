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
    SBSApplicationShortcutItem* Quiet = [[%c(SBSApplicationShortcutItem) alloc] init];
    if (!appNotificationStatus(bundleID)) {
		Quiet.localizedTitle = [NSString stringWithFormat:@"Disable Notifications"];
	} else {
		Quiet.localizedTitle = [NSString stringWithFormat:@"Enable Notifications"];
	}
    Quiet.type = @"com.greg0109.quiet.item";
    return [orig arrayByAddingObject:Quiet];
}

+(void) activateShortcut:(SBSApplicationShortcutItem*)item withBundleIdentifier:(NSString*)bundleID forIconView:(id)iconView{
	if ([[item type] isEqualToString:@"com.greg0109.quiet.item"]){
		removeOrAdd(bundleID);
	} else {
		%orig;
	}
}
%end

%hook BBServer
-(void)publishBulletin:(BBBulletin *)arg1 destinations:(unsigned long long)arg2 {
  NSString *bundleID = arg1.sectionID;
  if (!appNotificationStatus(bundleID)) {
	  %orig;
  }
}
%end
