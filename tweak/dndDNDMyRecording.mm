#line 1 "/Users/lovez/Desktop/AA/AA/tweak/dndDNDMyRecording.xm"
#import <UIKit/UIKit.h>

@class DNDModeAssertionLifetime;

@interface DNDModeAssertionDetails : NSObject
+ (id)userRequestedAssertionDetailsWithIdentifier:(NSString *)identifier modeIdentifier:(NSString *)modeIdentifier lifetime:(DNDModeAssertionLifetime *)lifetime;
- (BOOL)invalidateAllActiveModeAssertionsWithError:(NSError **)error;
- (id)takeModeAssertionWithDetails:(DNDModeAssertionDetails *)assertionDetails error:(NSError **)error;
@end

@interface DNDModeAssertionService : NSObject
+ (id)serviceForClientIdentifier:(NSString *)clientIdentifier;
- (BOOL)invalidateAllActiveModeAssertionsWithError:(NSError **)error;
- (id)takeModeAssertionWithDetails:(DNDModeAssertionDetails *)assertionDetails error:(NSError **)error;
@end

static BOOL DNDPreviouslyEnabled = true;
static DNDModeAssertionService *assertionService;


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

@class RPScreenRecorder; @class DNDModeAssertionService; @class DNDModeAssertionDetails; 
static void (*_logos_orig$_ungrouped$RPScreenRecorder$setRecording$)(_LOGOS_SELF_TYPE_NORMAL RPScreenRecorder* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$RPScreenRecorder$setRecording$(_LOGOS_SELF_TYPE_NORMAL RPScreenRecorder* _LOGOS_SELF_CONST, SEL, BOOL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$DNDModeAssertionService(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("DNDModeAssertionService"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$DNDModeAssertionDetails(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("DNDModeAssertionDetails"); } return _klass; }
#line 20 "/Users/lovez/Desktop/AA/AA/tweak/dndDNDMyRecording.xm"
static void enableDND(){
	if (!assertionService) assertionService = (DNDModeAssertionService *)[_logos_static_class_lookup$DNDModeAssertionService() serviceForClientIdentifier:@"com.apple.donotdisturb.control-center.module"];
	
	DNDModeAssertionDetails *newAssertion = [_logos_static_class_lookup$DNDModeAssertionDetails() userRequestedAssertionDetailsWithIdentifier:@"com.apple.control-center.manual-toggle" modeIdentifier:@"com.apple.donotdisturb.mode.default" lifetime:nil];
	[assertionService takeModeAssertionWithDetails:newAssertion error:NULL];
	
}

static void disableDND(){
	if (!assertionService) assertionService = (DNDModeAssertionService *)[_logos_static_class_lookup$DNDModeAssertionService() serviceForClientIdentifier:@"com.apple.donotdisturb.control-center.module"];
	
	[assertionService invalidateAllActiveModeAssertionsWithError:NULL];
}

static BOOL isDNDEnabled(){
	id service = MSHookIvar<id>(UIApplication.sharedApplication, "_dndNotificationsService");
	if(!service) return 0;
	else return MSHookIvar<BOOL>(service, "_doNotDisturbActive");
}


static void _logos_method$_ungrouped$RPScreenRecorder$setRecording$(_LOGOS_SELF_TYPE_NORMAL RPScreenRecorder* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL recording){
	_logos_orig$_ungrouped$RPScreenRecorder$setRecording$(self, _cmd, recording);
	
	if(recording){
		
		DNDPreviouslyEnabled = isDNDEnabled();
		
		
		if(!isDNDEnabled()) enableDND();
	} else{
		
		if(!DNDPreviouslyEnabled && isDNDEnabled()) disableDND();
	}
}


static __attribute__((constructor)) void _logosLocalCtor_e81c20c6(int __unused argc, char __unused **argv, char __unused **envp){
	if ([[NSBundle mainBundle].bundleIdentifier isEqualToString:@"com.apple.springboard"]) {
		
		NSBundle* moduleBundle = [NSBundle bundleWithPath:@"/System/Library/ControlCenter/Bundles/ReplayKitModule.bundle"];
		if (!moduleBundle.loaded) [moduleBundle load];
		
		{Class _logos_class$_ungrouped$RPScreenRecorder = objc_getClass("RPScreenRecorder"); { MSHookMessageEx(_logos_class$_ungrouped$RPScreenRecorder, @selector(setRecording:), (IMP)&_logos_method$_ungrouped$RPScreenRecorder$setRecording$, (IMP*)&_logos_orig$_ungrouped$RPScreenRecorder$setRecording$);}}
	}
}
