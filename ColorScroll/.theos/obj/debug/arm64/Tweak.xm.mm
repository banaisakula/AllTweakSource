#line 1 "Tweak.xm"
#import <libcolorpicker.h>

static UIColor *customColor;
static BOOL enabled, retainAlpha;

static void setupPrefs() {
	NSDictionary *settings;

	CFArrayRef keyList = CFPreferencesCopyKeyList(CFSTR("com.shepgoba.colorscrollprefs"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
	if (keyList) {
		settings = (NSMutableDictionary *)CFBridgingRelease(CFPreferencesCopyMultiple(keyList, CFSTR("com.shepgoba.colorscrollprefs"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost));
		CFRelease(keyList);
	} else {
		settings = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.shepgoba.colorscrollprefs.plist"];
	}

	enabled = [([settings objectForKey:@"enabled"] ? [settings objectForKey:@"enabled"] : @(YES)) boolValue];
	retainAlpha = [([settings objectForKey:@"retainAlpha"] ? [settings objectForKey:@"retainAlpha"] : @(YES)) boolValue];

	NSDictionary *colors = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.shepgoba.colorscrollprefs.color.plist"];
	customColor = LCPParseColorString([colors objectForKey:@"scrollIndicatorColor"], @"#FFFFFF");
}

@interface UIScrollView (stuff)
@property (getter=_verticalScrollIndicator,nonatomic,readonly) UIView * verticalScrollIndicator; 
@property (getter=_horizontalScrollIndicator,nonatomic,readonly) UIView * horizontalScrollIndicator; 
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

@class UIScrollView; @class _UIScrollViewScrollIndicator; 


#line 29 "Tweak.xm"
static id (*_logos_orig$Tweak13$_UIScrollViewScrollIndicator$_colorForStyle$)(_LOGOS_SELF_TYPE_NORMAL _UIScrollViewScrollIndicator* _LOGOS_SELF_CONST, SEL, long long); static id _logos_method$Tweak13$_UIScrollViewScrollIndicator$_colorForStyle$(_LOGOS_SELF_TYPE_NORMAL _UIScrollViewScrollIndicator* _LOGOS_SELF_CONST, SEL, long long); 
 
static id _logos_method$Tweak13$_UIScrollViewScrollIndicator$_colorForStyle$(_LOGOS_SELF_TYPE_NORMAL _UIScrollViewScrollIndicator* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {

	CGFloat red, green, blue, alpha;
	[customColor getRed:&red green:&green blue:&blue alpha:&alpha];

	if (retainAlpha) {
		UIColor *orig = _logos_orig$Tweak13$_UIScrollViewScrollIndicator$_colorForStyle$(self, _cmd, arg1);

		CGFloat origAlpha;
		[orig getRed:NULL green:NULL blue:NULL alpha:&origAlpha];
		alpha = origAlpha;
	}

	return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}



static void (*_logos_orig$Tweak12$UIScrollView$addSubview$)(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST, SEL, UIView *); static void _logos_method$Tweak12$UIScrollView$addSubview$(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST, SEL, UIView *); 

static void _logos_method$Tweak12$UIScrollView$addSubview$(_LOGOS_SELF_TYPE_NORMAL UIScrollView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIView * view) {
	_logos_orig$Tweak12$UIScrollView$addSubview$(self, _cmd, view);
	if ([view isMemberOfClass:[UIImageView class]] && CGSizeEqualToSize(view.frame.size, CGSizeMake(2.5, 2.5))) {
		UIImageView *imgView = (UIImageView *)view;
		if (retainAlpha) {
			imgView.image = [imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
			[imgView setTintColor:customColor];
		} else {
			imgView.backgroundColor = customColor;
			imgView.layer.cornerRadius = 1.5;
			imgView.image = nil;
		}
	}
}



static __attribute__((constructor)) void _logosLocalCtor_7ea7e065(int __unused argc, char __unused **argv, char __unused **envp) {
	setupPrefs();
	if (enabled) {
		if (@available(iOS 13, *)) {
			{Class _logos_class$Tweak13$_UIScrollViewScrollIndicator = objc_getClass("_UIScrollViewScrollIndicator"); { MSHookMessageEx(_logos_class$Tweak13$_UIScrollViewScrollIndicator, @selector(_colorForStyle:), (IMP)&_logos_method$Tweak13$_UIScrollViewScrollIndicator$_colorForStyle$, (IMP*)&_logos_orig$Tweak13$_UIScrollViewScrollIndicator$_colorForStyle$);}}
		} else {
			{Class _logos_class$Tweak12$UIScrollView = objc_getClass("UIScrollView"); { MSHookMessageEx(_logos_class$Tweak12$UIScrollView, @selector(addSubview:), (IMP)&_logos_method$Tweak12$UIScrollView$addSubview$, (IMP*)&_logos_orig$Tweak12$UIScrollView$addSubview$);}}
		}
	}
}
