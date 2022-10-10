#import <UIKit/UIKit.h>
#import "../headers/ControlCenterUIKit/CCUIToggleModule.h"
#import "../Common.h"

@interface PCCRespring : CCUIToggleModule <UIAlertViewDelegate>
@property (nonatomic, assign, readwrite) BOOL fakeEnabledSetting;
@end

@implementation PCCRespring
- (UIImage *)iconGlyph {
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]]];
}

- (UIColor *)selectedColor {
	return [UIColor colorWithRed:0.972 green:0.8 blue:0.274 alpha:1];
}

- (BOOL)isSelected {
	return self.fakeEnabledSetting;
}

- (void)setSelected:(BOOL)selected {
    selected = NO;
	self.fakeEnabledSetting = selected;

    [[[UIAlertView alloc] initWithTitle:nil message:@"Confirm Respring" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm",nil] show];
	[super refreshState];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex])
    {
        SpringBoard *sb = (SpringBoard *)[%c(SpringBoard) sharedApplication];
        if ([sb respondsToSelector:@selector(relaunchSpringBoard)]) {
            [sb _relaunchSpringBoardNow];
        }
    	else if ([sb isKindOfClass:[%c(FBSystemApp) class]]) {
            FBSystemApp *fb = (FBSystemApp *)[%c(FBSystemApp) sharedApplication];
        	[fb sendActionsToBackboard:
                [NSSet setWithObject:[%c(BKSRestartAction) actionWithOptions:1]]];
    	}	
        else {
            SBRestartTransitionRequest *request = [[%c(SBRestartTransitionRequest) alloc] initWithRequester:@"" reason:@""];
            [sb.restartManager restartWithTransitionRequest:request];
        }
    }
}
@end
