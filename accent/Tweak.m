#line 1 "/Users/lovez/Desktop/AA/AA/accent/Tweak.x"
#import "Headers.h"

#define isCurrentApp(string) [[[NSBundle mainBundle] bundleIdentifier] isEqual : string]
#define PreferencesFilePath [NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.ivanc.accentpreferences.plist"]
#define ExcludedFilePath [NSString stringWithFormat:@"/var/mobile/Library/Preferences/com.ivanc.accentexcluded.plist"]
#define PreferencesChangedNotification "com.ivanc.preferenceschanged"


static NSDictionary *myColors;

static NSDictionary* preferences;
static NSDictionary* excludedApps;
static NSMutableArray* excludedAppsArray;
static BOOL enabled;
NSString* color;
UIColor *newColor;


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

@class GKColorPalette; @class SUApplication; @class GKUITheme; @class CKGradientView; @class UIColor; @class UISwitch; @class UIApplication; 
static id (*_logos_meta_orig$_ungrouped$UIColor$systemBlueColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemBlueColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemRedColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemRedColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemGreenColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemGreenColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemOrangeColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemOrangeColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemYellowColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemYellowColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemTealColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemTealColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemPinkColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemPinkColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$_systemInteractionTintColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$_systemInteractionTintColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$_systemSelectedColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$_systemSelectedColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemDarkRedColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemDarkRedColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemDarkGreenColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemDarkGreenColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemDarkBlueColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemDarkBlueColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemDarkOrangeColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemDarkOrangeColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemDarkTealColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemDarkTealColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemDarkPinkColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemDarkPinkColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$systemDarkYellowColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$systemDarkYellowColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$externalSystemTealColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$externalSystemTealColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$externalSystemRedColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$externalSystemRedColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$externalSystemGreenColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$externalSystemGreenColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$tableCellBlueTextColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$tableCellBlueTextColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$linkColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$linkColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$twitterColorTwitterBlue)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$twitterColorTwitterBlue(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$_systemBlueColor2)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$_systemBlueColor2(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static UIColor * (*_logos_meta_orig$_ungrouped$UIColor$ICTintColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static UIColor * _logos_meta_method$_ungrouped$UIColor$ICTintColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIColor$ICTintedSelectionColor)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIColor$ICTintedSelectionColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$UIApplication$keyWindow)(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$UIApplication$keyWindow(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$UISwitch$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL UISwitch* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UISwitch$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UISwitch* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$UISwitch$setOnTintColor$)(_LOGOS_SELF_TYPE_NORMAL UISwitch* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UISwitch$setOnTintColor$(_LOGOS_SELF_TYPE_NORMAL UISwitch* _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$GKColorPalette$emphasizedTextColor)(_LOGOS_SELF_TYPE_NORMAL GKColorPalette* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$GKColorPalette$emphasizedTextColor(_LOGOS_SELF_TYPE_NORMAL GKColorPalette* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$GKColorPalette$emphasizedTextOnDarkBackgroundColor)(_LOGOS_SELF_TYPE_NORMAL GKColorPalette* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$GKColorPalette$emphasizedTextOnDarkBackgroundColor(_LOGOS_SELF_TYPE_NORMAL GKColorPalette* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$GKColorPalette$systemInteractionColor)(_LOGOS_SELF_TYPE_NORMAL GKColorPalette* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$GKColorPalette$systemInteractionColor(_LOGOS_SELF_TYPE_NORMAL GKColorPalette* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$GKUITheme$tabbarIconChallengesSelected$)(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST, SEL, BOOL); static id _logos_method$_ungrouped$GKUITheme$tabbarIconChallengesSelected$(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST, SEL, BOOL); static id (*_logos_orig$_ungrouped$GKUITheme$tabbarIconFriendsSelected$)(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST, SEL, BOOL); static id _logos_method$_ungrouped$GKUITheme$tabbarIconFriendsSelected$(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST, SEL, BOOL); static id (*_logos_orig$_ungrouped$GKUITheme$tabbarIconGamesSelected$)(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST, SEL, BOOL); static id _logos_method$_ungrouped$GKUITheme$tabbarIconGamesSelected$(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST, SEL, BOOL); static id (*_logos_orig$_ungrouped$GKUITheme$tabbarIconMeSelected$)(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST, SEL, BOOL); static id _logos_method$_ungrouped$GKUITheme$tabbarIconMeSelected$(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST, SEL, BOOL); static id (*_logos_orig$_ungrouped$GKUITheme$tabbarIconTurnsSelected$)(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST, SEL, BOOL); static id _logos_method$_ungrouped$GKUITheme$tabbarIconTurnsSelected$(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST, SEL, BOOL); static id (*_logos_orig$_ungrouped$SUApplication$interactionTintColor)(_LOGOS_SELF_TYPE_NORMAL SUApplication* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$SUApplication$interactionTintColor(_LOGOS_SELF_TYPE_NORMAL SUApplication* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$CKGradientView$colors)(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$CKGradientView$colors(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$UIApplication(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("UIApplication"); } return _klass; }
#line 18 "/Users/lovez/Desktop/AA/AA/accent/Tweak.x"
void setColor() {
    

    
    preferences = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath];
    excludedApps = [[NSDictionary alloc] initWithContentsOfFile:ExcludedFilePath];
    excludedAppsArray = [NSMutableArray array];

    myColors = @{
        @"Teal" : [UIColor colorWithRed:0.35 green:0.78 blue:0.98 alpha:1.0],
        @"Blue" : [UIColor colorWithRed:0.00 green:0.48 blue:1.00 alpha:1.0],
        @"Purple" : [UIColor colorWithRed:0.69 green:0.32 blue:0.87 alpha:1.0],
        @"Pink" : [UIColor colorWithRed:1.00 green:0.47 blue:0.60 alpha:1.0],
        @"Red" : [UIColor colorWithRed:1.00 green:0.23 blue:0.19 alpha:1.0],
        @"Orange" : [UIColor colorWithRed:1.00 green:0.58 blue:0.00 alpha:1.0],
        @"Yellow" : [UIColor colorWithRed:1.00 green:0.80 blue:0.00 alpha:1.0],
        @"Green" : [UIColor colorWithRed:0.16 green:0.80 blue:0.25 alpha:1.0],
        @"Gray" : [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:1.0],
    };

    color = [preferences valueForKey:@"isColor"];

    if([myColors objectForKey:color] != nil) {
        newColor = [myColors objectForKey:color];
    } else {
        
        newColor = [myColors objectForKey:@"Pink"];
    }


    if ([preferences objectForKey:@"isEnabled"] != nil) {
        enabled = [[preferences valueForKey:@"isEnabled"] boolValue];
    }
    else {
        enabled = YES;
    }

    for (id key in excludedApps) {
        if ([[excludedApps valueForKey:key] boolValue] == YES) {
            [excludedAppsArray addObject:key];
        }
    }

    [[_logos_static_class_lookup$UIApplication() sharedApplication] keyWindow];

}

static void PreferencesChangedCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    setColor(); 
}





static id _logos_meta_method$_ungrouped$UIColor$systemBlueColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemBlueColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemRedColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled && (isCurrentApp(@"com.apple.mobilecal") || isCurrentApp(@"com.apple.mobiletimer")) ) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemRedColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemGreenColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemGreenColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemOrangeColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled  && ! isCurrentApp(@"com.apple.mobilemail")) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemOrangeColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemYellowColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemYellowColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemTealColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemTealColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemPinkColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemPinkColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$_systemInteractionTintColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$_systemInteractionTintColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$_systemSelectedColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$_systemSelectedColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemDarkRedColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemDarkRedColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemDarkGreenColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemDarkGreenColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemDarkBlueColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemDarkBlueColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemDarkOrangeColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemDarkOrangeColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemDarkTealColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemDarkTealColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemDarkPinkColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemDarkPinkColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$systemDarkYellowColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$systemDarkYellowColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$externalSystemTealColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$externalSystemTealColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$externalSystemRedColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$externalSystemRedColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$externalSystemGreenColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$externalSystemGreenColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$tableCellBlueTextColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$tableCellBlueTextColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$linkColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$linkColor(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$twitterColorTwitterBlue(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$twitterColorTwitterBlue(self, _cmd);
    }
}

static id _logos_meta_method$_ungrouped$UIColor$_systemBlueColor2(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_meta_orig$_ungrouped$UIColor$_systemBlueColor2(self, _cmd);
    }
}





static id _logos_method$_ungrouped$UIApplication$keyWindow(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    UIWindow* o = _logos_orig$_ungrouped$UIApplication$keyWindow(self, _cmd);
    if (enabled  && ! isCurrentApp(@"com.apple.weather")) {
        if (isCurrentApp(@"com.apple.camera") || isCurrentApp(@"com.apple.facetime") || isCurrentApp(@"com.apple.Passbook") || isCurrentApp(@"com.apple.compass") || isCurrentApp(@"com.apple.mobilenotes")) {       
            [o setTintColor:newColor];
        }
        else {
            [o setTintColor:newColor];
        }
    }
    return o;
}





static void _logos_method$_ungrouped$UISwitch$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UISwitch* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$UISwitch$layoutSubviews(self, _cmd);
    [self setOnTintColor:newColor];
}
static void _logos_method$_ungrouped$UISwitch$setOnTintColor$(_LOGOS_SELF_TYPE_NORMAL UISwitch* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id col) {
    if (enabled) {
        _logos_orig$_ungrouped$UISwitch$setOnTintColor$(self, _cmd, newColor);
    }
}







static id _logos_method$_ungrouped$GKColorPalette$emphasizedTextColor(_LOGOS_SELF_TYPE_NORMAL GKColorPalette* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_orig$_ungrouped$GKColorPalette$emphasizedTextColor(self, _cmd);
    }
}
static id _logos_method$_ungrouped$GKColorPalette$emphasizedTextOnDarkBackgroundColor(_LOGOS_SELF_TYPE_NORMAL GKColorPalette* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_orig$_ungrouped$GKColorPalette$emphasizedTextOnDarkBackgroundColor(self, _cmd);
    }
}

static id _logos_method$_ungrouped$GKColorPalette$systemInteractionColor(_LOGOS_SELF_TYPE_NORMAL GKColorPalette* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_orig$_ungrouped$GKColorPalette$systemInteractionColor(self, _cmd);
    }
}





static id _logos_method$_ungrouped$GKUITheme$tabbarIconChallengesSelected$(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
    return [_logos_orig$_ungrouped$GKUITheme$tabbarIconChallengesSelected$(self, _cmd, arg1) imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

static id _logos_method$_ungrouped$GKUITheme$tabbarIconFriendsSelected$(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
    return [_logos_orig$_ungrouped$GKUITheme$tabbarIconFriendsSelected$(self, _cmd, arg1) imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

static id _logos_method$_ungrouped$GKUITheme$tabbarIconGamesSelected$(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
    return [_logos_orig$_ungrouped$GKUITheme$tabbarIconGamesSelected$(self, _cmd, arg1) imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

static id _logos_method$_ungrouped$GKUITheme$tabbarIconMeSelected$(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
    return [_logos_orig$_ungrouped$GKUITheme$tabbarIconMeSelected$(self, _cmd, arg1) imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

static id _logos_method$_ungrouped$GKUITheme$tabbarIconTurnsSelected$(_LOGOS_SELF_TYPE_NORMAL GKUITheme* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
    return [_logos_orig$_ungrouped$GKUITheme$tabbarIconTurnsSelected$(self, _cmd, arg1) imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}






static id _logos_method$_ungrouped$SUApplication$interactionTintColor(_LOGOS_SELF_TYPE_NORMAL SUApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return newColor;
    }
    else {
        return _logos_orig$_ungrouped$SUApplication$interactionTintColor(self, _cmd);
    }
}





static id _logos_method$_ungrouped$CKGradientView$colors(_LOGOS_SELF_TYPE_NORMAL CKGradientView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled) {
        return [[NSArray alloc] initWithObjects:
                                        newColor,
                                        newColor,nil];
    }
    else {
        return _logos_orig$_ungrouped$CKGradientView$colors(self, _cmd);
    }
}






static UIColor * _logos_meta_method$_ungrouped$UIColor$ICTintColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled && isCurrentApp(@"com.apple.mobilenotes")) {
        return newColor;
    } else {
        return _logos_meta_orig$_ungrouped$UIColor$ICTintColor(self, _cmd);
    }
}


static id _logos_meta_method$_ungrouped$UIColor$ICTintedSelectionColor(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (enabled && isCurrentApp(@"com.apple.mobilenotes")) {
        CGFloat red, green, blue, alpha;
        [newColor getRed:&red green:&green blue:&blue alpha:&alpha];
        alpha = 0.3;
        return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    } else {
        return _logos_meta_orig$_ungrouped$UIColor$ICTintedSelectionColor(self, _cmd);
    }
}


static __attribute__((constructor)) void _logosLocalCtor_a5c04a66(int __unused argc, char __unused **argv, char __unused **envp) {
    
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) PreferencesChangedCallback, CFSTR(PreferencesChangedNotification), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
    setColor();
    if (! [excludedAppsArray containsObject:[[NSBundle mainBundle] bundleIdentifier]] && enabled) {
        {Class _logos_class$_ungrouped$UIColor = objc_getClass("UIColor"); Class _logos_metaclass$_ungrouped$UIColor = object_getClass(_logos_class$_ungrouped$UIColor); { MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemBlueColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemBlueColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemBlueColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemRedColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemRedColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemRedColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemGreenColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemGreenColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemGreenColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemOrangeColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemOrangeColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemOrangeColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemYellowColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemYellowColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemYellowColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemTealColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemTealColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemTealColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemPinkColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemPinkColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemPinkColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(_systemInteractionTintColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$_systemInteractionTintColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$_systemInteractionTintColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(_systemSelectedColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$_systemSelectedColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$_systemSelectedColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemDarkRedColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemDarkRedColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemDarkRedColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemDarkGreenColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemDarkGreenColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemDarkGreenColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemDarkBlueColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemDarkBlueColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemDarkBlueColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemDarkOrangeColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemDarkOrangeColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemDarkOrangeColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemDarkTealColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemDarkTealColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemDarkTealColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemDarkPinkColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemDarkPinkColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemDarkPinkColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(systemDarkYellowColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$systemDarkYellowColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$systemDarkYellowColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(externalSystemTealColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$externalSystemTealColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$externalSystemTealColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(externalSystemRedColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$externalSystemRedColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$externalSystemRedColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(externalSystemGreenColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$externalSystemGreenColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$externalSystemGreenColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(tableCellBlueTextColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$tableCellBlueTextColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$tableCellBlueTextColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(linkColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$linkColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$linkColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(twitterColorTwitterBlue), (IMP)&_logos_meta_method$_ungrouped$UIColor$twitterColorTwitterBlue, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$twitterColorTwitterBlue);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(_systemBlueColor2), (IMP)&_logos_meta_method$_ungrouped$UIColor$_systemBlueColor2, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$_systemBlueColor2);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(ICTintColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$ICTintColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$ICTintColor);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$UIColor, @selector(ICTintedSelectionColor), (IMP)&_logos_meta_method$_ungrouped$UIColor$ICTintedSelectionColor, (IMP*)&_logos_meta_orig$_ungrouped$UIColor$ICTintedSelectionColor);}Class _logos_class$_ungrouped$UIApplication = objc_getClass("UIApplication"); { MSHookMessageEx(_logos_class$_ungrouped$UIApplication, @selector(keyWindow), (IMP)&_logos_method$_ungrouped$UIApplication$keyWindow, (IMP*)&_logos_orig$_ungrouped$UIApplication$keyWindow);}Class _logos_class$_ungrouped$UISwitch = objc_getClass("UISwitch"); { MSHookMessageEx(_logos_class$_ungrouped$UISwitch, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$UISwitch$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$UISwitch$layoutSubviews);}{ MSHookMessageEx(_logos_class$_ungrouped$UISwitch, @selector(setOnTintColor:), (IMP)&_logos_method$_ungrouped$UISwitch$setOnTintColor$, (IMP*)&_logos_orig$_ungrouped$UISwitch$setOnTintColor$);}Class _logos_class$_ungrouped$GKColorPalette = objc_getClass("GKColorPalette"); { MSHookMessageEx(_logos_class$_ungrouped$GKColorPalette, @selector(emphasizedTextColor), (IMP)&_logos_method$_ungrouped$GKColorPalette$emphasizedTextColor, (IMP*)&_logos_orig$_ungrouped$GKColorPalette$emphasizedTextColor);}{ MSHookMessageEx(_logos_class$_ungrouped$GKColorPalette, @selector(emphasizedTextOnDarkBackgroundColor), (IMP)&_logos_method$_ungrouped$GKColorPalette$emphasizedTextOnDarkBackgroundColor, (IMP*)&_logos_orig$_ungrouped$GKColorPalette$emphasizedTextOnDarkBackgroundColor);}{ MSHookMessageEx(_logos_class$_ungrouped$GKColorPalette, @selector(systemInteractionColor), (IMP)&_logos_method$_ungrouped$GKColorPalette$systemInteractionColor, (IMP*)&_logos_orig$_ungrouped$GKColorPalette$systemInteractionColor);}Class _logos_class$_ungrouped$GKUITheme = objc_getClass("GKUITheme"); { MSHookMessageEx(_logos_class$_ungrouped$GKUITheme, @selector(tabbarIconChallengesSelected:), (IMP)&_logos_method$_ungrouped$GKUITheme$tabbarIconChallengesSelected$, (IMP*)&_logos_orig$_ungrouped$GKUITheme$tabbarIconChallengesSelected$);}{ MSHookMessageEx(_logos_class$_ungrouped$GKUITheme, @selector(tabbarIconFriendsSelected:), (IMP)&_logos_method$_ungrouped$GKUITheme$tabbarIconFriendsSelected$, (IMP*)&_logos_orig$_ungrouped$GKUITheme$tabbarIconFriendsSelected$);}{ MSHookMessageEx(_logos_class$_ungrouped$GKUITheme, @selector(tabbarIconGamesSelected:), (IMP)&_logos_method$_ungrouped$GKUITheme$tabbarIconGamesSelected$, (IMP*)&_logos_orig$_ungrouped$GKUITheme$tabbarIconGamesSelected$);}{ MSHookMessageEx(_logos_class$_ungrouped$GKUITheme, @selector(tabbarIconMeSelected:), (IMP)&_logos_method$_ungrouped$GKUITheme$tabbarIconMeSelected$, (IMP*)&_logos_orig$_ungrouped$GKUITheme$tabbarIconMeSelected$);}{ MSHookMessageEx(_logos_class$_ungrouped$GKUITheme, @selector(tabbarIconTurnsSelected:), (IMP)&_logos_method$_ungrouped$GKUITheme$tabbarIconTurnsSelected$, (IMP*)&_logos_orig$_ungrouped$GKUITheme$tabbarIconTurnsSelected$);}Class _logos_class$_ungrouped$SUApplication = objc_getClass("SUApplication"); { MSHookMessageEx(_logos_class$_ungrouped$SUApplication, @selector(interactionTintColor), (IMP)&_logos_method$_ungrouped$SUApplication$interactionTintColor, (IMP*)&_logos_orig$_ungrouped$SUApplication$interactionTintColor);}Class _logos_class$_ungrouped$CKGradientView = objc_getClass("CKGradientView"); { MSHookMessageEx(_logos_class$_ungrouped$CKGradientView, @selector(colors), (IMP)&_logos_method$_ungrouped$CKGradientView$colors, (IMP*)&_logos_orig$_ungrouped$CKGradientView$colors);}}
    }
}
