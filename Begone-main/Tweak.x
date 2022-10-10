#import <Foundation/Foundation.h>

@interface SBSApplicationShortcutSystemIcon: NSObject
-(instancetype)initWithSystemImageName:(NSString*)name;
@end

@interface SBSApplicationShortcutItem : NSObject
@property (nonatomic,copy) NSString* type;
@property (nonatomic,copy) NSString* localizedTitle;
-(void)setIcon:(SBSApplicationShortcutSystemIcon*)icon;
@end

@interface SBIcon: NSObject
@end

@interface SBApplication: NSObject
-(void)setBadgeValue:(NSNumber*)val;
@end

@interface SBIconView : NSObject
@property (nonatomic,retain) SBIcon* icon;
-(NSString*)applicationBundleIdentifier;
-(NSString*)applicationBundleIdentifierForShortcuts;
+(void)activateShortcut:(SBSApplicationShortcutItem*)item withBundleIdentifier:(id)bundleId forIconView:(SBIconView*)iconView;
@end

%hook SBIconView
-(NSArray*)applicationShortcutItems {
	NSArray* orig = %orig;
	if ([self.icon isKindOfClass:[%c(SBApplicationIcon) class]]) {
		SBSApplicationShortcutItem* item = [[%c(SBSApplicationShortcutItem) alloc] init];
		item.localizedTitle = @"Clear Notifications";
		item.type = @"com.beckettobrien.begone.item";
		[item setIcon:[[%c(SBSApplicationShortcutSystemIcon) alloc] initWithSystemImageName:@"clear"]];
		orig = [orig arrayByAddingObject:item];
	}
	return orig;
}

+(void)activateShortcut:(SBSApplicationShortcutItem*)item withBundleIdentifier:(id)bundleId forIconView:(SBIconView*)iconView {
	if ([[item type] isEqualToString:@"com.beckettobrien.begone.item"]) {
		[(SBApplication*)[[iconView icon] valueForKey:@"_application"] setBadgeValue:@0];
	} else {
		%orig;
	}
}
%end
