#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SparkColourPickerUtils.h"
#import "SparkAppList.h"
#import "Tweak.h"

#define isCurrentApp(string) [[[NSBundle mainBundle] bundleIdentifier] isEqual : string]
#define PreferencesFilePath [NSString stringWithFormat:@"/var/mobile/Library/Preferences/weeb.lillie.accentcustomprefs.plist"]

// Preferences Variables

BOOL enabled;
BOOL lowPowerModeBatteryTint;
BOOL chargingBatteryTint;
BOOL controlCenterTint;

void setDict() {
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PreferencesFilePath];

    if (!preferences) {
        enabled = 1;
        lowPowerModeBatteryTint = 1;
        chargingBatteryTint = 1;
        controlCenterTint = 1;
    }
    if (preferences) {
        if ([preferences objectForKey:@"enabled"] != nil) {
            enabled = [[preferences valueForKey:@"enabled"] boolValue];
        } else {
            enabled = 1;
        }
        if ([preferences objectForKey:@"lowPowerModeBatteryTint"] != nil) {
            lowPowerModeBatteryTint = [[preferences valueForKey:@"lowPowerModeBatteryTint"] boolValue];
        } else {
            lowPowerModeBatteryTint = 1;
        }
        if ([preferences objectForKey:@"chargingBatteryTint"] != nil) {
            chargingBatteryTint = [[preferences valueForKey:@"chargingBatteryTint"] boolValue];
        } else {
            chargingBatteryTint = 1;
        }
        if ([preferences objectForKey:@"controlCenterTint"] != nil) {
            controlCenterTint = [[preferences valueForKey:@"controlCenterTint"] boolValue];
        } else {
            controlCenterTint = 1;
        }
    }
}

%group gLowPowerMode
%hook _UIBatteryView
- (id)_batteryFillColor {
	if (self.saverModeActive == 1) {
		NSString *colourString = NULL;
		NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
		if(preferencesDictionary)
		{
			colourString = [preferencesDictionary objectForKey:@"customColour"];
		}

		UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
		return selectedColour;
	}
	return %orig;
}
%end
%end

%group gChargingMode
%hook _UIBatteryView
- (id)_batteryFillColor {
	if (self.chargingState == 1) {
		NSString *colourString = NULL;
		NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
		if(preferencesDictionary)
		{
			colourString = [preferencesDictionary objectForKey:@"customColour"];
		}

		UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
		return selectedColour;
	}
	return %orig;
}
%end
%end

%group gControlCenter
%hook CCUIRoundButton
- (void)layoutSubviews {
    %orig();
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    self.subviews[1].backgroundColor = selectedColour;
}
%end
%hook SCButtonView
- (void)layoutSubviews {
    %orig();
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    MSHookIvar<UIColor *>(self, "_selectedColor") = selectedColour;
}
%end
%end

%group gOther
%hook UIColor
+ (id)systemBlueColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)systemRedColor {
    if (isCurrentApp(@"com.apple.mobilecal") || isCurrentApp(@"com.apple.mobiletimer")) {
        NSString *colourString = NULL;
		NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
		if(preferencesDictionary)
		{
			colourString = [preferencesDictionary objectForKey:@"customColour"];
		}

		UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
		return selectedColour;
    }
    return %orig;
}
+ (id)systemGreenColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)systemOrangeColor {
    if (!isCurrentApp(@"com.apple.mobilemail")) {
        NSString *colourString = NULL;
		NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
		if(preferencesDictionary)
		{
			colourString = [preferencesDictionary objectForKey:@"customColour"];
		}

		UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
		return selectedColour;
    }
    return %orig;
}
+ (id)systemYellowColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)systemTealColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)systemPinkColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)_systemInteractionTintColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)_systemSelectedColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)systemDarkRedColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)systemDarkGreenColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)systemDarkBlueColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)systemDarkOrangeColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)systemDarkTealColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)systemDarkPinkColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)systemDarkYellowColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)externalSystemTealColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)externalSystemRedColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)externalSystemGreenColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)tableCellBlueTextColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)linkColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)twitterColorTwitterBlue {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
+ (id)_systemBlueColor2 {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
%end

%hook UIApplication
- (id)keyWindow {
    UIWindow *o = %orig;
    if (!isCurrentApp(@"com.apple.weather")) {
        if (isCurrentApp(@"com.apple.camera") || isCurrentApp(@"com.apple.facetime") || isCurrentApp(@"com.apple.Passbook") || isCurrentApp(@"com.apple.compass") || isCurrentApp(@"com.apple.mobilenotes")) {       //[o.tintColor isEqual:[UIColor systemTealColor]] || [o.tintColor isEqual:[UIColor systemYellowColor]])
            NSString *colourString = NULL;
			NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
			if(preferencesDictionary)
			{
				colourString = [preferencesDictionary objectForKey:@"customColour"];
			}

			UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
			[o setTintColor:selectedColour];
        }
        else {
			NSString *colourString = NULL;
			NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
			if(preferencesDictionary)
			{
				colourString = [preferencesDictionary objectForKey:@"customColour"];
			}

			UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
            [o setTintColor:selectedColour];
        }
    }
    return o;
}
%end

%hook UISwitch
- (void)layoutSubviews {
    %orig;
	NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    [self setOnTintColor:selectedColour];
}
- (void)setOnTintColor:(id)col {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    col = selectedColour;
	%orig;
}
%end

%hook GKColorPalette
- (id)emphasizedTextColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
- (id)emphasizedTextOnDarkBackgroundColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
- (id)systemInteractionColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
%end

%hook GKUITheme
- (id)tabbarIconChallengesSelected : (BOOL)arg1 {
    return [%orig imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}
- (id)tabbarIconFriendsSelected:(BOOL)arg1 {
    return [%orig imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}
- (id)tabbarIconGamesSelected:(BOOL)arg1 {
    return [%orig imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}
- (id)tabbarIconMeSelected:(BOOL)arg1 {
    return [%orig imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}
- (id)tabbarIconTurnsSelected:(BOOL)arg1 {
    return [%orig imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}
%end

%hook SUApplication
- (id)interactionTintColor {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return selectedColour;
}
%end

%hook CKGradientView
- (id)colors {
    NSString *colourString = NULL;
    NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey:@"customColour"];
    }

    UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
    return [[NSArray alloc] initWithObjects:selectedColour,selectedColour,nil];
}
%end

%hook UIColor
+ (UIColor *)ICTintColor
{
    if (isCurrentApp(@"com.apple.mobilenotes")) {
        NSString *colourString = NULL;
		NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
		if(preferencesDictionary)
		{
			colourString = [preferencesDictionary objectForKey:@"customColour"];
		}

		UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
		return selectedColour;
    }
	return %orig;
}
+ (id)ICTintedSelectionColor
{
    if (isCurrentApp(@"com.apple.mobilenotes")) {
        CGFloat red, green, blue, alpha;
		NSString *colourString = NULL;
		NSDictionary *preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile:PreferencesFilePath];
		if(preferencesDictionary)
		{
			colourString = [preferencesDictionary objectForKey:@"customColour"];
		}

		UIColor *selectedColour = [SparkColourPickerUtils colourWithString:colourString withFallback:@"#FFC0CB"];
        [selectedColour getRed:&red green:&green blue:&blue alpha:&alpha];
        alpha = 0.3;
        return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
	return %orig;
}
%end
%end

%ctor {
    @autoreleasepool {
        setDict();
        if (enabled == 1) {
			if (isCurrentApp(@"com.apple.springboard")) {
            	if (lowPowerModeBatteryTint == 1) {
                    %init(gLowPowerMode);
                }
                if (chargingBatteryTint == 1) {
                    %init(gChargingMode);
                }
                if (controlCenterTint == 1) {
                    %init(gControlCenter);
                }
			} else {
				NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    			if([SparkAppList doesIdentifier:@"weeb.lillie.accentcustomprefs" andKey:@"excludedApps" containBundleIdentifier:bundleIdentifier]) {
					%init;
				}
				else {
					%init(gOther);
				}
			}
        }
    }
}