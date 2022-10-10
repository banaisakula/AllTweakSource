#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MediaRemote/MediaRemote.h>
#import <Kitten/libKitten.h>
#import "SparkColourPickerUtils.h"
#import <Cephei/HBPreferences.h>

HBPreferences* preferences;
NSDictionary* preferencesDictionary;

extern BOOL enabled;

BOOL isDNDActive = NO;
BOOL isRoundLockScreenInstalled;
UIImageView* luneView;
UIView* luneDarkeningView;
UIImage* currentArtwork;
UIColor* backgroundArtworkColor;

// icon
NSString* xPositionValue = @"150.0";
NSString* yPositionValue = @"100.0";
NSString* sizeValue = @"50.0";
NSString* iconValue = @"0";

// glow
BOOL glowSwitch = YES;
BOOL useCustomGlowColorSwitch = NO;
NSString* glowRadiusValue = @"10.0";
NSString* glowAlphaValue = @"1.0";

// color
BOOL useCustomColorSwitch = NO;
BOOL useArtworkBasedColorSwitch = YES;

// background
BOOL darkenBackgroundSwitch = YES;
NSString* darkeningAmountValue = @"0.5";

// miscellaneous
BOOL hideDNDBannerSwitch = NO;

@interface SBFLockScreenDateView : UIView
@end

@interface CSCoverSheetViewController : UIViewController
@end