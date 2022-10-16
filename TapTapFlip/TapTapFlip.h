//
//  TapTapFlip.h
//  TapTapFlip
//
//  Created by Juan Carlos Perez <carlos@jcarlosperez.me> on 07/10/2018.
//  Copyright © 2018 CP Digital Darkroom <tweaks@cpdigitaldarkroom.support>. All rights reserved.
//

#import <version.h>

#ifndef kCFCoreFoundationVersionNumber_iOS_13_0
#define kCFCoreFoundationVersionNumber_iOS_13_0 1665.15
#endif

#define iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define CURRENT_INTERFACE_ORIENTATION iPad ? [[UIApplication sharedApplication] statusBarOrientation] : [[UIApplication sharedApplication] activeInterfaceOrientation]

@interface CAMFlipButton : UIButton
@end

@interface CMKFlipButton : UIButton
@end

@interface CAMModeDial : UIControl
@property (nonatomic) int selectedMode;
@end

@interface CAMTopBar : UIView
@property (nonatomic, retain) CAMFlipButton *flipButton;
@end

@interface CAMBottomBar : UIView
@property (nonatomic, retain) CAMModeDial *modeDial;
@property (nonatomic, retain) CAMFlipButton *flipButton;
@end

@interface CAMPreviewContainerView : UIView
@end

@interface CAMViewfinderView : UIView
-(CMKFlipButton *)_flipButton;
@end

@interface CMKCameraView : UIView
-(CMKFlipButton *)_flipButton;
@end

@interface CAMCameraView : UIView
- (CAMFlipButton *)_flipButton;
@end

@interface PLCameraView : UIView
- (CAMFlipButton *)_flipButton;
@end

@interface CAMPreviewViewController : UIViewController
@end

@interface CAMViewfinderViewController : UIViewController
@property (nonatomic, readonly) CAMPreviewViewController *_previewViewController;
@property (nonatomic, readonly) CAMBottomBar *_bottomBar;
@property (nonatomic, readonly) CAMTopBar *_topBar;
@property (nonatomic,readonly) CAMModeDial * _modeDial;
@property (nonatomic,readonly) CAMFlipButton * _flipButton; 

- (BOOL)flipSupportedForMode:(int)currentMode; // Added by TTF

@end
