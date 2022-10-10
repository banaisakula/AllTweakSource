#line 1 "/Users/lovez/Desktop/AA/AA/AppPad/Tweak.x"
#import <substrate.h>


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

@class SBApplication; @class UIApplication; @class SBApplicationInfo; 
static BOOL (*_logos_orig$_ungrouped$UIApplication$_shouldBigify)(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UIApplication$_shouldBigify(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL); 

#line 3 "/Users/lovez/Desktop/AA/AA/AppPad/Tweak.x"


static BOOL _logos_method$_ungrouped$UIApplication$_shouldBigify(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return YES;
}



static bool (*_logos_orig$SB$SBApplicationInfo$disableClassicMode)(_LOGOS_SELF_TYPE_NORMAL SBApplicationInfo* _LOGOS_SELF_CONST, SEL); static bool _logos_method$SB$SBApplicationInfo$disableClassicMode(_LOGOS_SELF_TYPE_NORMAL SBApplicationInfo* _LOGOS_SELF_CONST, SEL); static bool (*_logos_orig$SB$SBApplicationInfo$wantsFullScreen)(_LOGOS_SELF_TYPE_NORMAL SBApplicationInfo* _LOGOS_SELF_CONST, SEL); static bool _logos_method$SB$SBApplicationInfo$wantsFullScreen(_LOGOS_SELF_TYPE_NORMAL SBApplicationInfo* _LOGOS_SELF_CONST, SEL); static bool (*_logos_orig$SB$SBApplicationInfo$_supportsApplicationType$)(_LOGOS_SELF_TYPE_NORMAL SBApplicationInfo* _LOGOS_SELF_CONST, SEL, int); static bool _logos_method$SB$SBApplicationInfo$_supportsApplicationType$(_LOGOS_SELF_TYPE_NORMAL SBApplicationInfo* _LOGOS_SELF_CONST, SEL, int); static bool (*_logos_orig$SB$SBApplication$_supportsApplicationType$)(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL, int); static bool _logos_method$SB$SBApplication$_supportsApplicationType$(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL, int); static NSInteger (*_logos_orig$SB$SBApplication$_defaultClassicMode)(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL); static NSInteger _logos_method$SB$SBApplication$_defaultClassicMode(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST, SEL); 



static bool _logos_method$SB$SBApplicationInfo$disableClassicMode(_LOGOS_SELF_TYPE_NORMAL SBApplicationInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return true;
}

static bool _logos_method$SB$SBApplicationInfo$wantsFullScreen(_LOGOS_SELF_TYPE_NORMAL SBApplicationInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return false;
}

static bool _logos_method$SB$SBApplicationInfo$_supportsApplicationType$(_LOGOS_SELF_TYPE_NORMAL SBApplicationInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int type) {
	return _logos_orig$SB$SBApplicationInfo$_supportsApplicationType$(self, _cmd, type & 2 ? 1 : type);
}





static bool _logos_method$SB$SBApplication$_supportsApplicationType$(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int type) {
	return _logos_orig$SB$SBApplication$_supportsApplicationType$(self, _cmd, type & 2 ? 1 : type);
}

static NSInteger _logos_method$SB$SBApplication$_defaultClassicMode(_LOGOS_SELF_TYPE_NORMAL SBApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return 0;
}





static __attribute__((constructor)) void _logosLocalCtor_9d1dd3f5(int __unused argc, char __unused **argv, char __unused **envp) {
	if (IN_SPRINGBOARD) {
		{Class _logos_class$SB$SBApplicationInfo = objc_getClass("SBApplicationInfo"); { MSHookMessageEx(_logos_class$SB$SBApplicationInfo, @selector(disableClassicMode), (IMP)&_logos_method$SB$SBApplicationInfo$disableClassicMode, (IMP*)&_logos_orig$SB$SBApplicationInfo$disableClassicMode);}{ MSHookMessageEx(_logos_class$SB$SBApplicationInfo, @selector(wantsFullScreen), (IMP)&_logos_method$SB$SBApplicationInfo$wantsFullScreen, (IMP*)&_logos_orig$SB$SBApplicationInfo$wantsFullScreen);}{ MSHookMessageEx(_logos_class$SB$SBApplicationInfo, @selector(_supportsApplicationType:), (IMP)&_logos_method$SB$SBApplicationInfo$_supportsApplicationType$, (IMP*)&_logos_orig$SB$SBApplicationInfo$_supportsApplicationType$);}Class _logos_class$SB$SBApplication = objc_getClass("SBApplication"); { MSHookMessageEx(_logos_class$SB$SBApplication, @selector(_supportsApplicationType:), (IMP)&_logos_method$SB$SBApplication$_supportsApplicationType$, (IMP*)&_logos_orig$SB$SBApplication$_supportsApplicationType$);}{ MSHookMessageEx(_logos_class$SB$SBApplication, @selector(_defaultClassicMode), (IMP)&_logos_method$SB$SBApplication$_defaultClassicMode, (IMP*)&_logos_orig$SB$SBApplication$_defaultClassicMode);}}
	} else {
		{Class _logos_class$_ungrouped$UIApplication = objc_getClass("UIApplication"); { MSHookMessageEx(_logos_class$_ungrouped$UIApplication, @selector(_shouldBigify), (IMP)&_logos_method$_ungrouped$UIApplication$_shouldBigify, (IMP*)&_logos_orig$_ungrouped$UIApplication$_shouldBigify);}}
	}
}
