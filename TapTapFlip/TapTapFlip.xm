//
//  TapTapFlip.xm
//  TapTapFlip
//
//  Created by Juan Carlos Perez <carlos@jcarlosperez.me> on 02/01/2015.
//  Copyright © 2018 CP Digital Darkroom <tweaks@cpdigitaldarkroom.support>. All rights reserved.
//

#import "TapTapFlip.h"

static BOOL kEnabled;

UITapGestureRecognizer *tapGesture;
UIView *previewContainerView;
int cameraMode;

%group MostModernOS
%hook CAMViewfinderViewController
- (void)loadView {
    %orig;

    if(!kEnabled)
        return;

    CAMPreviewViewController *previewController = self._previewViewController;
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipCamera:)];
    tapGesture.numberOfTapsRequired = 2;
    [previewController.view addGestureRecognizer:tapGesture];
}

%new
- (void)flipCamera:(UITapGestureRecognizer *)sender {

    int const currentMode = self._modeDial.selectedMode;

    /* Camera Mode Dial Modes - Disable flipping on non-supported modes - iOS 13
    * 0 = Photo
    * 1 = Video
    * 2 = Slo-Mo / Flip not supported stock
    * 3 = Pano / Flip not supported stock
    * 4 = Square
    * 5 = Time-Lapse
    * 6 = Portrait
    */

    if ([self flipSupportedForMode:currentMode]) {
        CAMFlipButton *flipButton = self._flipButton;
        [flipButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}

%new
- (BOOL)flipSupportedForMode:(int)currentMode {
    switch (currentMode) {
        case 0:
        case 1:
        case 4:
        case 5:
        case 6: {
            return YES;
        }
        default:
            return NO;
    }
}
%end
%end

%group ModernOS
%hook CAMViewfinderViewController
- (void)loadView {
    %orig;
    if(!kEnabled)
        return;

    CAMPreviewViewController *previewController = self._previewViewController;
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipCamera:)];
    tapGesture.numberOfTapsRequired = 2;
    tapGesture.numberOfTouchesRequired = 1;
    [previewController.view addGestureRecognizer:tapGesture];
}

%new
- (void)flipCamera:(UITapGestureRecognizer *)sender {

    CAMBottomBar *bBar = self._bottomBar;
    CAMModeDial *dial = bBar.modeDial;
    int currentMode = dial.selectedMode;

    /* Camera Mode Dial Modes - Disable flipping on non-supported modes - iOS 10
    * 0 = Photo
    * 1 = Video
    * 2 = Slo-Mo / Flip not supported stock
    * 3 = Pano / Flip not supported stock
    * 4 = Square
    * 5 = Time-Lapse
    * 6 = Portrait / Flip not supported stock -- iOS 11 does support flip
    */

    if([self flipSupportedForMode:currentMode]) {
        if(iPad) {
            CAMFlipButton *flipButton = [[self valueForKey:@"_topBar"] valueForKey:@"_bottomBar"];
            [flipButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        } else {
            CAMFlipButton *flipButton = self._bottomBar.flipButton;
            [flipButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        }
    }
}

%new
- (BOOL)flipSupportedForMode:(int)currentMode {
    switch (currentMode) {
        case 0:
        case 1:
        case 4:
        case 5:
            return YES;
        case 6: {
            // iOS 10 didn't support the flip for portrait mode AFAIR, iOS 11 does
            // If this is not right for certain 10.x lmk
            if (@available(iOS 11.0, *)) {
                return YES;
            }
            return NO;
            break;
        }
        default:
            return NO;
    }
}
%end
%end

%group SomewhatModernOS
%hook CAMViewfinderView

- (void)layoutSubviews {
    %orig;
    if(!kEnabled)
        return;

    self.userInteractionEnabled = YES;

    CAMPreviewContainerView *previewContainerView = [self valueForKey:@"_previewContainerView"];
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipCamera:)];
    tapGesture.numberOfTapsRequired = 2;
    tapGesture.numberOfTouchesRequired = 1;
    [previewContainerView addGestureRecognizer:tapGesture];

}

%new
- (void)flipCamera:(UITapGestureRecognizer *)sender {

    CAMBottomBar *bBar = MSHookIvar<CAMBottomBar *>(self, "_bottomBar");
    CAMModeDial *dial = MSHookIvar<CAMModeDial *>(bBar, "_modeDial");
    NSInteger *currentMode = MSHookIvar<NSInteger *>(dial, "_selectedMode");
    if(kEnabled && ((int)(size_t)currentMode == 0 || (int)(size_t)currentMode == 1 || (int)(size_t)currentMode == 4 || (int)(size_t)currentMode == 6))
    {
        if(iPad)
        {
            CAMFlipButton *flipButton = [[self valueForKey:@"_topBar"] valueForKey:@"_bottomBar"];
            [flipButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        }
        else
        {
            CAMFlipButton *flipButton = [[self valueForKey:@"_topBar"] valueForKey:@"_flipButton"];
            [flipButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        }
    }
}
%end

%hook CMKCameraView

- (void)layoutSubviews{
    %orig;
    if(!kEnabled)
        return;

    CAMPreviewContainerView *previewContainerView = [self valueForKey:@"_previewContainerView"];
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipCamera:)];
    tapGesture.numberOfTapsRequired = 2;
    tapGesture.numberOfTouchesRequired = 1;
    [previewContainerView addGestureRecognizer:tapGesture];

}

%new
- (void)flipCamera:(UITapGestureRecognizer *)sender {
    if(kEnabled) {
        if(iPad) {
            CAMFlipButton *flipButton = [[self valueForKey:@"_topBar"] valueForKey:@"_bottomBar"];
            [flipButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        } else {
            CAMFlipButton *flipButton = [[self valueForKey:@"_topBar"] valueForKey:@"_flipButton"];
            [flipButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        }
    }
}
%end
%end

%group LegacyOS
%hook CAM_HOOK_CLASS

- (void)layoutSubviews{
    %orig;
    if(!kEnabled)
        return;

    previewContainerView = MSHookIvar<UIView *>(self, "_previewContainerView");
    tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipCamera:)];
    tapGesture.numberOfTapsRequired = 2;
    tapGesture.numberOfTouchesRequired = 1;
    [previewContainerView addGestureRecognizer:tapGesture];
}

%new
- (void)flipCamera:(UITapGestureRecognizer *)sender {
    if(kEnabled)
    {
        [[self _flipButton] sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
}
%end
%end

static void loadPrefs() {
    CFPreferencesAppSynchronize(CFSTR("com.cpdigitaldarkroom.taptapflip"));
    kEnabled = !CFPreferencesCopyAppValue(CFSTR("isEnabled"), CFSTR("com.cpdigitaldarkroom.taptapflip")) ? YES : [(id)CFBridgingRelease(CFPreferencesCopyAppValue(CFSTR("isEnabled"), CFSTR("com.cpdigitaldarkroom.taptapflip"))) boolValue];
}

%ctor{

    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.cpdigitaldarkroom.taptapflip/settingschanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);

    loadPrefs();

    if (IS_IOS_OR_NEWER(iOS_9_0) && !IS_IOS_OR_NEWER(iOS_10_0)) {
        %init(SomewhatModernOS);
    } else if (@available(iOS 13.0, *)) {
        if (IS_IOS_OR_NEWER(iOS_13_0)) {
            %init(MostModernOS);
        } else {
            Class camClass = nil;
            if (IS_IOS_BETWEEN(iOS_7_0, iOS_7_1)) {
                camClass = objc_getClass("PLCameraView");
            } else {
                camClass = objc_getClass("CAMCameraView");
            }
            %init(LegacyOS, CAM_HOOK_CLASS=camClass);
        }
    }
    else {
        %init(ModernOS);
    }
}
