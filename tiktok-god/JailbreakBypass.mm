#line 1 "/Users/lovez/Desktop/AA/AA/app/tiktok-god/JailbreakBypass.xm"








#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



NSArray *jailbreakPaths = @[
    
    @"/Applications/Cydia.app", @"/Applications/blackra1n.app",
    @"/Applications/FakeCarrier.app", @"/Applications/Icy.app",
    @"/Applications/IntelliScreen.app", @"/Applications/MxTube.app",
    @"/Applications/RockApp.app", @"/Applications/SBSettings.app", @"/Applications/WinterBoard.app",

    
    @"/.cydia_no_stash", @"/.installed_unc0ver", @"/.bootstrapped_electra",

    
    @"/usr/libexec/cydia/firmware.sh", @"/usr/libexec/ssh-keysign", @"/usr/libexec/sftp-server",
    @"/usr/bin/ssh", @"/usr/bin/sshd", @"/usr/sbin/sshd",

    
    @"/var/lib/cydia", @"/var/lib/dpkg/info/mobilesubstrate.md5sums",
    @"/var/log/apt", @"/usr/share/jailbreak/injectme.plist", @"/usr/sbin/frida-server",

    
    @"/Library/MobileSubstrate/CydiaSubstrate.dylib", @"/Library/TweakInject",
    @"/Library/MobileSubstrate/MobileSubstrate.dylib", @"Library/MobileSubstrate/MobileSubstrate.dylib",
    @"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist", @"/Library/MobileSubstrate/DynamicLibraries/Veency.plist",

    
    @"/System/Library/LaunchDaemons/com.ikey.bbot.plist", @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist", @"/System/Library/CoreServices/SystemVersion.plist",

    
    @"/private/var/mobile/Library/SBSettings/Themes", @"/private/var/lib/cydia",
    @"/private/var/tmp/cydia.log", @"/private/var/log/syslog",
    @"/private/var/cache/apt/", @"/private/var/lib/apt",
    @"/private/var/Users/", @"/private/var/stash",

    
    @"/usr/lib/libjailbreak.dylib", @"/usr/lib/libz.dylib",
    @"/usr/lib/system/introspectionNSZombieEnabled",
    @"/usr/lib/dyld",

    
    @"/jb/amfid_payload.dylib", @"/jb/libjailbreak.dylib",
    @"/jb/jailbreakd.plist", @"/jb/offsets.plist",
    @"/jb/lzma",

    
    @"/hmd_tmp_file",

    
    @"/etc/ssh/sshd_config", @"/etc/apt/undecimus/undecimus.list",
    @"/etc/apt/sources.list.d/sileo.sources", @"/etc/apt/sources.list.d/electra.list",
    @"/etc/apt", @"/etc/ssl/certs", @"/etc/ssl/cert.pem",

    
    @"/bin/sh", @"/bin/bash",
];


#pragma mark - Bypass Securtiy


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

@class TTInstallUtil; @class PIPOIAPStoreManager; @class BDInstallNetworkUtility; @class MSConfigOV; @class UIDevice; @class PIPOStoreKitHelper; @class NSBundle; @class TTAdSplashDeviceHelper; @class AWEAPMManager; @class FBSDKAppEventsUtility; @class AppsFlyerUtils; @class MSManagerOV; @class NSFileManager; @class BDADeviceHelper; @class IESLiveDeviceInfo; @class GULAppEnvironmentUtil; @class AWESecurity; 
static BOOL (*_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$)(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, id); static BOOL _logos_method$_ungrouped$NSFileManager$fileExistsAtPath$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$isDirectory$)(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, id, BOOL*); static BOOL _logos_method$_ungrouped$NSFileManager$fileExistsAtPath$isDirectory$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST, SEL, id, BOOL*); static bool (*_logos_meta_orig$_ungrouped$BDADeviceHelper$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool _logos_meta_method$_ungrouped$BDADeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool (*_logos_meta_orig$_ungrouped$UIDevice$btd_isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool _logos_meta_method$_ungrouped$UIDevice$btd_isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool (*_logos_meta_orig$_ungrouped$TTInstallUtil$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool _logos_meta_method$_ungrouped$TTInstallUtil$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool (*_logos_meta_orig$_ungrouped$AppsFlyerUtils$isJailbrokenWithSkipAdvancedJailbreakValidation$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, bool); static bool _logos_meta_method$_ungrouped$AppsFlyerUtils$isJailbrokenWithSkipAdvancedJailbreakValidation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, bool); static bool (*_logos_orig$_ungrouped$PIPOIAPStoreManager$_pipo_isJailBrokenDeviceWithProductID$orderID$)(_LOGOS_SELF_TYPE_NORMAL PIPOIAPStoreManager* _LOGOS_SELF_CONST, SEL, id, id); static bool _logos_method$_ungrouped$PIPOIAPStoreManager$_pipo_isJailBrokenDeviceWithProductID$orderID$(_LOGOS_SELF_TYPE_NORMAL PIPOIAPStoreManager* _LOGOS_SELF_CONST, SEL, id, id); static bool (*_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool _logos_meta_method$_ungrouped$IESLiveDeviceInfo$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool (*_logos_orig$_ungrouped$PIPOStoreKitHelper$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL PIPOStoreKitHelper* _LOGOS_SELF_CONST, SEL); static bool _logos_method$_ungrouped$PIPOStoreKitHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL PIPOStoreKitHelper* _LOGOS_SELF_CONST, SEL); static bool (*_logos_meta_orig$_ungrouped$BDInstallNetworkUtility$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool _logos_meta_method$_ungrouped$BDInstallNetworkUtility$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool (*_logos_meta_orig$_ungrouped$TTAdSplashDeviceHelper$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool _logos_meta_method$_ungrouped$TTAdSplashDeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool (*_logos_meta_orig$_ungrouped$GULAppEnvironmentUtil$isFromAppStore)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool _logos_meta_method$_ungrouped$GULAppEnvironmentUtil$isFromAppStore(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool (*_logos_meta_orig$_ungrouped$GULAppEnvironmentUtil$isAppStoreReceiptSandbox)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool _logos_meta_method$_ungrouped$GULAppEnvironmentUtil$isAppStoreReceiptSandbox(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool (*_logos_meta_orig$_ungrouped$GULAppEnvironmentUtil$isAppExtension)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool _logos_meta_method$_ungrouped$GULAppEnvironmentUtil$isAppExtension(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool (*_logos_meta_orig$_ungrouped$FBSDKAppEventsUtility$isDebugBuild)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static bool _logos_meta_method$_ungrouped$FBSDKAppEventsUtility$isDebugBuild(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$AWEAPMManager$signInfo)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWEAPMManager$signInfo(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$NSBundle$pathForResource$ofType$)(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST, SEL, id, id); static id _logos_method$_ungrouped$NSBundle$pathForResource$ofType$(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$AWESecurity$resetCollectMode)(_LOGOS_SELF_TYPE_NORMAL AWESecurity* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$AWESecurity$resetCollectMode(_LOGOS_SELF_TYPE_NORMAL AWESecurity* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$MSManagerOV$setMode)(_LOGOS_SELF_TYPE_NORMAL MSManagerOV* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$MSManagerOV$setMode(_LOGOS_SELF_TYPE_NORMAL MSManagerOV* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$MSConfigOV$setMode)(_LOGOS_SELF_TYPE_NORMAL MSConfigOV* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$MSConfigOV$setMode(_LOGOS_SELF_TYPE_NORMAL MSConfigOV* _LOGOS_SELF_CONST, SEL); 

#line 71 "/Users/lovez/Desktop/AA/AA/app/tiktok-god/JailbreakBypass.xm"


static BOOL _logos_method$_ungrouped$NSFileManager$fileExistsAtPath$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	for (NSString *file in jailbreakPaths) {
		if ([arg1 isEqualToString:file]) {
			return NO;
		}
	}
	return _logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$(self, _cmd, arg1);
}

static BOOL _logos_method$_ungrouped$NSFileManager$fileExistsAtPath$isDirectory$(_LOGOS_SELF_TYPE_NORMAL NSFileManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, BOOL* arg2) {
	for (NSString *file in jailbreakPaths) {
		if ([arg1 isEqualToString:file]) {
			return NO;
		}
	}
	return _logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$isDirectory$(self, _cmd, arg1, arg2);
}



static bool _logos_meta_method$_ungrouped$BDADeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}



static bool _logos_meta_method$_ungrouped$UIDevice$btd_isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}



static bool _logos_meta_method$_ungrouped$TTInstallUtil$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}



static bool _logos_meta_method$_ungrouped$AppsFlyerUtils$isJailbrokenWithSkipAdvancedJailbreakValidation$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, bool arg2) {
	return NO;
}



static bool _logos_method$_ungrouped$PIPOIAPStoreManager$_pipo_isJailBrokenDeviceWithProductID$orderID$(_LOGOS_SELF_TYPE_NORMAL PIPOIAPStoreManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg2, id arg3) {
	return NO;
}



static bool _logos_meta_method$_ungrouped$IESLiveDeviceInfo$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}



static bool _logos_method$_ungrouped$PIPOStoreKitHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL PIPOStoreKitHelper* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}



static bool _logos_meta_method$_ungrouped$BDInstallNetworkUtility$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}



static bool _logos_meta_method$_ungrouped$TTAdSplashDeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}









static bool _logos_meta_method$_ungrouped$GULAppEnvironmentUtil$isFromAppStore(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return YES;
}
static bool _logos_meta_method$_ungrouped$GULAppEnvironmentUtil$isAppStoreReceiptSandbox(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}
static bool _logos_meta_method$_ungrouped$GULAppEnvironmentUtil$isAppExtension(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return YES;
}



static bool _logos_meta_method$_ungrouped$FBSDKAppEventsUtility$isDebugBuild(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}



static id _logos_meta_method$_ungrouped$AWEAPMManager$signInfo(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return @"AppStore";
}



static id _logos_method$_ungrouped$NSBundle$pathForResource$ofType$(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
	if ([arg2 isEqualToString:@"mobileprovision"]) {
		return nil;
	}
	return _logos_orig$_ungrouped$NSBundle$pathForResource$ofType$(self, _cmd, arg1, arg2);
}





static void _logos_method$_ungrouped$AWESecurity$resetCollectMode(_LOGOS_SELF_TYPE_NORMAL AWESecurity* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return;
}



static id _logos_method$_ungrouped$MSManagerOV$setMode(_LOGOS_SELF_TYPE_NORMAL MSManagerOV* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return (id (^)(id)) ^{
	};
}



static id _logos_method$_ungrouped$MSConfigOV$setMode(_LOGOS_SELF_TYPE_NORMAL MSConfigOV* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return (id (^)(id)) ^{
	};
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$NSFileManager = objc_getClass("NSFileManager"); { MSHookMessageEx(_logos_class$_ungrouped$NSFileManager, @selector(fileExistsAtPath:), (IMP)&_logos_method$_ungrouped$NSFileManager$fileExistsAtPath$, (IMP*)&_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSFileManager, @selector(fileExistsAtPath:isDirectory:), (IMP)&_logos_method$_ungrouped$NSFileManager$fileExistsAtPath$isDirectory$, (IMP*)&_logos_orig$_ungrouped$NSFileManager$fileExistsAtPath$isDirectory$);}Class _logos_class$_ungrouped$BDADeviceHelper = objc_getClass("BDADeviceHelper"); Class _logos_metaclass$_ungrouped$BDADeviceHelper = object_getClass(_logos_class$_ungrouped$BDADeviceHelper); { MSHookMessageEx(_logos_metaclass$_ungrouped$BDADeviceHelper, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$BDADeviceHelper$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$BDADeviceHelper$isJailBroken);}Class _logos_class$_ungrouped$UIDevice = objc_getClass("UIDevice"); Class _logos_metaclass$_ungrouped$UIDevice = object_getClass(_logos_class$_ungrouped$UIDevice); { MSHookMessageEx(_logos_metaclass$_ungrouped$UIDevice, @selector(btd_isJailBroken), (IMP)&_logos_meta_method$_ungrouped$UIDevice$btd_isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$UIDevice$btd_isJailBroken);}Class _logos_class$_ungrouped$TTInstallUtil = objc_getClass("TTInstallUtil"); Class _logos_metaclass$_ungrouped$TTInstallUtil = object_getClass(_logos_class$_ungrouped$TTInstallUtil); { MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallUtil, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$TTInstallUtil$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallUtil$isJailBroken);}Class _logos_class$_ungrouped$AppsFlyerUtils = objc_getClass("AppsFlyerUtils"); Class _logos_metaclass$_ungrouped$AppsFlyerUtils = object_getClass(_logos_class$_ungrouped$AppsFlyerUtils); { MSHookMessageEx(_logos_metaclass$_ungrouped$AppsFlyerUtils, @selector(isJailbrokenWithSkipAdvancedJailbreakValidation:), (IMP)&_logos_meta_method$_ungrouped$AppsFlyerUtils$isJailbrokenWithSkipAdvancedJailbreakValidation$, (IMP*)&_logos_meta_orig$_ungrouped$AppsFlyerUtils$isJailbrokenWithSkipAdvancedJailbreakValidation$);}Class _logos_class$_ungrouped$PIPOIAPStoreManager = objc_getClass("PIPOIAPStoreManager"); { MSHookMessageEx(_logos_class$_ungrouped$PIPOIAPStoreManager, @selector(_pipo_isJailBrokenDeviceWithProductID:orderID:), (IMP)&_logos_method$_ungrouped$PIPOIAPStoreManager$_pipo_isJailBrokenDeviceWithProductID$orderID$, (IMP*)&_logos_orig$_ungrouped$PIPOIAPStoreManager$_pipo_isJailBrokenDeviceWithProductID$orderID$);}Class _logos_class$_ungrouped$IESLiveDeviceInfo = objc_getClass("IESLiveDeviceInfo"); Class _logos_metaclass$_ungrouped$IESLiveDeviceInfo = object_getClass(_logos_class$_ungrouped$IESLiveDeviceInfo); { MSHookMessageEx(_logos_metaclass$_ungrouped$IESLiveDeviceInfo, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$IESLiveDeviceInfo$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$isJailBroken);}Class _logos_class$_ungrouped$PIPOStoreKitHelper = objc_getClass("PIPOStoreKitHelper"); { MSHookMessageEx(_logos_class$_ungrouped$PIPOStoreKitHelper, @selector(isJailBroken), (IMP)&_logos_method$_ungrouped$PIPOStoreKitHelper$isJailBroken, (IMP*)&_logos_orig$_ungrouped$PIPOStoreKitHelper$isJailBroken);}Class _logos_class$_ungrouped$BDInstallNetworkUtility = objc_getClass("BDInstallNetworkUtility"); Class _logos_metaclass$_ungrouped$BDInstallNetworkUtility = object_getClass(_logos_class$_ungrouped$BDInstallNetworkUtility); { MSHookMessageEx(_logos_metaclass$_ungrouped$BDInstallNetworkUtility, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$BDInstallNetworkUtility$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$BDInstallNetworkUtility$isJailBroken);}Class _logos_class$_ungrouped$TTAdSplashDeviceHelper = objc_getClass("TTAdSplashDeviceHelper"); Class _logos_metaclass$_ungrouped$TTAdSplashDeviceHelper = object_getClass(_logos_class$_ungrouped$TTAdSplashDeviceHelper); { MSHookMessageEx(_logos_metaclass$_ungrouped$TTAdSplashDeviceHelper, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$TTAdSplashDeviceHelper$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$TTAdSplashDeviceHelper$isJailBroken);}Class _logos_class$_ungrouped$GULAppEnvironmentUtil = objc_getClass("GULAppEnvironmentUtil"); Class _logos_metaclass$_ungrouped$GULAppEnvironmentUtil = object_getClass(_logos_class$_ungrouped$GULAppEnvironmentUtil); { MSHookMessageEx(_logos_metaclass$_ungrouped$GULAppEnvironmentUtil, @selector(isFromAppStore), (IMP)&_logos_meta_method$_ungrouped$GULAppEnvironmentUtil$isFromAppStore, (IMP*)&_logos_meta_orig$_ungrouped$GULAppEnvironmentUtil$isFromAppStore);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$GULAppEnvironmentUtil, @selector(isAppStoreReceiptSandbox), (IMP)&_logos_meta_method$_ungrouped$GULAppEnvironmentUtil$isAppStoreReceiptSandbox, (IMP*)&_logos_meta_orig$_ungrouped$GULAppEnvironmentUtil$isAppStoreReceiptSandbox);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$GULAppEnvironmentUtil, @selector(isAppExtension), (IMP)&_logos_meta_method$_ungrouped$GULAppEnvironmentUtil$isAppExtension, (IMP*)&_logos_meta_orig$_ungrouped$GULAppEnvironmentUtil$isAppExtension);}Class _logos_class$_ungrouped$FBSDKAppEventsUtility = objc_getClass("FBSDKAppEventsUtility"); Class _logos_metaclass$_ungrouped$FBSDKAppEventsUtility = object_getClass(_logos_class$_ungrouped$FBSDKAppEventsUtility); { MSHookMessageEx(_logos_metaclass$_ungrouped$FBSDKAppEventsUtility, @selector(isDebugBuild), (IMP)&_logos_meta_method$_ungrouped$FBSDKAppEventsUtility$isDebugBuild, (IMP*)&_logos_meta_orig$_ungrouped$FBSDKAppEventsUtility$isDebugBuild);}Class _logos_class$_ungrouped$AWEAPMManager = objc_getClass("AWEAPMManager"); Class _logos_metaclass$_ungrouped$AWEAPMManager = object_getClass(_logos_class$_ungrouped$AWEAPMManager); { MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAPMManager, @selector(signInfo), (IMP)&_logos_meta_method$_ungrouped$AWEAPMManager$signInfo, (IMP*)&_logos_meta_orig$_ungrouped$AWEAPMManager$signInfo);}Class _logos_class$_ungrouped$NSBundle = objc_getClass("NSBundle"); { MSHookMessageEx(_logos_class$_ungrouped$NSBundle, @selector(pathForResource:ofType:), (IMP)&_logos_method$_ungrouped$NSBundle$pathForResource$ofType$, (IMP*)&_logos_orig$_ungrouped$NSBundle$pathForResource$ofType$);}Class _logos_class$_ungrouped$AWESecurity = objc_getClass("AWESecurity"); { MSHookMessageEx(_logos_class$_ungrouped$AWESecurity, @selector(resetCollectMode), (IMP)&_logos_method$_ungrouped$AWESecurity$resetCollectMode, (IMP*)&_logos_orig$_ungrouped$AWESecurity$resetCollectMode);}Class _logos_class$_ungrouped$MSManagerOV = objc_getClass("MSManagerOV"); { MSHookMessageEx(_logos_class$_ungrouped$MSManagerOV, @selector(setMode), (IMP)&_logos_method$_ungrouped$MSManagerOV$setMode, (IMP*)&_logos_orig$_ungrouped$MSManagerOV$setMode);}Class _logos_class$_ungrouped$MSConfigOV = objc_getClass("MSConfigOV"); { MSHookMessageEx(_logos_class$_ungrouped$MSConfigOV, @selector(setMode), (IMP)&_logos_method$_ungrouped$MSConfigOV$setMode, (IMP*)&_logos_orig$_ungrouped$MSConfigOV$setMode);}} }
#line 206 "/Users/lovez/Desktop/AA/AA/app/tiktok-god/JailbreakBypass.xm"
