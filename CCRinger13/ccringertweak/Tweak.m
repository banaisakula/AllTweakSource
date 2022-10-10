#line 1 "/Users/lovez/Desktop/AA/AA/CCRinger13/ccringertweak/Tweak.x"
@interface SBRingerControl : NSObject
-(void)setRingerMuted:(BOOL)arg1;
-(instancetype)initWithHUDController:(id)arg1 soundController:(id)arg2;
@end

SBRingerControl *globalRingerControl;


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

@class SBRingerControl; 
static SBRingerControl* (*_logos_orig$_ungrouped$SBRingerControl$initWithHUDController$soundController$)(_LOGOS_SELF_TYPE_INIT SBRingerControl*, SEL, id, id) _LOGOS_RETURN_RETAINED; static SBRingerControl* _logos_method$_ungrouped$SBRingerControl$initWithHUDController$soundController$(_LOGOS_SELF_TYPE_INIT SBRingerControl*, SEL, id, id) _LOGOS_RETURN_RETAINED; 

#line 8 "/Users/lovez/Desktop/AA/AA/CCRinger13/ccringertweak/Tweak.x"

static SBRingerControl* _logos_method$_ungrouped$SBRingerControl$initWithHUDController$soundController$(_LOGOS_SELF_TYPE_INIT SBRingerControl* __unused self, SEL __unused _cmd, id arg1, id arg2) _LOGOS_RETURN_RETAINED {
	SBRingerControl *original = _logos_orig$_ungrouped$SBRingerControl$initWithHUDController$soundController$(self, _cmd, arg1, arg2);
	globalRingerControl = original;
	return original;
}


void muteRinger(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
	if(globalRingerControl) {
		NSLog(@"[CCRinger13] Muting ringer...");
		[globalRingerControl setRingerMuted:YES];
	}
}

void unmuteRinger(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
	if(globalRingerControl) {
		NSLog(@"[CCRinger13] Unmuting ringer...");
		[globalRingerControl setRingerMuted:NO];
	}
}

static __attribute__((constructor)) void _logosLocalCtor_59884cf5(int __unused argc, char __unused **argv, char __unused **envp) {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, muteRinger, CFSTR("me.conorthedev.ccringer13/muteringer"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, unmuteRinger, CFSTR("me.conorthedev.ccringer13/unmuteringer"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBRingerControl = objc_getClass("SBRingerControl"); { MSHookMessageEx(_logos_class$_ungrouped$SBRingerControl, @selector(initWithHUDController:soundController:), (IMP)&_logos_method$_ungrouped$SBRingerControl$initWithHUDController$soundController$, (IMP*)&_logos_orig$_ungrouped$SBRingerControl$initWithHUDController$soundController$);}} }
#line 34 "/Users/lovez/Desktop/AA/AA/CCRinger13/ccringertweak/Tweak.x"
