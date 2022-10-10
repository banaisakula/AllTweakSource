#line 1 "/Users/lovez/Desktop/AA/AA/tweak/3developer.x"
#include "3developer.h"


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

@class SBIconView; @class SpringBoard; @class SBSApplicationShortcutItem; 
static void (*_logos_orig$_ungrouped$SBIconView$setApplicationShortcutItems$)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL, NSArray *); static void _logos_method$_ungrouped$SBIconView$setApplicationShortcutItems$(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL, NSArray *); static void (*_logos_meta_orig$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, SBSApplicationShortcutItem *, NSString *, SBIconView *); static void _logos_meta_method$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, SBSApplicationShortcutItem *, NSString *, SBIconView *); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBSApplicationShortcutItem(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBSApplicationShortcutItem"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SpringBoard(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SpringBoard"); } return _klass; }
#line 3 "/Users/lovez/Desktop/AA/AA/tweak/3developer.x"

static void _logos_method$_ungrouped$SBIconView$setApplicationShortcutItems$(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSArray * arg1) {
  NSMutableArray *originalItems = [[NSMutableArray alloc] init];
  for (SBSApplicationShortcutItem *item in arg1) {
    [originalItems addObject:item];
  }
    
    
    SBSApplicationShortcutItem *flexItem =
        [_logos_static_class_lookup$SBSApplicationShortcutItem() alloc];

    flexItem.localizedTitle = @"Flexdecrypt11";
    
    SBSApplicationShortcutSystemPrivateIcon *flexIcon =
        [[SBSApplicationShortcutSystemPrivateIcon alloc]
            initWithSystemImageName:@"chevron.left.slash.chevron.right"];
    [flexItem setIcon:flexIcon];
    flexItem.type = @"com.hearse.3developer.flex";
    [originalItems addObject:flexItem];

    
    SBSApplicationShortcutItem *copyBundleItem =
        [_logos_static_class_lookup$SBSApplicationShortcutItem() alloc];
    copyBundleItem.localizedTitle = @"Copy Bundle ID";
    copyBundleItem.localizedSubtitle = self.applicationBundleIdentifierForShortcuts;
    SBSApplicationShortcutSystemPrivateIcon *copyBundleIcon =
        [[SBSApplicationShortcutSystemPrivateIcon alloc]
            initWithSystemImageName:@"app.badge"];
    [copyBundleItem setIcon:copyBundleIcon];
    copyBundleItem.type = @"com.hearse.3developer.bundle";
    [originalItems addObject:copyBundleItem];
    

    
    SBSApplicationShortcutItem *openBundleItem =
        [_logos_static_class_lookup$SBSApplicationShortcutItem() alloc];
    openBundleItem.localizedTitle = @"Open Bundle In Filza";
    SBSApplicationShortcutSystemPrivateIcon *openBundleIcon =
        [[SBSApplicationShortcutSystemPrivateIcon alloc]
            initWithSystemImageName:@"doc.fill"];
    [openBundleItem setIcon:openBundleIcon];
    openBundleItem.type = @"com.hearse.3developer.openBundleInFilza";
    [originalItems addObject:openBundleItem];

  _logos_orig$_ungrouped$SBIconView$setApplicationShortcutItems$(self, _cmd, originalItems);
}



static void _logos_meta_method$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, SBSApplicationShortcutItem * item, NSString * bundleID, SBIconView * iconView) {
  if ([[item type] isEqualToString:@"com.hearse.3developer.flex"]) {

    FBApplicationInfo *app =
        (FBApplicationInfo *)[[NSClassFromString(@"SBApplicationController")
                                  sharedInstance]
            applicationWithBundleIdentifier:bundleID]
            .info;

    NSTask *task = [[NSTask alloc] init];
    [task setLaunchPath:@"/usr/bin/flexdecrypt"];
    [task setArguments:@[ app.executableURL.path ]];
    NSPipe *out = [NSPipe pipe];
    [task setStandardOutput:out];

    [task setTerminationHandler:^(NSTask *task) {
      dispatch_async(dispatch_get_main_queue(), ^{
        NSFileHandle *read = [out fileHandleForReading];
        NSData *dataRead = [read readDataToEndOfFile];
        NSString *stringRead =
            [[NSString alloc] initWithData:dataRead
                                  encoding:NSUTF8StringEncoding];
        UIAlertController *alert = [UIAlertController
            alertControllerWithTitle:@"Flexdecrypt"
                             message:stringRead
                      preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *dismissAction = [UIAlertAction
            actionWithTitle:@"Dismiss"
                      style:UIAlertActionStyleDefault
                    handler:^(UIAlertAction *action) {
                    }];
        UIAlertAction *filzaAction = [UIAlertAction
            actionWithTitle:@"Open in Filza"
                      style:UIAlertActionStyleDefault
                    handler:^(UIAlertAction *action) {
                      NSString *decryptedPath = [[NSString alloc]
                          initWithFormat:
                              @"%@",
                              [stringRead
                                  stringByReplacingOccurrencesOfString:
                                      @"Wrote decrypted image to "
                                                            withString:@""]];

                      NSString *pathInFilza = [@"filza://view"
                               stringByAppendingString:decryptedPath];
NSString* trimmedUrlString = [pathInFilza stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                      NSURL *url = [NSURL
                          URLWithString:
                              [trimmedUrlString
                                  stringByAddingPercentEncodingWithAllowedCharacters:
                                      [NSCharacterSet
                                          URLQueryAllowedCharacterSet]]];

                      NSLog(@"NSLogify |%@|", url);
                      [[_logos_static_class_lookup$SpringBoard() sharedApplication]
                          applicationOpenURL:url];
                    }];
        [alert addAction:dismissAction];
        [alert addAction:filzaAction];

        [iconView.window.rootViewController presentViewController:alert
                                                         animated:YES
                                                       completion:nil];
      });
    }];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
      [task launch];
    });

  } else if ([[item type] isEqualToString:@"com.hearse.3developer.bundle"]) {
  
   UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = bundleID;
  }else if ([[item type]
                 isEqualToString:@"com.hearse.3developer.openBundleInFilza"]) {

    FBApplicationInfo *app =
        (FBApplicationInfo *)[[NSClassFromString(@"SBApplicationController")
                                  sharedInstance]
            applicationWithBundleIdentifier:bundleID]
            .info;
    NSString *pathInFilza =
        [@"filza://view" stringByAppendingString:app.bundleURL.path];
    NSURL *url = [NSURL
        URLWithString:[pathInFilza
                          stringByAddingPercentEncodingWithAllowedCharacters:
                              [NSCharacterSet URLQueryAllowedCharacterSet]]];
    [[_logos_static_class_lookup$SpringBoard() sharedApplication] applicationOpenURL:url];

  } else {
    _logos_meta_orig$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$(self, _cmd, item, bundleID, iconView);
  }
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBIconView = objc_getClass("SBIconView"); Class _logos_metaclass$_ungrouped$SBIconView = object_getClass(_logos_class$_ungrouped$SBIconView); { MSHookMessageEx(_logos_class$_ungrouped$SBIconView, @selector(setApplicationShortcutItems:), (IMP)&_logos_method$_ungrouped$SBIconView$setApplicationShortcutItems$, (IMP*)&_logos_orig$_ungrouped$SBIconView$setApplicationShortcutItems$);}{ MSHookMessageEx(_logos_metaclass$_ungrouped$SBIconView, @selector(activateShortcut:withBundleIdentifier:forIconView:), (IMP)&_logos_meta_method$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$, (IMP*)&_logos_meta_orig$_ungrouped$SBIconView$activateShortcut$withBundleIdentifier$forIconView$);}} }
#line 147 "/Users/lovez/Desktop/AA/AA/tweak/3developer.x"
