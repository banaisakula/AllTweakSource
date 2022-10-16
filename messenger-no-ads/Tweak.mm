#line 1 "/Users/lovez/Desktop/AA/AA/app/messenger-no-ads/Tweak.xm"
#include "Tweak.h"




BOOL hasCompletedIntroduction;
BOOL noads;
BOOL disablereadreceipt;
BOOL disabletypingindicator;
BOOL disablestoryseenreceipt;
BOOL cansavefriendsstory;
BOOL hidesearchbar;
BOOL hidestoriesrow;
BOOL hidepeopletab;
BOOL hideSuggestedContactInSearch;
BOOL showTheEyeButton;
BOOL extendStoryVideoUploadLength;
NSString *plistPath;
NSMutableDictionary *settings;

static void reloadPrefs() {
  plistPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@PLIST_FILENAME];
  settings = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath] ?: [@{} mutableCopy];

  hasCompletedIntroduction = [[settings objectForKey:@"hasCompletedIntroduction"] ?: @(NO) boolValue];
  noads = [[settings objectForKey:@"noads"] ?: @(YES) boolValue];
  disablereadreceipt = [[settings objectForKey:@"disablereadreceipt"] ?: @(YES) boolValue];
  disabletypingindicator = [[settings objectForKey:@"disabletypingindicator"] ?: @(YES) boolValue];
  disablestoryseenreceipt = [[settings objectForKey:@"disablestoryseenreceipt"] ?: @(YES) boolValue];
  cansavefriendsstory = [[settings objectForKey:@"cansavefriendsstory"] ?: @(YES) boolValue];
  hidesearchbar = [[settings objectForKey:@"hidesearchbar"] ?: @(NO) boolValue];
  hidestoriesrow = [[settings objectForKey:@"hidestoriesrow"] ?: @(NO) boolValue];
  hidepeopletab = [[settings objectForKey:@"hidepeopletab"] ?: @(NO) boolValue];
  hideSuggestedContactInSearch = [[settings objectForKey:@"hideSuggestedContactInSearch"] ?: @(NO) boolValue];
  showTheEyeButton = [[settings objectForKey:@"showTheEyeButton"] ?: @(YES) boolValue];
  extendStoryVideoUploadLength = [[settings objectForKey:@"extendStoryVideoUploadLength"] ?: @(YES) boolValue];
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

@class LSStoryBucketViewController; @class UITabBarController; @class LSStoryOverlayProfileView; @class MSGVideoTrimmerPresenter; @class LSMessageListViewController; @class MSGThreadListDataSource; @class LSContactListViewController; @class MSGSplitViewController; @class LSComposerViewController; @class LSAppDelegate; @class MSGListBinder; @class MDSSplitViewController; @class LSStoryViewerContentController; @class MSGMessageListViewController; @class UINavigationController; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$LSAppDelegate(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("LSAppDelegate"); } return _klass; }
#line 42 "/Users/lovez/Desktop/AA/AA/app/messenger-no-ads/Tweak.xm"
static void (*_logos_orig$CommonGroup$LSAppDelegate$applicationDidBecomeActive$)(_LOGOS_SELF_TYPE_NORMAL LSAppDelegate* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$CommonGroup$LSAppDelegate$applicationDidBecomeActive$(_LOGOS_SELF_TYPE_NORMAL LSAppDelegate* _LOGOS_SELF_CONST, SEL, id); static id _logos_meta_method$CommonGroup$LSAppDelegate$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$CommonGroup$MSGSplitViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$CommonGroup$MSGSplitViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$CommonGroup$MSGSplitViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CommonGroup$MSGSplitViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CommonGroup$MSGSplitViewController$initEyeButton(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CommonGroup$MSGSplitViewController$handleSideSwitchTap$(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$CommonGroup$MSGSplitViewController$move$(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST, SEL, UIPanGestureRecognizer*); static void (*_logos_orig$CommonGroup$MDSSplitViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$CommonGroup$MDSSplitViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$CommonGroup$MDSSplitViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CommonGroup$MDSSplitViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CommonGroup$MDSSplitViewController$initEyeButton(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CommonGroup$MDSSplitViewController$handleSideSwitchTap$(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$CommonGroup$MDSSplitViewController$move$(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST, SEL, UIPanGestureRecognizer*); static id (*_logos_orig$CommonGroup$MSGListBinder$tableView$cellForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL MSGListBinder* _LOGOS_SELF_CONST, SEL, UITableView *, id); static id _logos_method$CommonGroup$MSGListBinder$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL MSGListBinder* _LOGOS_SELF_CONST, SEL, UITableView *, id); static void _logos_method$CommonGroup$MSGListBinder$handleMNACellTap$(_LOGOS_SELF_TYPE_NORMAL MSGListBinder* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$CommonGroup$LSContactListViewController$_updateContactList)(_LOGOS_SELF_TYPE_NORMAL LSContactListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CommonGroup$LSContactListViewController$_updateContactList(_LOGOS_SELF_TYPE_NORMAL LSContactListViewController* _LOGOS_SELF_CONST, SEL); 
  
    static LSAppDelegate *__weak sharedInstance;

    static void _logos_method$CommonGroup$LSAppDelegate$applicationDidBecomeActive$(_LOGOS_SELF_TYPE_NORMAL LSAppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      _logos_orig$CommonGroup$LSAppDelegate$applicationDidBecomeActive$(self, _cmd, arg1);
      sharedInstance = self;
    }

    
    static id _logos_meta_method$CommonGroup$LSAppDelegate$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      return sharedInstance;
    }
  

  
    __attribute__((used)) static UIView * _logos_property$CommonGroup$MSGSplitViewController$sideSwitch(MSGSplitViewController * __unused self, SEL __unused _cmd) { return (UIView *)objc_getAssociatedObject(self, (void *)_logos_property$CommonGroup$MSGSplitViewController$sideSwitch); }; __attribute__((used)) static void _logos_property$CommonGroup$MSGSplitViewController$setSideSwitch(MSGSplitViewController * __unused self, SEL __unused _cmd, UIView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$CommonGroup$MSGSplitViewController$sideSwitch, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
    __attribute__((used)) static UIImageView * _logos_property$CommonGroup$MSGSplitViewController$imageView(MSGSplitViewController * __unused self, SEL __unused _cmd) { return (UIImageView *)objc_getAssociatedObject(self, (void *)_logos_property$CommonGroup$MSGSplitViewController$imageView); }; __attribute__((used)) static void _logos_property$CommonGroup$MSGSplitViewController$setImageView(MSGSplitViewController * __unused self, SEL __unused _cmd, UIImageView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$CommonGroup$MSGSplitViewController$imageView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

    static void _logos_method$CommonGroup$MSGSplitViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
      _logos_orig$CommonGroup$MSGSplitViewController$viewDidAppear$(self, _cmd, arg1);
      if (!hasCompletedIntroduction) {
        [self presentViewController:[MNAIntroViewController new] animated:YES completion:nil];
      }
    }

    static void _logos_method$CommonGroup$MSGSplitViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      _logos_orig$CommonGroup$MSGSplitViewController$viewDidLoad(self, _cmd);
      if (showTheEyeButton) {
        [self initEyeButton];
      }
    }

    
    static void _logos_method$CommonGroup$MSGSplitViewController$initEyeButton(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      self.sideSwitch = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 50, self.view.frame.size.height / 2 - 60, 50, 50)];
      self.sideSwitch.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
      self.sideSwitch.layer.cornerRadius = 10;
      self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
      self.imageView.contentMode = UIViewContentModeScaleAspectFit;
      self.imageView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", @PREF_BUNDLE_PATH, disablereadreceipt ? @"no-see.png" : @"see.png"]];
      self.imageView.alpha = 0.8;
      [self.sideSwitch addSubview:self.imageView];

      UITapGestureRecognizer *sideSwitchTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSideSwitchTap:)];
      [self.sideSwitch addGestureRecognizer:sideSwitchTap];
      [self.view addSubview:self.sideSwitch];

      UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
      [panRecognizer setMinimumNumberOfTouches:1];
      [panRecognizer setMaximumNumberOfTouches:1];
      [self.sideSwitch addGestureRecognizer:panRecognizer];
    }

    
    static void _logos_method$CommonGroup$MSGSplitViewController$handleSideSwitchTap$(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITapGestureRecognizer * recognizer) {
      [settings setObject:[NSNumber numberWithBool:!disablereadreceipt] forKey:@"disablereadreceipt"];
      BOOL success = [settings writeToFile:plistPath atomically:YES];

      if (!success) {
        [HCommon showAlertMessage:@"Can't write file" withTitle:@"Error" viewController:nil];
      } else {
        self.imageView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", @PREF_BUNDLE_PATH, !disablereadreceipt ? @"no-see.png" : @"see.png"]];
        notify_post(PREF_CHANGED_NOTIF);
      }
    }

    
    static void _logos_method$CommonGroup$MSGSplitViewController$move$(_LOGOS_SELF_TYPE_NORMAL MSGSplitViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIPanGestureRecognizer* sender) {
      
      [self.view bringSubviewToFront:sender.view];
      CGPoint translatedPoint = [sender translationInView:sender.view.superview];

      if (sender.state == UIGestureRecognizerStateBegan) {
        
        
      }

      translatedPoint = CGPointMake(sender.view.center.x+translatedPoint.x, sender.view.center.y+translatedPoint.y);

      [sender.view setCenter:translatedPoint];
      [sender setTranslation:CGPointZero inView:sender.view];

      if (sender.state == UIGestureRecognizerStateEnded) {
        CGFloat velocityX = (0.2*[sender velocityInView:self.view].x);
        CGFloat velocityY = (0.2*[sender velocityInView:self.view].y);

        CGFloat finalX = translatedPoint.x + velocityX;
        CGFloat finalY = translatedPoint.y + velocityY;

        if (finalX < self.view.frame.size.width / 2) {
          finalX = 0 + sender.view.frame.size.width / 2;
        } else {
          finalX = self.view.frame.size.width - sender.view.frame.size.width / 2;
        }

        if (finalY < 50) { 
          finalY = 50;
        } else if (finalY > self.view.frame.size.height - 75) { 
          finalY = self.view.frame.size.height - 75;
        }

        CGFloat animationDuration = (ABS(velocityX)*.0002)+.2;

        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:animationDuration];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidFinish)];
        [[sender view] setCenter:CGPointMake(finalX, finalY)];
        [UIView commitAnimations];
      }
    }
  

  
    __attribute__((used)) static UIView * _logos_property$CommonGroup$MDSSplitViewController$sideSwitch(MDSSplitViewController * __unused self, SEL __unused _cmd) { return (UIView *)objc_getAssociatedObject(self, (void *)_logos_property$CommonGroup$MDSSplitViewController$sideSwitch); }; __attribute__((used)) static void _logos_property$CommonGroup$MDSSplitViewController$setSideSwitch(MDSSplitViewController * __unused self, SEL __unused _cmd, UIView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$CommonGroup$MDSSplitViewController$sideSwitch, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
    __attribute__((used)) static UIImageView * _logos_property$CommonGroup$MDSSplitViewController$imageView(MDSSplitViewController * __unused self, SEL __unused _cmd) { return (UIImageView *)objc_getAssociatedObject(self, (void *)_logos_property$CommonGroup$MDSSplitViewController$imageView); }; __attribute__((used)) static void _logos_property$CommonGroup$MDSSplitViewController$setImageView(MDSSplitViewController * __unused self, SEL __unused _cmd, UIImageView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$CommonGroup$MDSSplitViewController$imageView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

    static void _logos_method$CommonGroup$MDSSplitViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
      _logos_orig$CommonGroup$MDSSplitViewController$viewDidAppear$(self, _cmd, arg1);
      if (!hasCompletedIntroduction) {
        [self presentViewController:[MNAIntroViewController new] animated:YES completion:nil];
      }
    }

    static void _logos_method$CommonGroup$MDSSplitViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      _logos_orig$CommonGroup$MDSSplitViewController$viewDidLoad(self, _cmd);
      if (showTheEyeButton) {
        [self initEyeButton];
      }
    }

    
    static void _logos_method$CommonGroup$MDSSplitViewController$initEyeButton(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      self.sideSwitch = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 50, self.view.frame.size.height / 2 - 60, 50, 50)];
      self.sideSwitch.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
      self.sideSwitch.layer.cornerRadius = 10;
      self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
      self.imageView.contentMode = UIViewContentModeScaleAspectFit;
      self.imageView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", @PREF_BUNDLE_PATH, disablereadreceipt ? @"no-see.png" : @"see.png"]];
      self.imageView.alpha = 0.8;
      [self.sideSwitch addSubview:self.imageView];

      UITapGestureRecognizer *sideSwitchTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSideSwitchTap:)];
      [self.sideSwitch addGestureRecognizer:sideSwitchTap];
      [self.view addSubview:self.sideSwitch];

      UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
      [panRecognizer setMinimumNumberOfTouches:1];
      [panRecognizer setMaximumNumberOfTouches:1];
      [self.sideSwitch addGestureRecognizer:panRecognizer];
    }

    
    static void _logos_method$CommonGroup$MDSSplitViewController$handleSideSwitchTap$(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITapGestureRecognizer * recognizer) {
      [settings setObject:[NSNumber numberWithBool:!disablereadreceipt] forKey:@"disablereadreceipt"];
      BOOL success = [settings writeToFile:plistPath atomically:YES];

      if (!success) {
        [HCommon showAlertMessage:@"Can't write file" withTitle:@"Error" viewController:nil];
      } else {
        self.imageView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", @PREF_BUNDLE_PATH, !disablereadreceipt ? @"no-see.png" : @"see.png"]];
        notify_post(PREF_CHANGED_NOTIF);
      }
    }

    
    static void _logos_method$CommonGroup$MDSSplitViewController$move$(_LOGOS_SELF_TYPE_NORMAL MDSSplitViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIPanGestureRecognizer* sender) {
      
      [self.view bringSubviewToFront:sender.view];
      CGPoint translatedPoint = [sender translationInView:sender.view.superview];

      if (sender.state == UIGestureRecognizerStateBegan) {
        
        
      }

      translatedPoint = CGPointMake(sender.view.center.x+translatedPoint.x, sender.view.center.y+translatedPoint.y);

      [sender.view setCenter:translatedPoint];
      [sender setTranslation:CGPointZero inView:sender.view];

      if (sender.state == UIGestureRecognizerStateEnded) {
        CGFloat velocityX = (0.2*[sender velocityInView:self.view].x);
        CGFloat velocityY = (0.2*[sender velocityInView:self.view].y);

        CGFloat finalX = translatedPoint.x + velocityX;
        CGFloat finalY = translatedPoint.y + velocityY;

        if (finalX < self.view.frame.size.width / 2) {
          finalX = 0 + sender.view.frame.size.width / 2;
        } else {
          finalX = self.view.frame.size.width - sender.view.frame.size.width / 2;
        }

        if (finalY < 50) { 
          finalY = 50;
        } else if (finalY > self.view.frame.size.height - 75) { 
          finalY = self.view.frame.size.height - 75;
        }

        CGFloat animationDuration = (ABS(velocityX)*.0002)+.2;

        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:animationDuration];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidFinish)];
        [[sender view] setCenter:CGPointMake(finalX, finalY)];
        [UIView commitAnimations];
      }
    }
  

  
    __attribute__((used)) static BOOL _logos_property$CommonGroup$MSGListBinder$didAddMNACellHeaderView(MSGListBinder * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_property$CommonGroup$MSGListBinder$didAddMNACellHeaderView); BOOL rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_property$CommonGroup$MSGListBinder$setDidAddMNACellHeaderView(MSGListBinder * __unused self, SEL __unused _cmd, BOOL rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(BOOL)]; objc_setAssociatedObject(self, (void *)_logos_property$CommonGroup$MSGListBinder$didAddMNACellHeaderView, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

    static id _logos_method$CommonGroup$MSGListBinder$tableView$cellForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL MSGListBinder* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITableView * arg1, id arg2) {
      if (!self.didAddMNACellHeaderView) {
        NSMutableSet *_registeredReuseIdentifiers = MSHookIvar<NSMutableSet *>(self, "_registeredReuseIdentifiers");
        if ([_registeredReuseIdentifiers containsObject:@"me_setting_avatar_header"]) {
          UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 60)];
          UITableViewCell *mnaCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MNASettings"];
          mnaCell.textLabel.text = @"Messenger No Ads Settings";
          mnaCell.textLabel.textColor = [HCommon colorFromHex:@KTINT_COLOR];
          mnaCell.imageView.image = [UIImage imageNamed:@"/Library/Application Support/MessengerNoAds.bundle/icon.png"];
          mnaCell.imageView.layer.cornerRadius = mnaCell.imageView.frame.size.width?:30 / 2.0;
          mnaCell.imageView.layer.masksToBounds = TRUE;
          mnaCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
          mnaCell.frame = CGRectMake(3, 0, arg1.frame.size.width - 13, mnaCell.frame.size.height);
          [mnaCell addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleMNACellTap:)]];
          [headerView addSubview:mnaCell];

          arg1.tableHeaderView = headerView;
          self.didAddMNACellHeaderView = TRUE;
        }
      }
      return _logos_orig$CommonGroup$MSGListBinder$tableView$cellForRowAtIndexPath$(self, _cmd, arg1, arg2);
    }

    
    static void _logos_method$CommonGroup$MSGListBinder$handleMNACellTap$(_LOGOS_SELF_TYPE_NORMAL MSGListBinder* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITapGestureRecognizer * recognizer) {
      MNASettingsViewController *settingsVC = [[MNASettingsViewController alloc] init];
      UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:settingsVC];
      if (![HCommon isNotch]) {
        navVC.modalPresentationStyle = UIModalPresentationFullScreen;
      }
      [[_logos_static_class_lookup$LSAppDelegate() sharedInstance] presentViewController:navVC animated:true completion:nil];
    }
  

  
    static void _logos_method$CommonGroup$LSContactListViewController$_updateContactList(_LOGOS_SELF_TYPE_NORMAL LSContactListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      if (hideSuggestedContactInSearch) {
        NSString *_featureIdentifier = MSHookIvar<NSString *>(self, "_featureIdentifier");
        if ([_featureIdentifier isEqualToString:@"universal_search_null_state"]) {
          return;
        }
      }
      _logos_orig$CommonGroup$LSContactListViewController$_updateContactList(self, _cmd);
    }
  


static NSArray * (*_logos_orig$NoAdsNoStoriesRow$MSGThreadListDataSource$inboxRows)(_LOGOS_SELF_TYPE_NORMAL MSGThreadListDataSource* _LOGOS_SELF_CONST, SEL); static NSArray * _logos_method$NoAdsNoStoriesRow$MSGThreadListDataSource$inboxRows(_LOGOS_SELF_TYPE_NORMAL MSGThreadListDataSource* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$NoAdsNoStoriesRow$LSStoryViewerContentController$_issueAdsFetchWithCurrentSync$startIndex$bucketStoryModels$)(_LOGOS_SELF_TYPE_NORMAL LSStoryViewerContentController* _LOGOS_SELF_CONST, SEL, id, int, id); static void _logos_method$NoAdsNoStoriesRow$LSStoryViewerContentController$_issueAdsFetchWithCurrentSync$startIndex$bucketStoryModels$(_LOGOS_SELF_TYPE_NORMAL LSStoryViewerContentController* _LOGOS_SELF_CONST, SEL, id, int, id); 
  
    static NSArray * _logos_method$NoAdsNoStoriesRow$MSGThreadListDataSource$inboxRows(_LOGOS_SELF_TYPE_NORMAL MSGThreadListDataSource* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      NSArray *orig = _logos_orig$NoAdsNoStoriesRow$MSGThreadListDataSource$inboxRows(self, _cmd);
      if (![orig count]) {
        return orig;
      }

      NSMutableArray *resultRows = [@[] mutableCopy];

      if (!(hidestoriesrow && [orig[0][2] isKindOfClass:[NSArray class]] && [orig[0][2][1] isEqual:@"montage_renderer"])) {
        [resultRows addObject:orig[0]];
      }

      for (int i = 1; i < [orig count]; i++) {
        NSArray *row = orig[i];
        if (!noads || (noads && [row[1] intValue] != 2) || ([row[2] isKindOfClass:[NSArray class]] && [row[2][1] isEqual:@"message_requests_spam_unit"])) {
          [resultRows addObject:row];
        }
      }

      return resultRows;
    }
  

  
    static void _logos_method$NoAdsNoStoriesRow$LSStoryViewerContentController$_issueAdsFetchWithCurrentSync$startIndex$bucketStoryModels$(_LOGOS_SELF_TYPE_NORMAL LSStoryViewerContentController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, int arg2, id arg3) {
    }
  


static void (*_logos_orig$DisableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded)(_LOGOS_SELF_TYPE_NORMAL LSMessageListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$DisableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded(_LOGOS_SELF_TYPE_NORMAL LSMessageListViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$DisableReadReceipt$MSGMessageListViewController$_sendReadReceiptIfNeeded)(_LOGOS_SELF_TYPE_NORMAL MSGMessageListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$DisableReadReceipt$MSGMessageListViewController$_sendReadReceiptIfNeeded(_LOGOS_SELF_TYPE_NORMAL MSGMessageListViewController* _LOGOS_SELF_CONST, SEL); 
  
  
    static void _logos_method$DisableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded(_LOGOS_SELF_TYPE_NORMAL LSMessageListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      if (!disablereadreceipt) {
        _logos_orig$DisableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded(self, _cmd);
      }
    }
  

  
  
    static void _logos_method$DisableReadReceipt$MSGMessageListViewController$_sendReadReceiptIfNeeded(_LOGOS_SELF_TYPE_NORMAL MSGMessageListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      if (!disablereadreceipt) {
        _logos_orig$DisableReadReceipt$MSGMessageListViewController$_sendReadReceiptIfNeeded(self, _cmd);
      }
    }
  


static void (*_logos_orig$DisableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$)(_LOGOS_SELF_TYPE_NORMAL LSComposerViewController* _LOGOS_SELF_CONST, SEL, LSTextView *); static void _logos_method$DisableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$(_LOGOS_SELF_TYPE_NORMAL LSComposerViewController* _LOGOS_SELF_CONST, SEL, LSTextView *); 
  
    static void _logos_method$DisableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$(_LOGOS_SELF_TYPE_NORMAL LSComposerViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, LSTextView * arg1) {
      if (!disabletypingindicator) {
        _logos_orig$DisableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$(self, _cmd, arg1);
        return;
      }

      LSComposerView *_composerView = MSHookIvar<LSComposerView *>(self, "_composerView");
      LSComposerComponentStackView *_topStackView = MSHookIvar<LSComposerComponentStackView *>(_composerView, "_topStackView");
      if (_topStackView.frame.size.height > 0.0 || [arg1.text containsString:@"@"]) {
        _logos_orig$DisableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$(self, _cmd, arg1);
      }
    }
  


static void (*_logos_orig$DisableStorySeenReceipt$LSStoryBucketViewController$startTimer)(_LOGOS_SELF_TYPE_NORMAL LSStoryBucketViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$DisableStorySeenReceipt$LSStoryBucketViewController$startTimer(_LOGOS_SELF_TYPE_NORMAL LSStoryBucketViewController* _LOGOS_SELF_CONST, SEL); 
  
    static void _logos_method$DisableStorySeenReceipt$LSStoryBucketViewController$startTimer(_LOGOS_SELF_TYPE_NORMAL LSStoryBucketViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      if (!disablestoryseenreceipt) {
        _logos_orig$DisableStorySeenReceipt$LSStoryBucketViewController$startTimer(self, _cmd);
      }
    }
  


static void (*_logos_orig$CanSaveFriendsStory$LSStoryOverlayProfileView$_handleOverflowMenuButton$)(_LOGOS_SELF_TYPE_NORMAL LSStoryOverlayProfileView* _LOGOS_SELF_CONST, SEL, UIButton *); static void _logos_method$CanSaveFriendsStory$LSStoryOverlayProfileView$_handleOverflowMenuButton$(_LOGOS_SELF_TYPE_NORMAL LSStoryOverlayProfileView* _LOGOS_SELF_CONST, SEL, UIButton *); 
  
    static void _logos_method$CanSaveFriendsStory$LSStoryOverlayProfileView$_handleOverflowMenuButton$(_LOGOS_SELF_TYPE_NORMAL LSStoryOverlayProfileView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton * arg1) {
      if (!cansavefriendsstory) {
        _logos_orig$CanSaveFriendsStory$LSStoryOverlayProfileView$_handleOverflowMenuButton$(self, _cmd, arg1);
        return;
      }
      
      if ([self.storyAuthorId isEqualToString:[[_logos_static_class_lookup$LSAppDelegate() sharedInstance] getCurrentLoggedInUserId]]) {
        _logos_orig$CanSaveFriendsStory$LSStoryOverlayProfileView$_handleOverflowMenuButton$(self, _cmd, arg1);
        return;
      }

      
      LSStoryOverlayViewController *overlayVC = (LSStoryOverlayViewController *)[[[self nextResponder] nextResponder] nextResponder];
      LSStoryBucketViewController *bucketVC = overlayVC.parentViewController;
      [bucketVC _pauseProgressIndicatorWithReset:FALSE];

      UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
      UIAlertAction *saveStoryAction = [UIAlertAction actionWithTitle:@"Save Story" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        LSMediaViewController *mediaVC = bucketVC.currentThreadVC;
        [mediaVC saveMedia];
        [bucketVC startTimer];
      }];
      UIAlertAction *otherOptionsAction = [UIAlertAction actionWithTitle:@"Options" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        _logos_orig$CanSaveFriendsStory$LSStoryOverlayProfileView$_handleOverflowMenuButton$(self, _cmd, arg1);
      }];
      UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
        [bucketVC startTimer];
      }];
      [alert addAction:saveStoryAction];
      [alert addAction:otherOptionsAction];
      [alert addAction:cancelAction];

      if (IS_iPAD) {
        [alert setModalPresentationStyle:UIModalPresentationPopover];
        UIPopoverPresentationController *popPresenter = [alert popoverPresentationController];
        popPresenter.sourceView = arg1;
        popPresenter.sourceRect = arg1.bounds;
      }
      [overlayVC presentViewController:alert animated:YES completion:nil];
    }
  


static UITabBar * (*_logos_orig$HidePeopleTab$UITabBarController$tabBar)(_LOGOS_SELF_TYPE_NORMAL UITabBarController* _LOGOS_SELF_CONST, SEL); static UITabBar * _logos_method$HidePeopleTab$UITabBarController$tabBar(_LOGOS_SELF_TYPE_NORMAL UITabBarController* _LOGOS_SELF_CONST, SEL); 
  
    static UITabBar * _logos_method$HidePeopleTab$UITabBarController$tabBar(_LOGOS_SELF_TYPE_NORMAL UITabBarController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      UITabBar *orig = _logos_orig$HidePeopleTab$UITabBarController$tabBar(self, _cmd);
      if (hidepeopletab) {
        orig.hidden = true;
      }
      return orig;
    }
  


static void (*_logos_orig$HideSearchBar$UINavigationController$_createAndAttachSearchPaletteForTransitionToTopViewControllerIfNecesssary$)(_LOGOS_SELF_TYPE_NORMAL UINavigationController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$HideSearchBar$UINavigationController$_createAndAttachSearchPaletteForTransitionToTopViewControllerIfNecesssary$(_LOGOS_SELF_TYPE_NORMAL UINavigationController* _LOGOS_SELF_CONST, SEL, id); 
  
    static void _logos_method$HideSearchBar$UINavigationController$_createAndAttachSearchPaletteForTransitionToTopViewControllerIfNecesssary$(_LOGOS_SELF_TYPE_NORMAL UINavigationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      if (!hidesearchbar) {
        _logos_orig$HideSearchBar$UINavigationController$_createAndAttachSearchPaletteForTransitionToTopViewControllerIfNecesssary$(self, _cmd, arg1);
      }
    }
  


static id (*_logos_orig$ExtendStoryVideoUploadLength$MSGVideoTrimmerPresenter$presentIfPossibleWithNSURL$videoMaximumDuration$completion$)(_LOGOS_SELF_TYPE_NORMAL MSGVideoTrimmerPresenter* _LOGOS_SELF_CONST, SEL, id, double, id); static id _logos_method$ExtendStoryVideoUploadLength$MSGVideoTrimmerPresenter$presentIfPossibleWithNSURL$videoMaximumDuration$completion$(_LOGOS_SELF_TYPE_NORMAL MSGVideoTrimmerPresenter* _LOGOS_SELF_CONST, SEL, id, double, id); 
  
    static id _logos_method$ExtendStoryVideoUploadLength$MSGVideoTrimmerPresenter$presentIfPossibleWithNSURL$videoMaximumDuration$completion$(_LOGOS_SELF_TYPE_NORMAL MSGVideoTrimmerPresenter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, double arg2, id arg3) {
      double length = arg2;
      if (extendStoryVideoUploadLength) {
        length = 600.0; 
      }
      return _logos_orig$ExtendStoryVideoUploadLength$MSGVideoTrimmerPresenter$presentIfPossibleWithNSURL$videoMaximumDuration$completion$(self, _cmd, arg1, length, arg3);
    }
  





static __attribute__((constructor)) void _logosLocalCtor_aa7b085b(int __unused argc, char __unused **argv, char __unused **envp) {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) reloadPrefs, CFSTR(PREF_CHANGED_NOTIF), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
  reloadPrefs();

  dlopen([[[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"Frameworks/NotInCore.framework/NotInCore"] UTF8String], RTLD_NOW);

  {Class _logos_class$CommonGroup$LSAppDelegate = objc_getClass("LSAppDelegate"); Class _logos_metaclass$CommonGroup$LSAppDelegate = object_getClass(_logos_class$CommonGroup$LSAppDelegate); { MSHookMessageEx(_logos_class$CommonGroup$LSAppDelegate, @selector(applicationDidBecomeActive:), (IMP)&_logos_method$CommonGroup$LSAppDelegate$applicationDidBecomeActive$, (IMP*)&_logos_orig$CommonGroup$LSAppDelegate$applicationDidBecomeActive$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_metaclass$CommonGroup$LSAppDelegate, @selector(sharedInstance), (IMP)&_logos_meta_method$CommonGroup$LSAppDelegate$sharedInstance, _typeEncoding); }Class _logos_class$CommonGroup$MSGSplitViewController = objc_getClass("MSGSplitViewController"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIView\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$CommonGroup$MSGSplitViewController, "sideSwitch", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIView *)); class_addMethod(_logos_class$CommonGroup$MSGSplitViewController, @selector(sideSwitch), (IMP)&_logos_property$CommonGroup$MSGSplitViewController$sideSwitch, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIView *)); class_addMethod(_logos_class$CommonGroup$MSGSplitViewController, @selector(setSideSwitch:), (IMP)&_logos_property$CommonGroup$MSGSplitViewController$setSideSwitch, _typeEncoding); } { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIImageView\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$CommonGroup$MSGSplitViewController, "imageView", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIImageView *)); class_addMethod(_logos_class$CommonGroup$MSGSplitViewController, @selector(imageView), (IMP)&_logos_property$CommonGroup$MSGSplitViewController$imageView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIImageView *)); class_addMethod(_logos_class$CommonGroup$MSGSplitViewController, @selector(setImageView:), (IMP)&_logos_property$CommonGroup$MSGSplitViewController$setImageView, _typeEncoding); } { MSHookMessageEx(_logos_class$CommonGroup$MSGSplitViewController, @selector(viewDidAppear:), (IMP)&_logos_method$CommonGroup$MSGSplitViewController$viewDidAppear$, (IMP*)&_logos_orig$CommonGroup$MSGSplitViewController$viewDidAppear$);}{ MSHookMessageEx(_logos_class$CommonGroup$MSGSplitViewController, @selector(viewDidLoad), (IMP)&_logos_method$CommonGroup$MSGSplitViewController$viewDidLoad, (IMP*)&_logos_orig$CommonGroup$MSGSplitViewController$viewDidLoad);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CommonGroup$MSGSplitViewController, @selector(initEyeButton), (IMP)&_logos_method$CommonGroup$MSGSplitViewController$initEyeButton, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITapGestureRecognizer *), strlen(@encode(UITapGestureRecognizer *))); i += strlen(@encode(UITapGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CommonGroup$MSGSplitViewController, @selector(handleSideSwitchTap:), (IMP)&_logos_method$CommonGroup$MSGSplitViewController$handleSideSwitchTap$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIPanGestureRecognizer*), strlen(@encode(UIPanGestureRecognizer*))); i += strlen(@encode(UIPanGestureRecognizer*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CommonGroup$MSGSplitViewController, @selector(move:), (IMP)&_logos_method$CommonGroup$MSGSplitViewController$move$, _typeEncoding); }Class _logos_class$CommonGroup$MDSSplitViewController = objc_getClass("MDSSplitViewController"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIView\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$CommonGroup$MDSSplitViewController, "sideSwitch", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIView *)); class_addMethod(_logos_class$CommonGroup$MDSSplitViewController, @selector(sideSwitch), (IMP)&_logos_property$CommonGroup$MDSSplitViewController$sideSwitch, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIView *)); class_addMethod(_logos_class$CommonGroup$MDSSplitViewController, @selector(setSideSwitch:), (IMP)&_logos_property$CommonGroup$MDSSplitViewController$setSideSwitch, _typeEncoding); } { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIImageView\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$CommonGroup$MDSSplitViewController, "imageView", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIImageView *)); class_addMethod(_logos_class$CommonGroup$MDSSplitViewController, @selector(imageView), (IMP)&_logos_property$CommonGroup$MDSSplitViewController$imageView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIImageView *)); class_addMethod(_logos_class$CommonGroup$MDSSplitViewController, @selector(setImageView:), (IMP)&_logos_property$CommonGroup$MDSSplitViewController$setImageView, _typeEncoding); } { MSHookMessageEx(_logos_class$CommonGroup$MDSSplitViewController, @selector(viewDidAppear:), (IMP)&_logos_method$CommonGroup$MDSSplitViewController$viewDidAppear$, (IMP*)&_logos_orig$CommonGroup$MDSSplitViewController$viewDidAppear$);}{ MSHookMessageEx(_logos_class$CommonGroup$MDSSplitViewController, @selector(viewDidLoad), (IMP)&_logos_method$CommonGroup$MDSSplitViewController$viewDidLoad, (IMP*)&_logos_orig$CommonGroup$MDSSplitViewController$viewDidLoad);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CommonGroup$MDSSplitViewController, @selector(initEyeButton), (IMP)&_logos_method$CommonGroup$MDSSplitViewController$initEyeButton, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITapGestureRecognizer *), strlen(@encode(UITapGestureRecognizer *))); i += strlen(@encode(UITapGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CommonGroup$MDSSplitViewController, @selector(handleSideSwitchTap:), (IMP)&_logos_method$CommonGroup$MDSSplitViewController$handleSideSwitchTap$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIPanGestureRecognizer*), strlen(@encode(UIPanGestureRecognizer*))); i += strlen(@encode(UIPanGestureRecognizer*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CommonGroup$MDSSplitViewController, @selector(move:), (IMP)&_logos_method$CommonGroup$MDSSplitViewController$move$, _typeEncoding); }Class _logos_class$CommonGroup$MSGListBinder = objc_getClass("MSGListBinder"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", @encode(BOOL) }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$CommonGroup$MSGListBinder, "didAddMNACellHeaderView", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(BOOL)); class_addMethod(_logos_class$CommonGroup$MSGListBinder, @selector(didAddMNACellHeaderView), (IMP)&_logos_property$CommonGroup$MSGListBinder$didAddMNACellHeaderView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(BOOL)); class_addMethod(_logos_class$CommonGroup$MSGListBinder, @selector(setDidAddMNACellHeaderView:), (IMP)&_logos_property$CommonGroup$MSGListBinder$setDidAddMNACellHeaderView, _typeEncoding); } { MSHookMessageEx(_logos_class$CommonGroup$MSGListBinder, @selector(tableView:cellForRowAtIndexPath:), (IMP)&_logos_method$CommonGroup$MSGListBinder$tableView$cellForRowAtIndexPath$, (IMP*)&_logos_orig$CommonGroup$MSGListBinder$tableView$cellForRowAtIndexPath$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITapGestureRecognizer *), strlen(@encode(UITapGestureRecognizer *))); i += strlen(@encode(UITapGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CommonGroup$MSGListBinder, @selector(handleMNACellTap:), (IMP)&_logos_method$CommonGroup$MSGListBinder$handleMNACellTap$, _typeEncoding); }Class _logos_class$CommonGroup$LSContactListViewController = objc_getClass("LSContactListViewController"); { MSHookMessageEx(_logos_class$CommonGroup$LSContactListViewController, @selector(_updateContactList), (IMP)&_logos_method$CommonGroup$LSContactListViewController$_updateContactList, (IMP*)&_logos_orig$CommonGroup$LSContactListViewController$_updateContactList);}}
  {Class _logos_class$NoAdsNoStoriesRow$MSGThreadListDataSource = objc_getClass("MSGThreadListDataSource"); { MSHookMessageEx(_logos_class$NoAdsNoStoriesRow$MSGThreadListDataSource, @selector(inboxRows), (IMP)&_logos_method$NoAdsNoStoriesRow$MSGThreadListDataSource$inboxRows, (IMP*)&_logos_orig$NoAdsNoStoriesRow$MSGThreadListDataSource$inboxRows);}Class _logos_class$NoAdsNoStoriesRow$LSStoryViewerContentController = objc_getClass("LSStoryViewerContentController"); { MSHookMessageEx(_logos_class$NoAdsNoStoriesRow$LSStoryViewerContentController, @selector(_issueAdsFetchWithCurrentSync:startIndex:bucketStoryModels:), (IMP)&_logos_method$NoAdsNoStoriesRow$LSStoryViewerContentController$_issueAdsFetchWithCurrentSync$startIndex$bucketStoryModels$, (IMP*)&_logos_orig$NoAdsNoStoriesRow$LSStoryViewerContentController$_issueAdsFetchWithCurrentSync$startIndex$bucketStoryModels$);}}
  {Class _logos_class$DisableReadReceipt$LSMessageListViewController = objc_getClass("LSMessageListViewController"); { MSHookMessageEx(_logos_class$DisableReadReceipt$LSMessageListViewController, @selector(_sendReadReceiptIfNeeded), (IMP)&_logos_method$DisableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded, (IMP*)&_logos_orig$DisableReadReceipt$LSMessageListViewController$_sendReadReceiptIfNeeded);}Class _logos_class$DisableReadReceipt$MSGMessageListViewController = objc_getClass("MSGMessageListViewController"); { MSHookMessageEx(_logos_class$DisableReadReceipt$MSGMessageListViewController, @selector(_sendReadReceiptIfNeeded), (IMP)&_logos_method$DisableReadReceipt$MSGMessageListViewController$_sendReadReceiptIfNeeded, (IMP*)&_logos_orig$DisableReadReceipt$MSGMessageListViewController$_sendReadReceiptIfNeeded);}}
  {Class _logos_class$DisableTypingIndicator$LSComposerViewController = objc_getClass("LSComposerViewController"); { MSHookMessageEx(_logos_class$DisableTypingIndicator$LSComposerViewController, @selector(_updateComposerEventWithTextViewChanged:), (IMP)&_logos_method$DisableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$, (IMP*)&_logos_orig$DisableTypingIndicator$LSComposerViewController$_updateComposerEventWithTextViewChanged$);}}
  {Class _logos_class$DisableStorySeenReceipt$LSStoryBucketViewController = objc_getClass("LSStoryBucketViewController"); { MSHookMessageEx(_logos_class$DisableStorySeenReceipt$LSStoryBucketViewController, @selector(startTimer), (IMP)&_logos_method$DisableStorySeenReceipt$LSStoryBucketViewController$startTimer, (IMP*)&_logos_orig$DisableStorySeenReceipt$LSStoryBucketViewController$startTimer);}}
  {Class _logos_class$CanSaveFriendsStory$LSStoryOverlayProfileView = objc_getClass("LSStoryOverlayProfileView"); { MSHookMessageEx(_logos_class$CanSaveFriendsStory$LSStoryOverlayProfileView, @selector(_handleOverflowMenuButton:), (IMP)&_logos_method$CanSaveFriendsStory$LSStoryOverlayProfileView$_handleOverflowMenuButton$, (IMP*)&_logos_orig$CanSaveFriendsStory$LSStoryOverlayProfileView$_handleOverflowMenuButton$);}}
  {Class _logos_class$HideSearchBar$UINavigationController = objc_getClass("UINavigationController"); { MSHookMessageEx(_logos_class$HideSearchBar$UINavigationController, @selector(_createAndAttachSearchPaletteForTransitionToTopViewControllerIfNecesssary:), (IMP)&_logos_method$HideSearchBar$UINavigationController$_createAndAttachSearchPaletteForTransitionToTopViewControllerIfNecesssary$, (IMP*)&_logos_orig$HideSearchBar$UINavigationController$_createAndAttachSearchPaletteForTransitionToTopViewControllerIfNecesssary$);}}
  {Class _logos_class$HidePeopleTab$UITabBarController = objc_getClass("UITabBarController"); { MSHookMessageEx(_logos_class$HidePeopleTab$UITabBarController, @selector(tabBar), (IMP)&_logos_method$HidePeopleTab$UITabBarController$tabBar, (IMP*)&_logos_orig$HidePeopleTab$UITabBarController$tabBar);}}
  {Class _logos_class$ExtendStoryVideoUploadLength$MSGVideoTrimmerPresenter = objc_getClass("MSGVideoTrimmerPresenter"); { MSHookMessageEx(_logos_class$ExtendStoryVideoUploadLength$MSGVideoTrimmerPresenter, @selector(presentIfPossibleWithNSURL:videoMaximumDuration:completion:), (IMP)&_logos_method$ExtendStoryVideoUploadLength$MSGVideoTrimmerPresenter$presentIfPossibleWithNSURL$videoMaximumDuration$completion$, (IMP*)&_logos_orig$ExtendStoryVideoUploadLength$MSGVideoTrimmerPresenter$presentIfPossibleWithNSURL$videoMaximumDuration$completion$);}}
}
