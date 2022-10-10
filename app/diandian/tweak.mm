#line 1 "/Users/lovez/Desktop/AA/AA/app/diandian/tweak.xm"
#import <UIKit/UIKit.h>

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

@class KSAdTKCardView; @class KSSplashAdView; @class DCSplashAdView; @class KSAdInterstitialCollectionView; @class BUNativeExpressAdView; @class TKVideoPlayerView; 
static void (*_logos_orig$_ungrouped$BUNativeExpressAdView$_initPlayer)(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$BUNativeExpressAdView$_initPlayer(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$BUNativeExpressAdView$nativeAd)(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$BUNativeExpressAdView$nativeAd(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$BUNativeExpressAdView$setNativeAd$)(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$BUNativeExpressAdView$setNativeAd$(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$DCSplashAdView$loadAdData)(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$DCSplashAdView$loadAdData(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$DCSplashAdView$setDcloudAd$)(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$DCSplashAdView$setDcloudAd$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$DCSplashAdView$setAdHttp$)(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$DCSplashAdView$setAdHttp$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$DCSplashAdView$setAdStore$)(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$DCSplashAdView$setAdStore$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$DCSplashAdView$setAdLabel$)(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$DCSplashAdView$setAdLabel$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$KSAdInterstitialCollectionView$preloadAdView)(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$KSAdInterstitialCollectionView$preloadAdView(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$KSAdInterstitialCollectionView$setAdView$)(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$KSAdInterstitialCollectionView$setAdView$(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$KSAdInterstitialCollectionView$setCollectionView$)(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$KSAdInterstitialCollectionView$setCollectionView$(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$KSAdTKCardView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL KSAdTKCardView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$KSAdTKCardView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL KSAdTKCardView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$KSSplashAdView$setupAdData)(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$KSSplashAdView$setupAdData(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$KSSplashAdView$loadAdData)(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$KSSplashAdView$loadAdData(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static float (*_logos_orig$_ungrouped$KSSplashAdView$validTimeInterval)(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static float _logos_method$_ungrouped$KSSplashAdView$validTimeInterval(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$TKVideoPlayerView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL TKVideoPlayerView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$TKVideoPlayerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL TKVideoPlayerView* _LOGOS_SELF_CONST, SEL); 

#line 2 "/Users/lovez/Desktop/AA/AA/app/diandian/tweak.xm"

static void _logos_method$_ungrouped$BUNativeExpressAdView$_initPlayer(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$BUNativeExpressAdView$_initPlayer(self, _cmd);
}

static id _logos_method$_ungrouped$BUNativeExpressAdView$nativeAd(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NULL;
}

static void _logos_method$_ungrouped$BUNativeExpressAdView$setNativeAd$(_LOGOS_SELF_TYPE_NORMAL BUNativeExpressAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	_logos_orig$_ungrouped$BUNativeExpressAdView$setNativeAd$(self, _cmd, arg1);
}



static void _logos_method$_ungrouped$DCSplashAdView$loadAdData(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}

static void _logos_method$_ungrouped$DCSplashAdView$setDcloudAd$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}

static void _logos_method$_ungrouped$DCSplashAdView$setAdHttp$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}

static void _logos_method$_ungrouped$DCSplashAdView$setAdStore$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}

static void _logos_method$_ungrouped$DCSplashAdView$setAdLabel$(_LOGOS_SELF_TYPE_NORMAL DCSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}



static void _logos_method$_ungrouped$KSAdInterstitialCollectionView$preloadAdView(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}

static void _logos_method$_ungrouped$KSAdInterstitialCollectionView$setAdView$(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}

static void _logos_method$_ungrouped$KSAdInterstitialCollectionView$setCollectionView$(_LOGOS_SELF_TYPE_NORMAL KSAdInterstitialCollectionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

}



static void _logos_method$_ungrouped$KSAdTKCardView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL KSAdTKCardView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}



static void _logos_method$_ungrouped$KSSplashAdView$setupAdData(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}

static void _logos_method$_ungrouped$KSSplashAdView$loadAdData(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}

static float _logos_method$_ungrouped$KSSplashAdView$validTimeInterval(_LOGOS_SELF_TYPE_NORMAL KSSplashAdView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return 0;
}



static void _logos_method$_ungrouped$TKVideoPlayerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL TKVideoPlayerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$BUNativeExpressAdView = objc_getClass("BUNativeExpressAdView"); { MSHookMessageEx(_logos_class$_ungrouped$BUNativeExpressAdView, @selector(_initPlayer), (IMP)&_logos_method$_ungrouped$BUNativeExpressAdView$_initPlayer, (IMP*)&_logos_orig$_ungrouped$BUNativeExpressAdView$_initPlayer);}{ MSHookMessageEx(_logos_class$_ungrouped$BUNativeExpressAdView, @selector(nativeAd), (IMP)&_logos_method$_ungrouped$BUNativeExpressAdView$nativeAd, (IMP*)&_logos_orig$_ungrouped$BUNativeExpressAdView$nativeAd);}{ MSHookMessageEx(_logos_class$_ungrouped$BUNativeExpressAdView, @selector(setNativeAd:), (IMP)&_logos_method$_ungrouped$BUNativeExpressAdView$setNativeAd$, (IMP*)&_logos_orig$_ungrouped$BUNativeExpressAdView$setNativeAd$);}Class _logos_class$_ungrouped$DCSplashAdView = objc_getClass("DCSplashAdView"); { MSHookMessageEx(_logos_class$_ungrouped$DCSplashAdView, @selector(loadAdData), (IMP)&_logos_method$_ungrouped$DCSplashAdView$loadAdData, (IMP*)&_logos_orig$_ungrouped$DCSplashAdView$loadAdData);}{ MSHookMessageEx(_logos_class$_ungrouped$DCSplashAdView, @selector(setDcloudAd:), (IMP)&_logos_method$_ungrouped$DCSplashAdView$setDcloudAd$, (IMP*)&_logos_orig$_ungrouped$DCSplashAdView$setDcloudAd$);}{ MSHookMessageEx(_logos_class$_ungrouped$DCSplashAdView, @selector(setAdHttp:), (IMP)&_logos_method$_ungrouped$DCSplashAdView$setAdHttp$, (IMP*)&_logos_orig$_ungrouped$DCSplashAdView$setAdHttp$);}{ MSHookMessageEx(_logos_class$_ungrouped$DCSplashAdView, @selector(setAdStore:), (IMP)&_logos_method$_ungrouped$DCSplashAdView$setAdStore$, (IMP*)&_logos_orig$_ungrouped$DCSplashAdView$setAdStore$);}{ MSHookMessageEx(_logos_class$_ungrouped$DCSplashAdView, @selector(setAdLabel:), (IMP)&_logos_method$_ungrouped$DCSplashAdView$setAdLabel$, (IMP*)&_logos_orig$_ungrouped$DCSplashAdView$setAdLabel$);}Class _logos_class$_ungrouped$KSAdInterstitialCollectionView = objc_getClass("KSAdInterstitialCollectionView"); { MSHookMessageEx(_logos_class$_ungrouped$KSAdInterstitialCollectionView, @selector(preloadAdView), (IMP)&_logos_method$_ungrouped$KSAdInterstitialCollectionView$preloadAdView, (IMP*)&_logos_orig$_ungrouped$KSAdInterstitialCollectionView$preloadAdView);}{ MSHookMessageEx(_logos_class$_ungrouped$KSAdInterstitialCollectionView, @selector(setAdView:), (IMP)&_logos_method$_ungrouped$KSAdInterstitialCollectionView$setAdView$, (IMP*)&_logos_orig$_ungrouped$KSAdInterstitialCollectionView$setAdView$);}{ MSHookMessageEx(_logos_class$_ungrouped$KSAdInterstitialCollectionView, @selector(setCollectionView:), (IMP)&_logos_method$_ungrouped$KSAdInterstitialCollectionView$setCollectionView$, (IMP*)&_logos_orig$_ungrouped$KSAdInterstitialCollectionView$setCollectionView$);}Class _logos_class$_ungrouped$KSAdTKCardView = objc_getClass("KSAdTKCardView"); { MSHookMessageEx(_logos_class$_ungrouped$KSAdTKCardView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$KSAdTKCardView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$KSAdTKCardView$layoutSubviews);}Class _logos_class$_ungrouped$KSSplashAdView = objc_getClass("KSSplashAdView"); { MSHookMessageEx(_logos_class$_ungrouped$KSSplashAdView, @selector(setupAdData), (IMP)&_logos_method$_ungrouped$KSSplashAdView$setupAdData, (IMP*)&_logos_orig$_ungrouped$KSSplashAdView$setupAdData);}{ MSHookMessageEx(_logos_class$_ungrouped$KSSplashAdView, @selector(loadAdData), (IMP)&_logos_method$_ungrouped$KSSplashAdView$loadAdData, (IMP*)&_logos_orig$_ungrouped$KSSplashAdView$loadAdData);}{ MSHookMessageEx(_logos_class$_ungrouped$KSSplashAdView, @selector(validTimeInterval), (IMP)&_logos_method$_ungrouped$KSSplashAdView$validTimeInterval, (IMP*)&_logos_orig$_ungrouped$KSSplashAdView$validTimeInterval);}Class _logos_class$_ungrouped$TKVideoPlayerView = objc_getClass("TKVideoPlayerView"); { MSHookMessageEx(_logos_class$_ungrouped$TKVideoPlayerView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$TKVideoPlayerView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$TKVideoPlayerView$layoutSubviews);}} }
#line 77 "/Users/lovez/Desktop/AA/AA/app/diandian/tweak.xm"
