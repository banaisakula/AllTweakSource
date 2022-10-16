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

%hook CydiaProgressData

- (id)init {
    self = %orig;
    cpd = self;
    return self;
}

%end

%hook ProgressController

%new
- (void)dp_close {
    UpdateExternalStatus(0);
    Cydia *delegate = (Cydia *)[UIApplication sharedApplication];
    [delegate returnToCydia];
    [delegate cancelAndClear:YES];
    [[[self navigationController] parentOrPresentingViewController] dismissViewControllerAnimated:YES completion:^(void) {
        [delegate reloadData];
    }];
}

- (UIBarButtonItem *)rightButton {
    return ![[cpd running] boolValue] ? [[[UIBarButtonItem alloc]
        initWithTitle:UCLocalize("CLOSE")
        style:UIBarButtonItemStylePlain
        target:self
        action:@selector(dp_close)
    ] autorelease] : %orig;
}

- (void)applyRightButton {
    if (![[cpd running] boolValue])
        [[self navigationItem] setRightBarButtonItem:[self rightButton]];
    else
        %orig;
}

%end
