#line 1 "/Users/lovez/Desktop/AA/AA/date-bar/Tweak.x"
#import <UIKit/UIKit.h>


#define prefs @"/var/mobile/Library/Preferences/com.eliofegh.date-bar.plist"


NSMutableDictionary *MutDiction;

static NSString *prefsAnswer;







void loadprefs(){

 MutDiction = [[NSMutableDictionary alloc] initWithContentsOfFile: prefs];


prefsAnswer = [MutDiction objectForKey: @ "answer"];



}





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

@class _UIStatusBarStringView; 
static void (*_logos_orig$_ungrouped$_UIStatusBarStringView$setText$)(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$_UIStatusBarStringView$setText$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST, SEL, id); 

#line 31 "/Users/lovez/Desktop/AA/AA/date-bar/Tweak.x"



static void _logos_method$_ungrouped$_UIStatusBarStringView$setText$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarStringView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){




 if([arg1 containsString:@":"]){

 NSDate* currentDate = [NSDate date];

 NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
formatter.dateFormat = prefsAnswer;
NSString *string = [formatter stringFromDate:currentDate];


 if(!prefsAnswer){

  return _logos_orig$_ungrouped$_UIStatusBarStringView$setText$(self, _cmd, arg1);

}


  return _logos_orig$_ungrouped$_UIStatusBarStringView$setText$(self, _cmd, string);

}

	
	_logos_orig$_ungrouped$_UIStatusBarStringView$setText$(self, _cmd, arg1);

}







static __attribute__((constructor)) void _logosLocalCtor_538b864b(int __unused argc, char __unused **argv, char __unused **envp){

loadprefs();


CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadprefs, CFSTR("com.eliofegh.date-bar.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$_UIStatusBarStringView = objc_getClass("_UIStatusBarStringView"); { MSHookMessageEx(_logos_class$_ungrouped$_UIStatusBarStringView, @selector(setText:), (IMP)&_logos_method$_ungrouped$_UIStatusBarStringView$setText$, (IMP*)&_logos_orig$_ungrouped$_UIStatusBarStringView$setText$);}} }
#line 79 "/Users/lovez/Desktop/AA/AA/date-bar/Tweak.x"
