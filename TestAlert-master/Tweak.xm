// TestAlert for Theos by @iiS4iF
// https://github.com/iis4if/TestAlert

#import <UIKit/UIKit.h>
#import <SCLAlertView/SCLAlertView.h>
#import <CoreGraphics/CoreGraphics.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import <AVFoundation/AVFoundation.h>


%hook WhatsAppAppDelegate
- (void)applicationDidBecomeActive:(id)arg1 {
    
    %orig;
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"FirstRun"]) {
        SCLAlertView *SCalert = [[SCLAlertView alloc] initWithNewWindow];
        SCalert.backgroundType = SCLAlertViewBackgroundBlur;
        [SCalert showNotice:@"TestAlert" subTitle:@"Using SCLAlertView for $TEOS 💯" closeButtonTitle:@"👍🏼" duration:0.0f];
        
        
        
        
        
        [[NSUserDefaults standardUserDefaults] setValue:@"1strun" forKey:@"FirstRun"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
}

%end