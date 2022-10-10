#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SpringBoard
-(void)applicationDidFinishLaunching:(id)arg1;
@end

@interface SBAirplaneModeController
@property (assign,getter=isInAirplaneMode,nonatomic) BOOL inAirplaneMode; 
+(id)sharedInstance;
-(BOOL)isInAirplaneMode;
-(void)setInAirplaneMode:(BOOL)arg1 ;
@end

%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)application 
{
    %orig;
	[[%c(SBAirplaneModeController) sharedInstance] setInAirplaneMode:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
		[[%c(SBAirplaneModeController) sharedInstance] setInAirplaneMode:NO];
	});
}
%end