#line 1 "/Users/lovez/Desktop/AA/AA/app/DismissProgress/Tweak.xm"
#import <notify.h>

@interface UINavigationController (Cydia)
- (UIViewController *)parentOrPresentingViewController;
@end

@interface Cydia : UIApplication
- (void)cancelAndClear:(bool)clear;
- (void)reloadData;
- (void)returnToCydia;
@end

@interface CydiaProgressData : NSObject
- (id)running;
@end

@interface ProgressController : UIViewController
- (UIBarButtonItem *)rightButton;
@end

static inline NSString *UCLocalizeEx(NSString *key, NSString *value = nil) {
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}
#define UCLocalize(key) UCLocalizeEx(@ key)

static inline void UpdateExternalStatus(uint64_t newStatus) {
    int notify_token;
    if (notify_register_check("com.saurik.Cydia.status", &notify_token) == NOTIFY_STATUS_OK) {
        notify_set_state(notify_token, newStatus);
        notify_cancel(notify_token);
    }
    notify_post("com.saurik.Cydia.status");
}

CydiaProgressData *cpd;


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

@class CydiaProgressData; @class ProgressController; 
static CydiaProgressData* (*_logos_orig$_ungrouped$CydiaProgressData$init)(_LOGOS_SELF_TYPE_INIT CydiaProgressData*, SEL) _LOGOS_RETURN_RETAINED; static CydiaProgressData* _logos_method$_ungrouped$CydiaProgressData$init(_LOGOS_SELF_TYPE_INIT CydiaProgressData*, SEL) _LOGOS_RETURN_RETAINED; static void _logos_method$_ungrouped$ProgressController$dp_close(_LOGOS_SELF_TYPE_NORMAL ProgressController* _LOGOS_SELF_CONST, SEL); static UIBarButtonItem * (*_logos_orig$_ungrouped$ProgressController$rightButton)(_LOGOS_SELF_TYPE_NORMAL ProgressController* _LOGOS_SELF_CONST, SEL); static UIBarButtonItem * _logos_method$_ungrouped$ProgressController$rightButton(_LOGOS_SELF_TYPE_NORMAL ProgressController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$ProgressController$applyRightButton)(_LOGOS_SELF_TYPE_NORMAL ProgressController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$ProgressController$applyRightButton(_LOGOS_SELF_TYPE_NORMAL ProgressController* _LOGOS_SELF_CONST, SEL); 

#line 37 "/Users/lovez/Desktop/AA/AA/app/DismissProgress/Tweak.xm"


static CydiaProgressData* _logos_method$_ungrouped$CydiaProgressData$init(_LOGOS_SELF_TYPE_INIT CydiaProgressData* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    self = _logos_orig$_ungrouped$CydiaProgressData$init(self, _cmd);
    cpd = self;
    return self;
}






static void _logos_method$_ungrouped$ProgressController$dp_close(_LOGOS_SELF_TYPE_NORMAL ProgressController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    UpdateExternalStatus(0);
    Cydia *delegate = (Cydia *)[UIApplication sharedApplication];
    [delegate returnToCydia];
    [delegate cancelAndClear:YES];
    [[[self navigationController] parentOrPresentingViewController] dismissViewControllerAnimated:YES completion:^(void) {
        [delegate reloadData];
    }];
}

static UIBarButtonItem * _logos_method$_ungrouped$ProgressController$rightButton(_LOGOS_SELF_TYPE_NORMAL ProgressController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return ![[cpd running] boolValue] ? [[[UIBarButtonItem alloc]
        initWithTitle:UCLocalize("CLOSE")
        style:UIBarButtonItemStylePlain
        target:self
        action:@selector(dp_close)
    ] autorelease] : _logos_orig$_ungrouped$ProgressController$rightButton(self, _cmd);
}

static void _logos_method$_ungrouped$ProgressController$applyRightButton(_LOGOS_SELF_TYPE_NORMAL ProgressController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (![[cpd running] boolValue])
        [[self navigationItem] setRightBarButtonItem:[self rightButton]];
    else
        _logos_orig$_ungrouped$ProgressController$applyRightButton(self, _cmd);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CydiaProgressData = objc_getClass("CydiaProgressData"); { MSHookMessageEx(_logos_class$_ungrouped$CydiaProgressData, @selector(init), (IMP)&_logos_method$_ungrouped$CydiaProgressData$init, (IMP*)&_logos_orig$_ungrouped$CydiaProgressData$init);}Class _logos_class$_ungrouped$ProgressController = objc_getClass("ProgressController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$ProgressController, @selector(dp_close), (IMP)&_logos_method$_ungrouped$ProgressController$dp_close, _typeEncoding); }{ MSHookMessageEx(_logos_class$_ungrouped$ProgressController, @selector(rightButton), (IMP)&_logos_method$_ungrouped$ProgressController$rightButton, (IMP*)&_logos_orig$_ungrouped$ProgressController$rightButton);}{ MSHookMessageEx(_logos_class$_ungrouped$ProgressController, @selector(applyRightButton), (IMP)&_logos_method$_ungrouped$ProgressController$applyRightButton, (IMP*)&_logos_orig$_ungrouped$ProgressController$applyRightButton);}} }
#line 77 "/Users/lovez/Desktop/AA/AA/app/DismissProgress/Tweak.xm"
