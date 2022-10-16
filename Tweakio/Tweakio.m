#line 1 "/Users/lovez/Desktop/AA/AA/app/Tweakio/Tweakio.x"
#import <Cephei/HBPreferences.h>
#import "HookHeaders.h"
#define preferencesFileName @"com.spartacus.tweakioprefs.plist"



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

@class TWAppDelegate; 
static void (*_logos_orig$_ungrouped$TWAppDelegate$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL TWAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *); static void _logos_method$_ungrouped$TWAppDelegate$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL TWAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication *); 

#line 6 "/Users/lovez/Desktop/AA/AA/app/Tweakio/Tweakio.x"


static void _logos_method$_ungrouped$TWAppDelegate$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL TWAppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application) {
    _logos_orig$_ungrouped$TWAppDelegate$applicationDidFinishLaunching$(self, _cmd, application);
    [self.window setRootViewController:[[UINavigationController alloc] initWithRootViewController:[[TweakioViewController alloc] initWithPackageManager:@"Tweakio"]]];
    [self.window makeKeyAndVisible];
}



static __attribute__((constructor)) void _logosLocalCtor_5abf691f(int __unused argc, char __unused **argv, char __unused **envp) {
    HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:preferencesFileName];

	if (![prefs objectForKey:@"Cydia API"]) [prefs setObject:@0 forKey:@"Cydia API"];
	if (![prefs objectForKey:@"Zebra API"]) [prefs setObject:@0 forKey:@"Zebra API"];
	if (![prefs objectForKey:@"Installer API"]) [prefs setObject:@0 forKey:@"Installer API"];
	if (![prefs objectForKey:@"Sileo API"]) [prefs setObject:@0 forKey:@"Sileo API"];
    if (![prefs objectForKey:@"Tweakio API"]) [prefs setObject:@0 forKey:@"Tweakio API"];
	
	if (![prefs objectForKey:@"cydia hooking method"]) [prefs setObject:@0 forKey:@"cydia hooking method"];
	if (![prefs objectForKey:@"zebra hooking method"]) [prefs setObject:@0 forKey:@"zebra hooking method"];
	if (![prefs objectForKey:@"installer hooking method"]) [prefs setObject:@0 forKey:@"installer hooking method"];
	if (![prefs objectForKey:@"sileo hooking method"]) [prefs setObject:@0 forKey:@"sileo hooking method"];
	
	if (![prefs objectForKey:@"cydia animation"]) [prefs setObject:@YES forKey:@"cydia animation"];
	if (![prefs objectForKey:@"zebra animation"]) [prefs setObject:@YES forKey:@"zebra animation"];
	if (![prefs objectForKey:@"installer animation"]) [prefs setObject:@YES forKey:@"installer animation"];
	if (![prefs objectForKey:@"sileo animation"]) [prefs setObject:@YES forKey:@"sileo animation"];

	if (![prefs objectForKey:@"cydia legacy"]) [prefs setObject:@NO forKey:@"cydia legacy"];
	if (![prefs objectForKey:@"zebra legacy"]) [prefs setObject:@NO forKey:@"zebra legacy"];
	if (![prefs objectForKey:@"installer legacy"]) [prefs setObject:@NO forKey:@"installer legacy"];
	if (![prefs objectForKey:@"sileo legacy"]) [prefs setObject:@NO forKey:@"sileo legacy"];
	if (![prefs objectForKey:@"tweakio legacy"]) [prefs setObject:@NO forKey:@"tweakio legacy"];    
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$TWAppDelegate = objc_getClass("TWAppDelegate"); { MSHookMessageEx(_logos_class$_ungrouped$TWAppDelegate, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$TWAppDelegate$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$TWAppDelegate$applicationDidFinishLaunching$);}} }
#line 41 "/Users/lovez/Desktop/AA/AA/app/Tweakio/Tweakio.x"
