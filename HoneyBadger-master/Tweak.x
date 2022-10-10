#import "Tweak.h"

%hook SBIconView

- (void)setApplicationShortcutItems:(NSArray *)arg1 {
	NSMutableArray *newItems = [[NSMutableArray alloc] init];

	for (SBSApplicationShortcutItem *item in arg1) {
		[newItems addObject:item];
	}

	NSData *clearImageData = UIImagePNGRepresentation([[UIImage imageWithContentsOfFile:@"/Library/Application Support/HoneyBadger/clear.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]);

	SBSApplicationShortcutItem *clearBadge = [%c(SBSApplicationShortcutItem) alloc];
    clearBadge.localizedTitle = @"Clear Badge";
	clearBadge.localizedSubtitle = [NSString stringWithFormat:@"Clear %@\'s badge", self.icon.displayName];
	clearBadge.type = @"me.conorthedev.honeybadger.clearBadge";
	[clearBadge setIcon:[[SBSApplicationShortcutCustomImageIcon alloc] initWithImagePNGData:clearImageData]];

	[newItems addObject:clearBadge];

	%orig(newItems);
}

+ (void)activateShortcut:(SBSApplicationShortcutItem*)item withBundleIdentifier:(NSString*)bundleID forIconView:(SBIconView *)iconView {
	if([[item type] isEqualToString:@"me.conorthedev.honeybadger.clearBadge"]) {	
		[iconView.icon setBadge:nil];
		return;
	} else {
		%orig;
	}
}

%end