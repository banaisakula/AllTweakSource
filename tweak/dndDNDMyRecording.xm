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

static void enableDND(){
	if (!assertionService) assertionService = (DNDModeAssertionService *)[%c(DNDModeAssertionService) serviceForClientIdentifier:@"com.apple.donotdisturb.control-center.module"];
	
	DNDModeAssertionDetails *newAssertion = [%c(DNDModeAssertionDetails) userRequestedAssertionDetailsWithIdentifier:@"com.apple.control-center.manual-toggle" modeIdentifier:@"com.apple.donotdisturb.mode.default" lifetime:nil];
	[assertionService takeModeAssertionWithDetails:newAssertion error:NULL];
	
}

static void disableDND(){
	if (!assertionService) assertionService = (DNDModeAssertionService *)[%c(DNDModeAssertionService) serviceForClientIdentifier:@"com.apple.donotdisturb.control-center.module"];
	
	[assertionService invalidateAllActiveModeAssertionsWithError:NULL];
}

static BOOL isDNDEnabled(){
	id service = MSHookIvar<id>(UIApplication.sharedApplication, "_dndNotificationsService");
	if(!service) return 0;
	else return MSHookIvar<BOOL>(service, "_doNotDisturbActive");
}

%hook RPScreenRecorder
-(void)setRecording:(BOOL)recording{
	%orig;
	
	if(recording){
		//If a recording started, store the previous DND state
		DNDPreviouslyEnabled = isDNDEnabled();
		
		//Enable DND if it isn't already active
		if(!isDNDEnabled()) enableDND();
	} else{
		//Disable DND if it isn't already disabled, but only disable if DND wasn't already on before the recording started
		if(!DNDPreviouslyEnabled && isDNDEnabled()) disableDND();
	}
}
%end

%ctor{
	if ([[NSBundle mainBundle].bundleIdentifier isEqualToString:@"com.apple.springboard"]) {
		//Load ReplayKitModule bundle so we can hook it
		NSBundle* moduleBundle = [NSBundle bundleWithPath:@"/System/Library/ControlCenter/Bundles/ReplayKitModule.bundle"];
		if (!moduleBundle.loaded) [moduleBundle load];
		
		%init;
	}
}
