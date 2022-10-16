#line 1 "/Users/lovez/Desktop/AA/AA/app/Tweakio/Cydia.x"
#import <objc/runtime.h>
#import <Cephei/HBPreferences.h>
#import "HookHeaders.h"
#define preferencesFileName @"com.spartacus.tweakioprefs.plist"
#define bundlePath @"/Library/MobileSubstrate/DynamicLibraries/com.spartacus.tweakio.bundle"



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

@class SearchController; @class Cydia; 
static void (*_logos_orig$_ungrouped$SearchController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SearchController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SearchController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SearchController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SearchController$openTweakio$(_LOGOS_SELF_TYPE_NORMAL SearchController* _LOGOS_SELF_CONST, SEL, UIBarButtonItem *); static void (*_logos_orig$_ungrouped$Cydia$loadData)(_LOGOS_SELF_TYPE_NORMAL Cydia* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$Cydia$loadData(_LOGOS_SELF_TYPE_NORMAL Cydia* _LOGOS_SELF_CONST, SEL); 

#line 8 "/Users/lovez/Desktop/AA/AA/app/Tweakio/Cydia.x"


__attribute__((used)) static TweakioViewController * _logos_property$_ungrouped$SearchController$tweakio(SearchController * __unused self, SEL __unused _cmd) { return (TweakioViewController *)objc_getAssociatedObject(self, (void *)_logos_property$_ungrouped$SearchController$tweakio); }; __attribute__((used)) static void _logos_property$_ungrouped$SearchController$setTweakio(SearchController * __unused self, SEL __unused _cmd, TweakioViewController * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$_ungrouped$SearchController$tweakio, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static void _logos_method$_ungrouped$SearchController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SearchController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$SearchController$viewDidLoad(self, _cmd);

    HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:preferencesFileName];
	NSNumber *cydia = (NSNumber *)[prefs objectForKey:@"cydia"];
	NSNumber *hookingMethod = (NSNumber *)[prefs objectForKey:@"cydia hooking method"];
	if ((cydia && !cydia.boolValue) || (hookingMethod && hookingMethod.intValue != 1)) return;

	self.tweakio = [[TweakioViewController alloc] initWithPackageManager:@"Cydia"];

    UIBarButtonItem *tweakio = [[UIBarButtonItem alloc] initWithTitle:@"Tweakio" style:UIBarButtonItemStylePlain target:self action:@selector(openTweakio:)];
    [self.navigationItem setLeftBarButtonItem:tweakio];
}

 static void _logos_method$_ungrouped$SearchController$openTweakio$(_LOGOS_SELF_TYPE_NORMAL SearchController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIBarButtonItem * sender) {
	[self.tweakio setBackgroundColor:self.view.backgroundColor];

	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:preferencesFileName];
	NSNumber *animation = [prefs objectForKey:@"cydia animation"];

	if (animation && !animation.boolValue) {
		[self.navigationController pushViewController:self.tweakio animated:NO];
		return;
	}
	
    CATransition *transition = [[CATransition alloc] init];
	[transition setDuration:0.3];
	[transition setType:@"flip"];
	[transition setSubtype:kCATransitionFromLeft];
	[self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
	
	[self.navigationController pushViewController:self.tweakio animated:NO];
}






static void _logos_method$_ungrouped$Cydia$loadData(_LOGOS_SELF_TYPE_NORMAL Cydia* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$Cydia$loadData(self, _cmd);

	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:preferencesFileName];
	NSNumber *cydia = (NSNumber *)[prefs objectForKey:@"cydia"];
	NSNumber *hookingMethod = (NSNumber *)[prefs objectForKey:@"cydia hooking method"];
	if ((cydia && !cydia.boolValue) || (hookingMethod && hookingMethod.intValue != 0)) return;

	UIWindow *window = (UIWindow *)object_getIvar(self, class_getInstanceVariable([self class], "window_"));

	if (((UINavigationController *)(window.rootViewController)).viewControllers.count < 6) {
		NSMutableArray<UINavigationController *> *controllers = [((UINavigationController *)window.rootViewController).viewControllers mutableCopy];

		TweakioViewController *tweakio = [[TweakioViewController alloc] initWithPackageManager:@"Cydia"];
		
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tweakio];
		NSBundle *bundle = [[NSBundle alloc] initWithPath:bundlePath];
		UIImage *icon = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"icon" ofType:@"png"]];
		UITabBarItem *tweakioTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Tweakio" image:icon selectedImage:icon];
		[navController setTabBarItem:tweakioTabBarItem];

		[controllers addObject:navController];
		[(UINavigationController *)(window.rootViewController) setViewControllers:[controllers copy]];
	}
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SearchController = objc_getClass("SearchController"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"TweakioViewController\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$_ungrouped$SearchController, "tweakio", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(TweakioViewController *)); class_addMethod(_logos_class$_ungrouped$SearchController, @selector(tweakio), (IMP)&_logos_property$_ungrouped$SearchController$tweakio, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(TweakioViewController *)); class_addMethod(_logos_class$_ungrouped$SearchController, @selector(setTweakio:), (IMP)&_logos_property$_ungrouped$SearchController$setTweakio, _typeEncoding); } { MSHookMessageEx(_logos_class$_ungrouped$SearchController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SearchController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SearchController$viewDidLoad);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIBarButtonItem *), strlen(@encode(UIBarButtonItem *))); i += strlen(@encode(UIBarButtonItem *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SearchController, @selector(openTweakio:), (IMP)&_logos_method$_ungrouped$SearchController$openTweakio$, _typeEncoding); }Class _logos_class$_ungrouped$Cydia = objc_getClass("Cydia"); { MSHookMessageEx(_logos_class$_ungrouped$Cydia, @selector(loadData), (IMP)&_logos_method$_ungrouped$Cydia$loadData, (IMP*)&_logos_orig$_ungrouped$Cydia$loadData);}} }
#line 78 "/Users/lovez/Desktop/AA/AA/app/Tweakio/Cydia.x"
