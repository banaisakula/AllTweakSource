#import <ControlCenterUIKit/CCUIToggleModule.h>

@interface MobileGooseModule : CCUIToggleModule {
    BOOL _selected;
}
- (UIImage *)iconGlyph;
- (UIColor *)selectedColor;
- (BOOL)isSelected;
- (void)setSelected:(BOOL)selected;
@end

@implementation MobileGooseModule
- (UIImage *)iconGlyph {
    return [UIImage imageNamed:@"ModuleIcon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

- (UIColor *)selectedColor {
    return [UIColor colorWithRed:0.996 green:0.510 blue:0.224 alpha:1];
}

- (BOOL)isSelected {
    Boolean *keyExistsAndHasValidFormat = false; //needed to call CFPreferencesGetAppBooleanValue() (not used for anything else)
    return CFPreferencesGetAppBooleanValue((__bridge CFStringRef)@"Enabled", (__bridge CFStringRef)@"com.pixelomer.mobilegoose", keyExistsAndHasValidFormat);
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    [super refreshState];
    
    //must use CFPreferences and CFNotificationCenter in order to properly communicate with MobileGoose
    CFPropertyListRef valueToSet = (__bridge CFPropertyListRef)[NSNumber numberWithBool:selected];
    CFPreferencesSetAppValue((__bridge CFStringRef)@"Enabled", valueToSet, (__bridge CFStringRef)@"com.pixelomer.mobilegoose");
    
    CFStringRef notificationName = (__bridge CFStringRef)@"com.pixelomer.mobilegoose/PreferenceChange";
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, nil, nil, true);
}
@end
