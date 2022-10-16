#line 1 "/Users/lovez/Desktop/AA/AA/app/Tweakio/Zebra.x"

#import <Cephei/HBPreferences.h>
#import "HookHeaders.h"
#import "Tweakio/TWMoreViewController.h"
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

@class ZBSearchTableViewController; @class ZBAppDelegate; 
static void (*_logos_orig$_ungrouped$ZBSearchTableViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL ZBSearchTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$ZBSearchTableViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL ZBSearchTableViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$ZBSearchTableViewController$openTweakio$(_LOGOS_SELF_TYPE_NORMAL ZBSearchTableViewController* _LOGOS_SELF_CONST, SEL, UIBarButtonItem *); 

#line 9 "/Users/lovez/Desktop/AA/AA/app/Tweakio/Zebra.x"


__attribute__((used)) static TweakioViewController * _logos_property$_ungrouped$ZBSearchTableViewController$tweakio(ZBSearchTableViewController * __unused self, SEL __unused _cmd) { return (TweakioViewController *)objc_getAssociatedObject(self, (void *)_logos_property$_ungrouped$ZBSearchTableViewController$tweakio); }; __attribute__((used)) static void _logos_property$_ungrouped$ZBSearchTableViewController$setTweakio(ZBSearchTableViewController * __unused self, SEL __unused _cmd, TweakioViewController * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$_ungrouped$ZBSearchTableViewController$tweakio, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static void _logos_method$_ungrouped$ZBSearchTableViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL ZBSearchTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$ZBSearchTableViewController$viewDidLoad(self, _cmd);

    HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:preferencesFileName];
	NSNumber *zebra = (NSNumber *)[prefs objectForKey:@"zebra"];
	NSNumber *hookingMethod = (NSNumber *)[prefs objectForKey:@"zebra hooking method"];
	if ((zebra && !zebra.boolValue) || (hookingMethod && hookingMethod.intValue != 1)) return;

	self.tweakio = [[TweakioViewController alloc] initWithPackageManager:@"Zebra"];

    UIBarButtonItem *tweakio = [[UIBarButtonItem alloc] initWithTitle:@"Tweakio" style:UIBarButtonItemStylePlain target:self action:@selector(openTweakio:)];
    [self.navigationItem setLeftBarButtonItem:tweakio];
}

 static void _logos_method$_ungrouped$ZBSearchTableViewController$openTweakio$(_LOGOS_SELF_TYPE_NORMAL ZBSearchTableViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIBarButtonItem * sender) {
	[self.tweakio setBackgroundColor:self.view.backgroundColor];

	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:preferencesFileName];
	NSNumber *animation = [prefs objectForKey:@"zebra animation"];

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

























































static BOOL (*_logos_orig$ZBiPhones$ZBAppDelegate$application$didFinishLaunchingWithOptions$)(_LOGOS_SELF_TYPE_NORMAL ZBAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); static BOOL _logos_method$ZBiPhones$ZBAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL ZBAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); 



static BOOL _logos_method$ZBiPhones$ZBAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL ZBAppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application, NSDictionary * launchOptions) {
	BOOL original = _logos_orig$ZBiPhones$ZBAppDelegate$application$didFinishLaunchingWithOptions$(self, _cmd, application, launchOptions);

	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:preferencesFileName];
	NSNumber *zebra = (NSNumber *)[prefs objectForKey:@"zebra"];
	NSNumber *hookingMethod = (NSNumber *)[prefs objectForKey:@"zebra hooking method"];
	if ((zebra && !zebra.boolValue) || (hookingMethod && hookingMethod.intValue != 0)) return original;

	if (original) {
		NSMutableArray<UINavigationController *> *controllers = [((UITabBarController *)self.window.rootViewController).viewControllers mutableCopy];
		TWMoreViewController *more = [[TWMoreViewController alloc] init];
		UINavigationController *navcont = [[UINavigationController alloc] initWithRootViewController:more];
		UITabBarItem *searchTabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:controllers.count];
		[navcont setTabBarItem:searchTabBarItem];

		TweakioViewController *tweakio = [[TweakioViewController alloc] initWithPackageManager:@"Zebra"];

		[more.viewControllers addObject:controllers.lastObject.viewControllers.firstObject];
		[more.viewControllers addObject:tweakio];

		[controllers removeObject:controllers.lastObject];
		[controllers addObject:navcont];

		[((UITabBarController *)self.window.rootViewController) setViewControllers:controllers];
	}
	return original;
}





static BOOL (*_logos_orig$ZBiPads$ZBAppDelegate$application$didFinishLaunchingWithOptions$)(_LOGOS_SELF_TYPE_NORMAL ZBAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); static BOOL _logos_method$ZBiPads$ZBAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL ZBAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); 



static BOOL _logos_method$ZBiPads$ZBAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL ZBAppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application, NSDictionary * launchOptions) {
	BOOL original = _logos_orig$ZBiPads$ZBAppDelegate$application$didFinishLaunchingWithOptions$(self, _cmd, application, launchOptions);

	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:preferencesFileName];
	NSNumber *zebra = (NSNumber *)[prefs objectForKey:@"zebra"];
	NSNumber *hookingMethod = (NSNumber *)[prefs objectForKey:@"zebra hooking method"];
	if ((zebra && !zebra.boolValue) || (hookingMethod && hookingMethod.intValue != 0)) return original;

	if (original) {
		NSMutableArray *controllers = [((UINavigationController *)self.window.rootViewController).viewControllers mutableCopy];
		UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:[[TweakioViewController alloc] initWithPackageManager:@"Zebra"]];

		NSBundle *bundle = [[NSBundle alloc] initWithPath:bundlePath];
		UIImage *icon = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"icon" ofType:@"png"]];
		UITabBarItem *tweakioTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Tweakio" image:icon selectedImage:icon];
		[navController setTabBarItem:tweakioTabBarItem];
		[controllers addObject:navController];

		[((UINavigationController *)self.window.rootViewController) setViewControllers:controllers];
	}

	return original;
}





static __attribute__((constructor)) void _logosLocalCtor_7ee34f56(int __unused argc, char __unused **argv, char __unused **envp) {
	{Class _logos_class$_ungrouped$ZBSearchTableViewController = objc_getClass("ZBSearchTableViewController"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"TweakioViewController\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$_ungrouped$ZBSearchTableViewController, "tweakio", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(TweakioViewController *)); class_addMethod(_logos_class$_ungrouped$ZBSearchTableViewController, @selector(tweakio), (IMP)&_logos_property$_ungrouped$ZBSearchTableViewController$tweakio, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(TweakioViewController *)); class_addMethod(_logos_class$_ungrouped$ZBSearchTableViewController, @selector(setTweakio:), (IMP)&_logos_property$_ungrouped$ZBSearchTableViewController$setTweakio, _typeEncoding); } { MSHookMessageEx(_logos_class$_ungrouped$ZBSearchTableViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$ZBSearchTableViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$ZBSearchTableViewController$viewDidLoad);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIBarButtonItem *), strlen(@encode(UIBarButtonItem *))); i += strlen(@encode(UIBarButtonItem *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$ZBSearchTableViewController, @selector(openTweakio:), (IMP)&_logos_method$_ungrouped$ZBSearchTableViewController$openTweakio$, _typeEncoding); }}
	if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {Class _logos_class$ZBiPads$ZBAppDelegate = objc_getClass("ZBAppDelegate"); { MSHookMessageEx(_logos_class$ZBiPads$ZBAppDelegate, @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$ZBiPads$ZBAppDelegate$application$didFinishLaunchingWithOptions$, (IMP*)&_logos_orig$ZBiPads$ZBAppDelegate$application$didFinishLaunchingWithOptions$);}}
	else {Class _logos_class$ZBiPhones$ZBAppDelegate = objc_getClass("ZBAppDelegate"); { MSHookMessageEx(_logos_class$ZBiPhones$ZBAppDelegate, @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$ZBiPhones$ZBAppDelegate$application$didFinishLaunchingWithOptions$, (IMP*)&_logos_orig$ZBiPhones$ZBAppDelegate$application$didFinishLaunchingWithOptions$);}}
}
