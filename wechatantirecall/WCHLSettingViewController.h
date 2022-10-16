//
//  ViewController.h
//  WCSettingUI
//
//  Created by 排骨 on 2020/8/4.
//  Copyright © 2020 排骨. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WCHLOptions.h"
#import "WCHLHeaders.h"
//#import "WBBaseViewController.h"


@interface WCHLSettingViewController : UIViewController
@end
@interface demoAlertView : UIView
@end



@interface OBButtonTray : UIView
- (void)addButton:(id)arg1;
- (void)setStackViewTopConstraint:(NSLayoutConstraint *)arg1;
- (NSLayoutConstraint *)stackViewTopConstraint;
- (void)setEffectView:(UIVisualEffectView *)arg1;
@end

@interface OBBuddyContinueButton : UIButton
+ (id)buttonWithType:(long long)arg1;
@end

@interface OBWelcomeController : UIViewController
- (id)initWithTitle:(id)arg1 detailText:(id)arg2 icon:(id)arg3;
- (void)addBulletedListItemWithTitle:(id)arg1 description:(id)arg2 image:(id)arg3;
- (void)setButtonTray:(OBButtonTray *)arg1;
@property (nonatomic,retain) OBButtonTray *buttonTray;
@end

@interface UIImage (Private)
+ (id)_applicationIconImageForBundleIdentifier:(id)arg1 format:(int)arg2 scale:(double)arg3;
@end
OBButtonTray *btnTray;
OBWelcomeController *welcomeController;

