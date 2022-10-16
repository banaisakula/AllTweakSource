#line 1 "/Users/lovez/Desktop/AA/AA/app/diandian/diandian.xm"
#import <UIKit/UIKit.h>
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.icraze.notodayview13prefs.plist"


static BOOL diandian;

static void loadPrefs() {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
	diandian = [prefs objectForKey:@"diandian"] ? [[prefs objectForKey:@"diandian"] boolValue] : YES;
}



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

@class KSAdInterstitialCollectionView; @class TKVideoPlayerView; @class KSAdTKCardView; @class BUNativeExpressAdView; @class KSSplashAdView; @class DCSplashAdView; 


#line 13 "/Users/lovez/Desktop/AA/AA/app/diandian/diandian.xm"
static void (*_logos_orig$diandian$BUNativeExpressAdView$_initPlayer)(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL); static void _logos_method$diandian$BUNativeExpressAdView$_initPlayer(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$diandian$BUNativeExpressAdView$nativeAd)(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL); static id _logos_method$diandian$BUNativeExpressAdView$nativeAd(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$diandian$BUNativeExpressAdView$setNativeAd$)(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$diandian$BUNativeExpressAdView$setNativeAd$(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$diandian$DCSplashAdView$loadAdData)(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL); static void _logos_method$diandian$DCSplashAdView$loadAdData(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$diandian$DCSplashAdView$setDcloudAd$)(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$diandian$DCSplashAdView$setDcloudAd$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$diandian$DCSplashAdView$setAdHttp$)(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$diandian$DCSplashAdView$setAdHttp$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$diandian$DCSplashAdView$setAdStore$)(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$diandian$DCSplashAdView$setAdStore$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$diandian$DCSplashAdView$setAdLabel$)(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$diandian$DCSplashAdView$setAdLabel$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$diandian$KSAdInterstitialCollectionView$preloadAdView)(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL); static void _logos_method$diandian$KSAdInterstitialCollectionView$preloadAdView(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$diandian$KSAdInterstitialCollectionView$setAdView$)(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$diandian$KSAdInterstitialCollectionView$setAdView$(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$diandian$KSAdInterstitialCollectionView$setCollectionView$)(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$diandian$KSAdInterstitialCollectionView$setCollectionView$(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$diandian$KSAdTKCardView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL KSAdTKCardView* _LOGOS_SELF_CONST, SEL); static void _logos_method$diandian$KSAdTKCardView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL KSAdTKCardView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$diandian$KSSplashAdView$setupAdData)(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static void _logos_method$diandian$KSSplashAdView$setupAdData(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$diandian$KSSplashAdView$loadAdData)(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static void _logos_method$diandian$KSSplashAdView$loadAdData(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static float (*_logos_orig$diandian$KSSplashAdView$validTimeInterval)(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static float _logos_method$diandian$KSSplashAdView$validTimeInterval(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$diandian$TKVideoPlayerView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL TKVideoPlayerView* _LOGOS_SELF_CONST, SEL); static void _logos_method$diandian$TKVideoPlayerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL TKVideoPlayerView* _LOGOS_SELF_CONST, SEL); 


static void _logos_method$diandian$BUNativeExpressAdView$_initPlayer(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}

static id _logos_method$diandian$BUNativeExpressAdView$nativeAd(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NULL;
}

static void _logos_method$diandian$BUNativeExpressAdView$setNativeAd$(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}



static void _logos_method$diandian$DCSplashAdView$loadAdData(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}

static void _logos_method$diandian$DCSplashAdView$setDcloudAd$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}

static void _logos_method$diandian$DCSplashAdView$setAdHttp$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}

static void _logos_method$diandian$DCSplashAdView$setAdStore$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	_logos_orig$diandian$DCSplashAdView$setAdStore$(self, _cmd, arg1);
}

static void _logos_method$diandian$DCSplashAdView$setAdLabel$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	_logos_orig$diandian$DCSplashAdView$setAdLabel$(self, _cmd, arg1);
}



static void _logos_method$diandian$KSAdInterstitialCollectionView$preloadAdView(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}

static void _logos_method$diandian$KSAdInterstitialCollectionView$setAdView$(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}

static void _logos_method$diandian$KSAdInterstitialCollectionView$setCollectionView$(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}



static void _logos_method$diandian$KSAdTKCardView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL KSAdTKCardView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}



static void _logos_method$diandian$KSSplashAdView$setupAdData(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$diandian$KSSplashAdView$setupAdData(self, _cmd);
}

static void _logos_method$diandian$KSSplashAdView$loadAdData(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}

static float _logos_method$diandian$KSSplashAdView$validTimeInterval(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return 0;
}



static void _logos_method$diandian$TKVideoPlayerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL TKVideoPlayerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}







static __attribute__((constructor)) void _logosLocalCtor_3b78f0bd(int __unused argc, char __unused **argv, char __unused **envp) {
	loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.icraze.notodayview13prefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
		if(diandian){
		{Class _logos_class$diandian$BUNativeExpressAdView = objc_getClass("BUNativeExpressAdView"); { MSHookMessageEx(_logos_class$diandian$BUNativeExpressAdView, @selector(_initPlayer), (IMP)&_logos_method$diandian$BUNativeExpressAdView$_initPlayer, (IMP*)&_logos_orig$diandian$BUNativeExpressAdView$_initPlayer);}{ MSHookMessageEx(_logos_class$diandian$BUNativeExpressAdView, @selector(nativeAd), (IMP)&_logos_method$diandian$BUNativeExpressAdView$nativeAd, (IMP*)&_logos_orig$diandian$BUNativeExpressAdView$nativeAd);}{ MSHookMessageEx(_logos_class$diandian$BUNativeExpressAdView, @selector(setNativeAd:), (IMP)&_logos_method$diandian$BUNativeExpressAdView$setNativeAd$, (IMP*)&_logos_orig$diandian$BUNativeExpressAdView$setNativeAd$);}Class _logos_class$diandian$DCSplashAdView = objc_getClass("DCSplashAdView"); { MSHookMessageEx(_logos_class$diandian$DCSplashAdView, @selector(loadAdData), (IMP)&_logos_method$diandian$DCSplashAdView$loadAdData, (IMP*)&_logos_orig$diandian$DCSplashAdView$loadAdData);}{ MSHookMessageEx(_logos_class$diandian$DCSplashAdView, @selector(setDcloudAd:), (IMP)&_logos_method$diandian$DCSplashAdView$setDcloudAd$, (IMP*)&_logos_orig$diandian$DCSplashAdView$setDcloudAd$);}{ MSHookMessageEx(_logos_class$diandian$DCSplashAdView, @selector(setAdHttp:), (IMP)&_logos_method$diandian$DCSplashAdView$setAdHttp$, (IMP*)&_logos_orig$diandian$DCSplashAdView$setAdHttp$);}{ MSHookMessageEx(_logos_class$diandian$DCSplashAdView, @selector(setAdStore:), (IMP)&_logos_method$diandian$DCSplashAdView$setAdStore$, (IMP*)&_logos_orig$diandian$DCSplashAdView$setAdStore$);}{ MSHookMessageEx(_logos_class$diandian$DCSplashAdView, @selector(setAdLabel:), (IMP)&_logos_method$diandian$DCSplashAdView$setAdLabel$, (IMP*)&_logos_orig$diandian$DCSplashAdView$setAdLabel$);}Class _logos_class$diandian$KSAdInterstitialCollectionView = objc_getClass("KSAdInterstitialCollectionView"); { MSHookMessageEx(_logos_class$diandian$KSAdInterstitialCollectionView, @selector(preloadAdView), (IMP)&_logos_method$diandian$KSAdInterstitialCollectionView$preloadAdView, (IMP*)&_logos_orig$diandian$KSAdInterstitialCollectionView$preloadAdView);}{ MSHookMessageEx(_logos_class$diandian$KSAdInterstitialCollectionView, @selector(setAdView:), (IMP)&_logos_method$diandian$KSAdInterstitialCollectionView$setAdView$, (IMP*)&_logos_orig$diandian$KSAdInterstitialCollectionView$setAdView$);}{ MSHookMessageEx(_logos_class$diandian$KSAdInterstitialCollectionView, @selector(setCollectionView:), (IMP)&_logos_method$diandian$KSAdInterstitialCollectionView$setCollectionView$, (IMP*)&_logos_orig$diandian$KSAdInterstitialCollectionView$setCollectionView$);}Class _logos_class$diandian$KSAdTKCardView = objc_getClass("KSAdTKCardView"); { MSHookMessageEx(_logos_class$diandian$KSAdTKCardView, @selector(layoutSubviews), (IMP)&_logos_method$diandian$KSAdTKCardView$layoutSubviews, (IMP*)&_logos_orig$diandian$KSAdTKCardView$layoutSubviews);}Class _logos_class$diandian$KSSplashAdView = objc_getClass("KSSplashAdView"); { MSHookMessageEx(_logos_class$diandian$KSSplashAdView, @selector(setupAdData), (IMP)&_logos_method$diandian$KSSplashAdView$setupAdData, (IMP*)&_logos_orig$diandian$KSSplashAdView$setupAdData);}{ MSHookMessageEx(_logos_class$diandian$KSSplashAdView, @selector(loadAdData), (IMP)&_logos_method$diandian$KSSplashAdView$loadAdData, (IMP*)&_logos_orig$diandian$KSSplashAdView$loadAdData);}{ MSHookMessageEx(_logos_class$diandian$KSSplashAdView, @selector(validTimeInterval), (IMP)&_logos_method$diandian$KSSplashAdView$validTimeInterval, (IMP*)&_logos_orig$diandian$KSSplashAdView$validTimeInterval);}Class _logos_class$diandian$TKVideoPlayerView = objc_getClass("TKVideoPlayerView"); { MSHookMessageEx(_logos_class$diandian$TKVideoPlayerView, @selector(layoutSubviews), (IMP)&_logos_method$diandian$TKVideoPlayerView$layoutSubviews, (IMP*)&_logos_orig$diandian$TKVideoPlayerView$layoutSubviews);}}
		}


    	}
