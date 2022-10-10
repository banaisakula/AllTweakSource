#import <Foundation/Foundation.h>

@interface NSUserDefaults (Tweak_Category)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static NSString * nsDomainString = @"com.wilsonthewolf.timejumpprefs";
static NSString * nsNotificationString = @"com.wilsonthewolf.timejump/preferences.changed";
static BOOL enabled;
static double offset;

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
	NSNumber * enabledValue = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enabled" inDomain:nsDomainString];
	enabled = (enabledValue)? [enabledValue boolValue] : YES;
	NSNumber * timeValue = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"time" inDomain:nsDomainString];
	offset = (timeValue)? [timeValue doubleValue] : 2.0;
}

%ctor {
	// Set variables on start up
	notificationCallback(NULL, NULL, NULL, NULL, NULL);

	// Register for 'PostNotification' notifications
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
}


%hook SBFLockScreenDateView

	-(void)setDate:(NSDate *)date {
		if(enabled) {
			NSDate *newDate = [NSDate dateWithTimeInterval:60*offset sinceDate:date];
			%orig(newDate);
		} else {
			%orig;
		}
	}

%end