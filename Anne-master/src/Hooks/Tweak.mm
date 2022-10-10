//
// Created by ren7995 on 2022-03-21 13:29:45
// Copyright (c) 2021 ren7995. All rights reserved.
//

#import "Tweak.h"
#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import <objc/runtime.h>
#import <substrate.h>

// PXNavigationListGadget

//- (void)tableView:(id)arg1 didSelectRowAtIndexPath:(NSIndexPath *)arg2
static void (*orig_didSelectRowAtIndexPath)(id, SEL, id, NSIndexPath *);
static void hooked_didSelectRowAtIndexPath(id self, SEL _cmd, id arg1, NSIndexPath *arg2) {
    UITableViewCell *cell = [arg1 cellForRowAtIndexPath:arg2];
    if([cell isKindOfClass:objc_getClass("PXNavigationListCell")] && [[[(PXNavigationListCell *)cell listItem] collection] px_isHiddenSmartAlbum]) {
        [arg1 deselectRowAtIndexPath:arg2 animated:YES];
        LAContext *ctx = [[LAContext alloc] init];
        ctx.localizedCancelTitle = @"Cancel";
        NSError *err;
        if([ctx canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&err]) {
            [ctx evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:@"Enter face bozo"
                          reply:^(BOOL success, NSError *error) {
                              if(success && error == nil) {
                                  // Must call on main thread (async so fun)
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                      orig_didSelectRowAtIndexPath(self, _cmd, arg1, arg2);
                                  });
                              }
                          }];
        } else {
            NSLog(@"%@", err);
        }
    } else {
        orig_didSelectRowAtIndexPath(self, _cmd, arg1, arg2);
    }
}

__attribute__((constructor)) static void initTweak(int __unused argc, char __unused **argv, char __unused **envp) {
    NSLog(@"Loaded into %@", [NSBundle mainBundle].bundleIdentifier);
    MSHookMessageEx(
        objc_getClass("PXNavigationListGadget"),
        @selector(tableView:didSelectRowAtIndexPath:),
        (IMP)&hooked_didSelectRowAtIndexPath,
        (IMP *)&orig_didSelectRowAtIndexPath);
}