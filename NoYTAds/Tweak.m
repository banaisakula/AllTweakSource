#line 1 "/Users/lovez/Desktop/AA/AA/app/NoYTAds/Tweak.x"
#import <Foundation/Foundation.h>


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

@class YTIPlayerResponse; @class YTIPlayabilityStatus; @class YTSingleVideo; @class YTAdsInnerTubeContextDecorator; @class YTPlaybackData; 
static void (*_logos_orig$_ungrouped$YTAdsInnerTubeContextDecorator$decorateContext$)(_LOGOS_SELF_TYPE_NORMAL YTAdsInnerTubeContextDecorator* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$YTAdsInnerTubeContextDecorator$decorateContext$(_LOGOS_SELF_TYPE_NORMAL YTAdsInnerTubeContextDecorator* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$_ungrouped$YTIPlayerResponse$isPlayableInBackground)(_LOGOS_SELF_TYPE_NORMAL YTIPlayerResponse* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$YTIPlayerResponse$isPlayableInBackground(_LOGOS_SELF_TYPE_NORMAL YTIPlayerResponse* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$YTSingleVideo$isPlayableInBackground)(_LOGOS_SELF_TYPE_NORMAL YTSingleVideo* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$YTSingleVideo$isPlayableInBackground(_LOGOS_SELF_TYPE_NORMAL YTSingleVideo* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$YTPlaybackData$isPlayableInBackground)(_LOGOS_SELF_TYPE_NORMAL YTPlaybackData* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$YTPlaybackData$isPlayableInBackground(_LOGOS_SELF_TYPE_NORMAL YTPlaybackData* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$YTIPlayabilityStatus$isPlayableInBackground)(_LOGOS_SELF_TYPE_NORMAL YTIPlayabilityStatus* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$YTIPlayabilityStatus$isPlayableInBackground(_LOGOS_SELF_TYPE_NORMAL YTIPlayabilityStatus* _LOGOS_SELF_CONST, SEL); 

#line 3 "/Users/lovez/Desktop/AA/AA/app/NoYTAds/Tweak.x"

static void _logos_method$_ungrouped$YTAdsInnerTubeContextDecorator$decorateContext$(_LOGOS_SELF_TYPE_NORMAL YTAdsInnerTubeContextDecorator* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    _logos_orig$_ungrouped$YTAdsInnerTubeContextDecorator$decorateContext$(self, _cmd, nil);
}



static BOOL _logos_method$_ungrouped$YTIPlayerResponse$isPlayableInBackground(_LOGOS_SELF_TYPE_NORMAL YTIPlayerResponse* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
}



static BOOL _logos_method$_ungrouped$YTSingleVideo$isPlayableInBackground(_LOGOS_SELF_TYPE_NORMAL YTSingleVideo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
}



static BOOL _logos_method$_ungrouped$YTPlaybackData$isPlayableInBackground(_LOGOS_SELF_TYPE_NORMAL YTPlaybackData* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
}



static BOOL _logos_method$_ungrouped$YTIPlayabilityStatus$isPlayableInBackground(_LOGOS_SELF_TYPE_NORMAL YTIPlayabilityStatus* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$YTAdsInnerTubeContextDecorator = objc_getClass("YTAdsInnerTubeContextDecorator"); { MSHookMessageEx(_logos_class$_ungrouped$YTAdsInnerTubeContextDecorator, @selector(decorateContext:), (IMP)&_logos_method$_ungrouped$YTAdsInnerTubeContextDecorator$decorateContext$, (IMP*)&_logos_orig$_ungrouped$YTAdsInnerTubeContextDecorator$decorateContext$);}Class _logos_class$_ungrouped$YTIPlayerResponse = objc_getClass("YTIPlayerResponse"); { MSHookMessageEx(_logos_class$_ungrouped$YTIPlayerResponse, @selector(isPlayableInBackground), (IMP)&_logos_method$_ungrouped$YTIPlayerResponse$isPlayableInBackground, (IMP*)&_logos_orig$_ungrouped$YTIPlayerResponse$isPlayableInBackground);}Class _logos_class$_ungrouped$YTSingleVideo = objc_getClass("YTSingleVideo"); { MSHookMessageEx(_logos_class$_ungrouped$YTSingleVideo, @selector(isPlayableInBackground), (IMP)&_logos_method$_ungrouped$YTSingleVideo$isPlayableInBackground, (IMP*)&_logos_orig$_ungrouped$YTSingleVideo$isPlayableInBackground);}Class _logos_class$_ungrouped$YTPlaybackData = objc_getClass("YTPlaybackData"); { MSHookMessageEx(_logos_class$_ungrouped$YTPlaybackData, @selector(isPlayableInBackground), (IMP)&_logos_method$_ungrouped$YTPlaybackData$isPlayableInBackground, (IMP*)&_logos_orig$_ungrouped$YTPlaybackData$isPlayableInBackground);}Class _logos_class$_ungrouped$YTIPlayabilityStatus = objc_getClass("YTIPlayabilityStatus"); { MSHookMessageEx(_logos_class$_ungrouped$YTIPlayabilityStatus, @selector(isPlayableInBackground), (IMP)&_logos_method$_ungrouped$YTIPlayabilityStatus$isPlayableInBackground, (IMP*)&_logos_orig$_ungrouped$YTIPlayabilityStatus$isPlayableInBackground);}} }
#line 32 "/Users/lovez/Desktop/AA/AA/app/NoYTAds/Tweak.x"
