#line 1 "/Users/lovez/Desktop/AA/AA/app/AppStoreUpdatesTab13/AppStoreUpdatesTab13.xm"
#import "AppStoreUpdatesTab13.h"


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

@class UITabBar; @class UIApplication; @class UITabBarButton; 
static void (*_logos_orig$_ungrouped$UITabBar$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UITabBar$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UITabBar$openUpdates(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$UIApplication(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("UIApplication"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$UITabBarButton(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("UITabBarButton"); } return _klass; }
#line 3 "/Users/lovez/Desktop/AA/AA/app/AppStoreUpdatesTab13/AppStoreUpdatesTab13.xm"



static void _logos_method$_ungrouped$UITabBar$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$UITabBar$layoutSubviews(self, _cmd);

	for(UIView *subview in [self subviews])
	{
		if([subview isKindOfClass: _logos_static_class_lookup$UITabBarButton()])
		{
			UITabBarButton *button = (UITabBarButton*)subview;
			UITabBarButtonLabel *_label = MSHookIvar<UITabBarButtonLabel*> (button, "_label");
			
			if([[_label text] isEqualToString: @"Arcade"])
			{
				[_label setText: @"Updates"];

				UITabBarSwappableImageView *_imageView = MSHookIvar<UITabBarSwappableImageView*> (button, "_imageView");
				_imageView.image = [UIImage imageNamed: @"UpdatesTabIcon-38-56-" inBundle: bundle compatibleWithTraitCollection: nil];
				
				UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(openUpdates)];
				[button addGestureRecognizer: gr];
			}
		}
	}
}



static void _logos_method$_ungrouped$UITabBar$openUpdates(_LOGOS_SELF_TYPE_NORMAL UITabBar* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	UIApplication *application = [_logos_static_class_lookup$UIApplication() sharedApplication];

	[application openURL: [NSURL URLWithString: @"itms-apps://apps.apple.com/updates"]];
}



static __attribute__((constructor)) void _logosLocalCtor_d67d8ab4(int __unused argc, char __unused **argv, char __unused **envp)
{
	bundle = [[NSBundle alloc] initWithPath: kBundlePath];
	
	{Class _logos_class$_ungrouped$UITabBar = objc_getClass("UITabBar"); { MSHookMessageEx(_logos_class$_ungrouped$UITabBar, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$UITabBar$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$UITabBar$layoutSubviews);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$UITabBar, @selector(openUpdates), (IMP)&_logos_method$_ungrouped$UITabBar$openUpdates, _typeEncoding); }}
}
