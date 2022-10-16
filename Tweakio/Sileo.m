#line 1 "/Users/lovez/Desktop/AA/AA/app/Tweakio/Sileo.x"
#import <objc/runtime.h>
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

@class SileoAppDelegate; @class _TtC5Sileo25PackageListViewController; 
static void (*_logos_orig$_ungrouped$SileoAppDelegate$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIApplication *); static void _logos_method$_ungrouped$SileoAppDelegate$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIApplication *); static void (*_logos_orig$_ungrouped$_TtC5Sileo25PackageListViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL _TtC5Sileo25PackageListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$_TtC5Sileo25PackageListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL _TtC5Sileo25PackageListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$_TtC5Sileo25PackageListViewController$openTweakio$(_LOGOS_SELF_TYPE_NORMAL _TtC5Sileo25PackageListViewController* _LOGOS_SELF_CONST, SEL, UIBarButtonItem *); 

#line 9 "/Users/lovez/Desktop/AA/AA/app/Tweakio/Sileo.x"


static void _logos_method$_ungrouped$SileoAppDelegate$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application) {
	_logos_orig$_ungrouped$SileoAppDelegate$applicationDidFinishLaunching$(self, _cmd, application);

	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:preferencesFileName];
	NSNumber *sileo = (NSNumber *)[prefs objectForKey:@"sileo"];
	NSNumber *hookingMethod = (NSNumber *)[prefs objectForKey:@"sileo hooking method"];
	if ((sileo && !sileo.boolValue) || (hookingMethod && hookingMethod.intValue != 0)) return;
	
    UIWindow *window = [self performSelector:@selector(window)];
    NSMutableArray<UINavigationController *> *controllers = [((UITabBarController *)window.rootViewController).viewControllers mutableCopy];

    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        TweakioViewController *tweakio = [[TweakioViewController alloc] initWithPackageManager:@"Sileo"];
        UINavigationController *navController = (UINavigationController *)[[NSClassFromString(@"Sileo.SileoNavigationController") alloc] initWithRootViewController:tweakio];
        NSBundle *bundle = [[NSBundle alloc] initWithPath:bundlePath];
        UIImage *icon = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"icon" ofType:@"png"]];
        UITabBarItem *tweakioTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Tweakio" image:icon selectedImage:icon];
        [navController setTabBarItem:tweakioTabBarItem];
        [controllers addObject:navController];
    } else {
        TWMoreViewController *more = [[TWMoreViewController alloc] init];
        UINavigationController *navcont = (UINavigationController *)[[NSClassFromString(@"Sileo.SileoNavigationController") alloc] initWithRootViewController:more];
        UITabBarItem *searchTabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:controllers.count];
        [navcont setTabBarItem:searchTabBarItem];

        TweakioViewController *tweakio = [[TweakioViewController alloc] initWithPackageManager:@"Sileo"];
        [more.viewControllers addObject:controllers.lastObject.viewControllers.firstObject];
        [more.viewControllers addObject:tweakio];

        [controllers removeObject:controllers.lastObject];
        [controllers addObject:navcont];
    }

	
    [((UITabBarController *)window.rootViewController) setViewControllers:controllers];
    [self performSelector:@selector(setWindow:) withObject:window];
}





__attribute__((used)) static TweakioViewController * _logos_property$_ungrouped$_TtC5Sileo25PackageListViewController$tweakio(_TtC5Sileo25PackageListViewController * __unused self, SEL __unused _cmd) { return (TweakioViewController *)objc_getAssociatedObject(self, (void *)_logos_property$_ungrouped$_TtC5Sileo25PackageListViewController$tweakio); }; __attribute__((used)) static void _logos_property$_ungrouped$_TtC5Sileo25PackageListViewController$setTweakio(_TtC5Sileo25PackageListViewController * __unused self, SEL __unused _cmd, TweakioViewController * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$_ungrouped$_TtC5Sileo25PackageListViewController$tweakio, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static void _logos_method$_ungrouped$_TtC5Sileo25PackageListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL _TtC5Sileo25PackageListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$_TtC5Sileo25PackageListViewController$viewDidLoad(self, _cmd);

    HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:preferencesFileName];
	NSNumber *sileo = (NSNumber *)[prefs objectForKey:@"sileo"];
    NSNumber *hookingMethod = (NSNumber *)[prefs objectForKey:@"sileo hooking method"];
	if ((sileo && !sileo.boolValue) || (hookingMethod && hookingMethod.intValue != 1) || (NSObject *)object_getIvar(self, class_getInstanceVariable(self.class, "repoContext")) || self.showWishlist || [self.packagesLoadIdentifier containsString:@"wishlist"]) return;

    self.tweakio = [[TweakioViewController alloc] initWithPackageManager:@"Sileo"];

    UIBarButtonItem *tweakio = [[UIBarButtonItem alloc] initWithTitle:@"Tweakio" style:UIBarButtonItemStylePlain target:self action:@selector(openTweakio:)];
    [self.navigationItem setLeftBarButtonItem:tweakio];
}

 static void _logos_method$_ungrouped$_TtC5Sileo25PackageListViewController$openTweakio$(_LOGOS_SELF_TYPE_NORMAL _TtC5Sileo25PackageListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIBarButtonItem * sender) {
	[self.tweakio setBackgroundColor:self.view.backgroundColor];

	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:preferencesFileName];
	NSNumber *animation = [prefs objectForKey:@"sileo animation"];

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




static __attribute__((constructor)) void _logosLocalCtor_de8539e1(int __unused argc, char __unused **argv, char __unused **envp) {
    {Class _logos_class$_ungrouped$SileoAppDelegate = NSClassFromString(@"Sileo.SileoAppDelegate"); { MSHookMessageEx(_logos_class$_ungrouped$SileoAppDelegate, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SileoAppDelegate$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SileoAppDelegate$applicationDidFinishLaunching$);}Class _logos_class$_ungrouped$_TtC5Sileo25PackageListViewController = objc_getClass("_TtC5Sileo25PackageListViewController"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"TweakioViewController\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$_ungrouped$_TtC5Sileo25PackageListViewController, "tweakio", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(TweakioViewController *)); class_addMethod(_logos_class$_ungrouped$_TtC5Sileo25PackageListViewController, @selector(tweakio), (IMP)&_logos_property$_ungrouped$_TtC5Sileo25PackageListViewController$tweakio, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(TweakioViewController *)); class_addMethod(_logos_class$_ungrouped$_TtC5Sileo25PackageListViewController, @selector(setTweakio:), (IMP)&_logos_property$_ungrouped$_TtC5Sileo25PackageListViewController$setTweakio, _typeEncoding); } { MSHookMessageEx(_logos_class$_ungrouped$_TtC5Sileo25PackageListViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$_TtC5Sileo25PackageListViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$_TtC5Sileo25PackageListViewController$viewDidLoad);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIBarButtonItem *), strlen(@encode(UIBarButtonItem *))); i += strlen(@encode(UIBarButtonItem *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$_TtC5Sileo25PackageListViewController, @selector(openTweakio:), (IMP)&_logos_method$_ungrouped$_TtC5Sileo25PackageListViewController$openTweakio$, _typeEncoding); }}
}
