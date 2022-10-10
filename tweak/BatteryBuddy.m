#line 1 "/Users/lovez/Desktop/AA/AA/tweak/BatteryBuddy.x"
#import <UIKit/UIKit.h>
UIImageView* batteryIconView;
UIImageView* batteryChargerView;
UIImageView* LSBatteryIconView;
UIImageView* LSBatteryChargerView;
BOOL isCharging = NO;
BOOL isLowPowerModeActive = NO;

@interface _UIBatteryView : UIView
- (CGFloat)chargePercent;
- (long long)chargingState;
- (void)refreshIcon;
- (void)updateIconColor;
@end


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

@class CSBatteryFillView; @class _UIBatteryView; @class NSProcessInfo; 


#line 16 "/Users/lovez/Desktop/AA/AA/tweak/BatteryBuddy.x"
@interface CSBatteryFillView : UIView
@end
static BOOL (*_logos_orig$BatteryBuddy$_UIBatteryView$_shouldShowBolt)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$BatteryBuddy$_UIBatteryView$_shouldShowBolt(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static UIColor * (*_logos_orig$BatteryBuddy$_UIBatteryView$fillColor)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static UIColor * _logos_method$BatteryBuddy$_UIBatteryView$fillColor(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static CGFloat (*_logos_orig$BatteryBuddy$_UIBatteryView$chargePercent)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$BatteryBuddy$_UIBatteryView$chargePercent(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static long long (*_logos_orig$BatteryBuddy$_UIBatteryView$chargingState)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static long long _logos_method$BatteryBuddy$_UIBatteryView$chargingState(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$BatteryBuddy$_UIBatteryView$_updateFillLayer)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static void _logos_method$BatteryBuddy$_UIBatteryView$_updateFillLayer(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static void _logos_method$BatteryBuddy$_UIBatteryView$refreshIcon(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static void _logos_method$BatteryBuddy$_UIBatteryView$updateIconColor(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$BatteryBuddy$CSBatteryFillView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL CSBatteryFillView* _LOGOS_SELF_CONST, SEL); static void _logos_method$BatteryBuddy$CSBatteryFillView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL CSBatteryFillView* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled)(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); 



static BOOL _logos_method$BatteryBuddy$_UIBatteryView$_shouldShowBolt(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	return NO;

}

static UIColor * _logos_method$BatteryBuddy$_UIBatteryView$fillColor(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	return [_logos_orig$BatteryBuddy$_UIBatteryView$fillColor(self, _cmd) colorWithAlphaComponent:0.25];
	
}

static CGFloat _logos_method$BatteryBuddy$_UIBatteryView$chargePercent(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	CGFloat orig = _logos_orig$BatteryBuddy$_UIBatteryView$chargePercent(self, _cmd);
	int actualPercentage = orig * 100;

	if (actualPercentage <= 20 && !isCharging)
		[batteryIconView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/sad.png"]];
	else if (actualPercentage <= 49 && !isCharging)
		[batteryIconView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/neutral.png"]];
	else if (actualPercentage > 49 && !isCharging)
		[batteryIconView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/happy.png"]];
	else if (isCharging)
		[batteryIconView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/happy.png"]];

	[self updateIconColor];

	return orig;

}

static long long _logos_method$BatteryBuddy$_UIBatteryView$chargingState(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	long long orig = _logos_orig$BatteryBuddy$_UIBatteryView$chargingState(self, _cmd);

	if (orig == 1) isCharging = YES;
	else isCharging = NO;

	[self refreshIcon];
	
	return orig;

}

static void _logos_method$BatteryBuddy$_UIBatteryView$_updateFillLayer(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	_logos_orig$BatteryBuddy$_UIBatteryView$_updateFillLayer(self, _cmd);

	[self chargingState];

}


static void _logos_method$BatteryBuddy$_UIBatteryView$refreshIcon(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 
	
	
	batteryIconView = nil;
	batteryChargerView = nil;
	for (UIImageView* imageView in [self subviews])
		[imageView removeFromSuperview];

	
	if (!batteryIconView) {
		batteryIconView = [[UIImageView alloc] initWithFrame:[self bounds]];
		[batteryIconView setContentMode:UIViewContentModeScaleAspectFill];
		[batteryIconView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		if (![batteryIconView isDescendantOfView:self]) [self addSubview:batteryIconView];
	}

	
	if (!batteryChargerView && isCharging) {
		batteryChargerView = [[UIImageView alloc] initWithFrame:[self bounds]];
		[batteryChargerView setContentMode:UIViewContentModeScaleAspectFill];
		[batteryChargerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[batteryChargerView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/charger.png"]];
		if (![batteryChargerView isDescendantOfView:self]) [self addSubview:batteryChargerView];
	}

	[self chargePercent];

}


static void _logos_method$BatteryBuddy$_UIBatteryView$updateIconColor(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	batteryIconView.image = [batteryIconView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	batteryChargerView.image = [batteryChargerView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	if (!isLowPowerModeActive) {
		[batteryIconView setTintColor:[UIColor labelColor]];
		[batteryChargerView setTintColor:[UIColor labelColor]];
	} else {
		[batteryIconView setTintColor:[UIColor blackColor]];
		[batteryChargerView setTintColor:[UIColor blackColor]];
	}

}





static void _logos_method$BatteryBuddy$CSBatteryFillView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL CSBatteryFillView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	_logos_orig$BatteryBuddy$CSBatteryFillView$didMoveToWindow(self, _cmd);

	[[self superview] setClipsToBounds:NO];

	
	if (!LSBatteryIconView) {
		LSBatteryIconView = [[UIImageView alloc] initWithFrame:[self bounds]];
		[LSBatteryIconView setContentMode:UIViewContentModeScaleAspectFill];
		[LSBatteryIconView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[LSBatteryIconView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/happyLS.png"]];
	}
	LSBatteryIconView.image = [LSBatteryIconView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	[LSBatteryIconView setTintColor:[UIColor whiteColor]];
	if (![LSBatteryIconView isDescendantOfView:[self superview]]) [[self superview] addSubview:LSBatteryIconView];

	
	if (!LSBatteryChargerView) {
		LSBatteryChargerView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x - 25, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
		[LSBatteryChargerView setContentMode:UIViewContentModeScaleAspectFill];
		[LSBatteryChargerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[LSBatteryChargerView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/chargerLS.png"]];
	}
	LSBatteryChargerView.image = [LSBatteryChargerView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	[LSBatteryChargerView setTintColor:[UIColor whiteColor]];
	if (![LSBatteryChargerView isDescendantOfView:[self superview]]) [[self superview] addSubview:LSBatteryChargerView];

}





static BOOL _logos_method$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	isLowPowerModeActive = _logos_orig$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled(self, _cmd);

	return isLowPowerModeActive;

}





static __attribute__((constructor)) void _logosLocalCtor_b2403fe0(int __unused argc, char __unused **argv, char __unused **envp) {

	{Class _logos_class$BatteryBuddy$_UIBatteryView = objc_getClass("_UIBatteryView"); { MSHookMessageEx(_logos_class$BatteryBuddy$_UIBatteryView, @selector(_shouldShowBolt), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$_shouldShowBolt, (IMP*)&_logos_orig$BatteryBuddy$_UIBatteryView$_shouldShowBolt);}{ MSHookMessageEx(_logos_class$BatteryBuddy$_UIBatteryView, @selector(fillColor), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$fillColor, (IMP*)&_logos_orig$BatteryBuddy$_UIBatteryView$fillColor);}{ MSHookMessageEx(_logos_class$BatteryBuddy$_UIBatteryView, @selector(chargePercent), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$chargePercent, (IMP*)&_logos_orig$BatteryBuddy$_UIBatteryView$chargePercent);}{ MSHookMessageEx(_logos_class$BatteryBuddy$_UIBatteryView, @selector(chargingState), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$chargingState, (IMP*)&_logos_orig$BatteryBuddy$_UIBatteryView$chargingState);}{ MSHookMessageEx(_logos_class$BatteryBuddy$_UIBatteryView, @selector(_updateFillLayer), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$_updateFillLayer, (IMP*)&_logos_orig$BatteryBuddy$_UIBatteryView$_updateFillLayer);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$BatteryBuddy$_UIBatteryView, @selector(refreshIcon), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$refreshIcon, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$BatteryBuddy$_UIBatteryView, @selector(updateIconColor), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$updateIconColor, _typeEncoding); }Class _logos_class$BatteryBuddy$CSBatteryFillView = objc_getClass("CSBatteryFillView"); { MSHookMessageEx(_logos_class$BatteryBuddy$CSBatteryFillView, @selector(didMoveToWindow), (IMP)&_logos_method$BatteryBuddy$CSBatteryFillView$didMoveToWindow, (IMP*)&_logos_orig$BatteryBuddy$CSBatteryFillView$didMoveToWindow);}Class _logos_class$BatteryBuddy$NSProcessInfo = objc_getClass("NSProcessInfo"); { MSHookMessageEx(_logos_class$BatteryBuddy$NSProcessInfo, @selector(isLowPowerModeEnabled), (IMP)&_logos_method$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled, (IMP*)&_logos_orig$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled);}}

}
