#line 1 "/Users/lovez/Desktop/AA/AA/app/gmail-no-ads/Tweak.xm"
#import "Tweak.h"




BOOL noads;

static void reloadPrefs() {
  NSDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@PLIST_PATH] ?: [@{} mutableCopy];

  noads = [[settings objectForKey:@"noads"] ?: @(YES) boolValue];
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

@class GBTAdsCellImpl; @class AdsCell; @class GBTMailListViewControllerImpl; 


#line 14 "/Users/lovez/Desktop/AA/AA/app/gmail-no-ads/Tweak.xm"
static id (*_logos_orig$NoAds$GBTMailListViewControllerImpl$tableView$cellForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL GBTMailListViewControllerImpl* _LOGOS_SELF_CONST, SEL, id, id); static id _logos_method$NoAds$GBTMailListViewControllerImpl$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL GBTMailListViewControllerImpl* _LOGOS_SELF_CONST, SEL, id, id); static double (*_logos_meta_orig$NoAds$AdsCell$heightForObject$width$expansionState$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, double, id); static double _logos_meta_method$NoAds$AdsCell$heightForObject$width$expansionState$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, double, id); static double (*_logos_meta_orig$NoAds$AdsCell$heightForObject$width$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, double); static double _logos_meta_method$NoAds$AdsCell$heightForObject$width$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, double); static double (*_logos_meta_orig$NoAds$GBTAdsCellImpl$heightForObject$width$expansionState$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, double, id); static double _logos_meta_method$NoAds$GBTAdsCellImpl$heightForObject$width$expansionState$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, double, id); static double (*_logos_meta_orig$NoAds$GBTAdsCellImpl$heightForObject$width$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, double); static double _logos_meta_method$NoAds$GBTAdsCellImpl$heightForObject$width$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, double); 
  
    static id _logos_method$NoAds$GBTMailListViewControllerImpl$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL GBTMailListViewControllerImpl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
      id cell = _logos_orig$NoAds$GBTMailListViewControllerImpl$tableView$cellForRowAtIndexPath$(self, _cmd, arg1, arg2);
      if ([cell isKindOfClass:NSClassFromString(@"AdsCell")] || [cell isKindOfClass:NSClassFromString(@"GBTAdsCellImpl")]) {
        [cell setHidden: YES];
      } else {
        [cell setHidden: NO];
      }
      return cell;
    }
  

  
    static double _logos_meta_method$NoAds$AdsCell$heightForObject$width$expansionState$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, double arg2, id arg3) {
      return 0;
    }

    static double _logos_meta_method$NoAds$AdsCell$heightForObject$width$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, double arg2) {
      return 0;
    }
  

  
    static double _logos_meta_method$NoAds$GBTAdsCellImpl$heightForObject$width$expansionState$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, double arg2, id arg3) {
      return 0;
    }

    static double _logos_meta_method$NoAds$GBTAdsCellImpl$heightForObject$width$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, double arg2) {
      return 0;
    }
  


static __attribute__((constructor)) void _logosLocalCtor_44056092(int __unused argc, char __unused **argv, char __unused **envp) {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) reloadPrefs, CFSTR(PREF_CHANGED_NOTIF), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
  reloadPrefs();

  if (noads) {
    {Class _logos_class$NoAds$GBTMailListViewControllerImpl = objc_getClass("GBTMailListViewControllerImpl"); { MSHookMessageEx(_logos_class$NoAds$GBTMailListViewControllerImpl, @selector(tableView:cellForRowAtIndexPath:), (IMP)&_logos_method$NoAds$GBTMailListViewControllerImpl$tableView$cellForRowAtIndexPath$, (IMP*)&_logos_orig$NoAds$GBTMailListViewControllerImpl$tableView$cellForRowAtIndexPath$);}Class _logos_class$NoAds$AdsCell = objc_getClass("AdsCell"); Class _logos_metaclass$NoAds$AdsCell = object_getClass(_logos_class$NoAds$AdsCell); { MSHookMessageEx(_logos_metaclass$NoAds$AdsCell, @selector(heightForObject:width:expansionState:), (IMP)&_logos_meta_method$NoAds$AdsCell$heightForObject$width$expansionState$, (IMP*)&_logos_meta_orig$NoAds$AdsCell$heightForObject$width$expansionState$);}{ MSHookMessageEx(_logos_metaclass$NoAds$AdsCell, @selector(heightForObject:width:), (IMP)&_logos_meta_method$NoAds$AdsCell$heightForObject$width$, (IMP*)&_logos_meta_orig$NoAds$AdsCell$heightForObject$width$);}Class _logos_class$NoAds$GBTAdsCellImpl = objc_getClass("GBTAdsCellImpl"); Class _logos_metaclass$NoAds$GBTAdsCellImpl = object_getClass(_logos_class$NoAds$GBTAdsCellImpl); { MSHookMessageEx(_logos_metaclass$NoAds$GBTAdsCellImpl, @selector(heightForObject:width:expansionState:), (IMP)&_logos_meta_method$NoAds$GBTAdsCellImpl$heightForObject$width$expansionState$, (IMP*)&_logos_meta_orig$NoAds$GBTAdsCellImpl$heightForObject$width$expansionState$);}{ MSHookMessageEx(_logos_metaclass$NoAds$GBTAdsCellImpl, @selector(heightForObject:width:), (IMP)&_logos_meta_method$NoAds$GBTAdsCellImpl$heightForObject$width$, (IMP*)&_logos_meta_orig$NoAds$GBTAdsCellImpl$heightForObject$width$);}}
  }
}
