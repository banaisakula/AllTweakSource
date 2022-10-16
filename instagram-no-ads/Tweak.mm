#line 1 "/Users/lovez/Desktop/AA/AA/app/instagram-no-ads/Tweak.xm"




#import "Tweak.h"

BOOL noads;
BOOL canSaveMedia;
BOOL canSaveHDProfilePicture;
BOOL showLikeCount;
BOOL disableDirectMessageSeenReceipt;
BOOL disableStorySeenReceipt;
BOOL unlimitedReplayDirectMessage;
BOOL determineIfUserIsFollowingYou;
BOOL likeConfirmation;
int appLockSetting;

static void reloadPrefs() {
  NSDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@PLIST_PATH] ?: [@{} mutableCopy];

  noads = [[settings objectForKey:@"noads"] ?: @(YES) boolValue];
  canSaveMedia = [[settings objectForKey:@"canSaveMedia"] ?: @(YES) boolValue];
  canSaveHDProfilePicture = [[settings objectForKey:@"canSaveHDProfilePicture"] ?: @(YES) boolValue];
  showLikeCount = [[settings objectForKey:@"showLikeCount"] ?: @(YES) boolValue];
  determineIfUserIsFollowingYou = [[settings objectForKey:@"determineIfUserIsFollowingYou"] ?: @(YES) boolValue];
  disableDirectMessageSeenReceipt = [[settings objectForKey:@"disableDirectMessageSeenReceipt"] ?: @(NO) boolValue];
  disableStorySeenReceipt = [[settings objectForKey:@"disableStorySeenReceipt"] ?: @(NO) boolValue];
  unlimitedReplayDirectMessage = [[settings objectForKey:@"unlimitedReplayDirectMessage"] ?: @(NO) boolValue];
  likeConfirmation = [[settings objectForKey:@"likeConfirmation"] ?: @(NO) boolValue];
  appLockSetting = [[settings objectForKey:@"appLockSetting"] intValue] ?: 0;
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

@class IGProfilePictureImageView; @class IGStoryPhotoView; @class IGVideoFeedViewController; @class IGFeedItem; @class IGModernFeedVideoCell; @class IGSundialVideoPlaybackView; @class IGChainingFeedViewController; @class IGSundialViewerLikeButton; @class IGPanavisionFeedVideoCell; @class IGStoryAdPool; @class IGSundialAdsResponseParser; @class IGDirectThreadViewListAdapterDataSource; @class IGCommentCell; @class IGStoryViewerContainerView; @class IGStoryAdsManager; @class IGFeedItemVideoView; @class IGInstagramAppDelegate; @class IGMainFeedListAdapterDataSource; @class InstaZoomImageViewController; @class IGStoryAdsOptInTextView; @class IGTVFullscreenVideoCell; @class IGStoryAdsResponseParser; @class IGStoryVideoView; @class IGFeedItemLikeCountCell; @class IGSundialViewerVideoCell; @class IGStoryViewerViewController; @class IGImageView; @class IGStoryAdsFetcher; @class IGUFIButtonBarView; @class IGFeedPhotoView; @class IGAdItem; @class IGProfileSimpleAvatarStatsCell; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$IGStoryPhotoView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("IGStoryPhotoView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$IGStoryVideoView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("IGStoryVideoView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$IGFeedItem(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("IGFeedItem"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$InstaZoomImageViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("InstaZoomImageViewController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$IGStoryViewerViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("IGStoryViewerViewController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$IGAdItem(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("IGAdItem"); } return _klass; }
#line 33 "/Users/lovez/Desktop/AA/AA/app/instagram-no-ads/Tweak.xm"
static NSArray* removeAdsItemsInList(NSArray *list) {
  NSMutableArray *orig = [list mutableCopy];
  [orig enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    if (([obj isKindOfClass:_logos_static_class_lookup$IGFeedItem()] && ([obj isSponsored] || [obj isSponsoredApp])) || [obj isKindOfClass:_logos_static_class_lookup$IGAdItem()]) {
      [orig removeObjectAtIndex:idx];
    }
  }];
  return [orig copy];
}

static void showConfirmation(void (^okHandler)(void)) {
  __block UIWindow* topWindow;
  topWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  topWindow.rootViewController = [UIViewController new];
  topWindow.windowLevel = UIWindowLevelAlert + 1;

  UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil message:@"Are you sure?" preferredStyle:IS_iPAD ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet];
  [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    topWindow.hidden = YES;
    topWindow = nil;
    okHandler();
  }]];
  [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    topWindow.hidden = YES;
    topWindow = nil;
  }]];

  [topWindow makeKeyAndVisible];

  [topWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

static void (*_logos_orig$SecurityGroup$IGInstagramAppDelegate$applicationDidBecomeActive$)(_LOGOS_SELF_TYPE_NORMAL IGInstagramAppDelegate* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$SecurityGroup$IGInstagramAppDelegate$applicationDidBecomeActive$(_LOGOS_SELF_TYPE_NORMAL IGInstagramAppDelegate* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$SecurityGroup$IGInstagramAppDelegate$applicationWillEnterForeground$)(_LOGOS_SELF_TYPE_NORMAL IGInstagramAppDelegate* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$SecurityGroup$IGInstagramAppDelegate$applicationWillEnterForeground$(_LOGOS_SELF_TYPE_NORMAL IGInstagramAppDelegate* _LOGOS_SELF_CONST, SEL, id); 
  
    static BOOL isAuthenticationShowed = FALSE;
    static void _logos_method$SecurityGroup$IGInstagramAppDelegate$applicationDidBecomeActive$(_LOGOS_SELF_TYPE_NORMAL IGInstagramAppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      _logos_orig$SecurityGroup$IGInstagramAppDelegate$applicationDidBecomeActive$(self, _cmd, arg1);

      if (appLockSetting != 0 && !isAuthenticationShowed) {
        UIViewController *rootController = [[self window] rootViewController];
        SecurityViewController *securityViewController = [SecurityViewController new];
        securityViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [rootController presentViewController:securityViewController animated:YES completion:nil];
        isAuthenticationShowed = TRUE;
      }
    }

    static void _logos_method$SecurityGroup$IGInstagramAppDelegate$applicationWillEnterForeground$(_LOGOS_SELF_TYPE_NORMAL IGInstagramAppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      _logos_orig$SecurityGroup$IGInstagramAppDelegate$applicationWillEnterForeground$(self, _cmd, arg1);

      if (appLockSetting == 2) {
        isAuthenticationShowed = FALSE;
      }
    }
  


static id (*_logos_orig$ShowLikeCount$IGFeedItem$buildLikeCellStyledStringWithIcon$andText$style$)(_LOGOS_SELF_TYPE_NORMAL IGFeedItem* _LOGOS_SELF_CONST, SEL, id, id, id); static id _logos_method$ShowLikeCount$IGFeedItem$buildLikeCellStyledStringWithIcon$andText$style$(_LOGOS_SELF_TYPE_NORMAL IGFeedItem* _LOGOS_SELF_CONST, SEL, id, id, id); static IGStyledString * (*_logos_meta_orig$ShowLikeCount$IGFeedItemLikeCountCell$buildStyledStringWithMedia$feedItemRow$pageCellState$configuration$feedConfiguration$contentWidth$textWidth$combinedContextOptions$userSession$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, IGMedia *, id, id, id, id, double, double, long long, id); static IGStyledString * _logos_meta_method$ShowLikeCount$IGFeedItemLikeCountCell$buildStyledStringWithMedia$feedItemRow$pageCellState$configuration$feedConfiguration$contentWidth$textWidth$combinedContextOptions$userSession$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, IGMedia *, id, id, id, id, double, double, long long, id); 
  
    static id _logos_method$ShowLikeCount$IGFeedItem$buildLikeCellStyledStringWithIcon$andText$style$(_LOGOS_SELF_TYPE_NORMAL IGFeedItem* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3) {
      NSNumberFormatter *formatter = [NSNumberFormatter new];
      [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
      NSString *formatted = [formatter stringFromNumber:[NSNumber numberWithInteger:self.likeCount]];

      NSString *newArg2 = [NSString stringWithFormat:@"%@ (%@)", arg2 ?: @"Liked:", formatted];
      return _logos_orig$ShowLikeCount$IGFeedItem$buildLikeCellStyledStringWithIcon$andText$style$(self, _cmd, arg1, newArg2, arg3);
    }
  

  
  
    static IGStyledString * _logos_meta_method$ShowLikeCount$IGFeedItemLikeCountCell$buildStyledStringWithMedia$feedItemRow$pageCellState$configuration$feedConfiguration$contentWidth$textWidth$combinedContextOptions$userSession$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, IGMedia * arg1, id arg2, id arg3, id arg4, id arg5, double arg6, double arg7, long long arg8, id arg9) {
      IGStyledString *orig = _logos_meta_orig$ShowLikeCount$IGFeedItemLikeCountCell$buildStyledStringWithMedia$feedItemRow$pageCellState$configuration$feedConfiguration$contentWidth$textWidth$combinedContextOptions$userSession$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
      if (orig != nil
        && orig.attributedString != nil
        && orig.attributedString.string != nil
        && ![orig.attributedString.string containsString:@"("]
        && ![orig.attributedString.string containsString:@")"]) {
          NSNumberFormatter *formatter = [NSNumberFormatter new];
          [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
          NSString *formatted = [formatter stringFromNumber:[NSNumber numberWithInteger:arg1.likeCount]];
          [orig appendString:[NSString stringWithFormat:@" (%@)", formatted]];
      }
      return orig;
    }
  


static void (*_logos_orig$UnlimitedReplayDirectMessage$IGStoryPhotoView$progressImageView$didLoadImage$loadSource$networkRequestSummary$)(_LOGOS_SELF_TYPE_NORMAL IGStoryPhotoView* _LOGOS_SELF_CONST, SEL, id, id, id, id); static void _logos_method$UnlimitedReplayDirectMessage$IGStoryPhotoView$progressImageView$didLoadImage$loadSource$networkRequestSummary$(_LOGOS_SELF_TYPE_NORMAL IGStoryPhotoView* _LOGOS_SELF_CONST, SEL, id, id, id, id); 
  
    static void _logos_method$UnlimitedReplayDirectMessage$IGStoryPhotoView$progressImageView$didLoadImage$loadSource$networkRequestSummary$(_LOGOS_SELF_TYPE_NORMAL IGStoryPhotoView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3, id arg4) {

    }
  


static void (*_logos_orig$LikeConfirmation$IGUFIButtonBarView$_onLikeButtonPressed$)(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$LikeConfirmation$IGUFIButtonBarView$_onLikeButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$LikeConfirmation$IGFeedPhotoView$_onDoubleTap$)(_LOGOS_SELF_TYPE_NORMAL IGFeedPhotoView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$LikeConfirmation$IGFeedPhotoView$_onDoubleTap$(_LOGOS_SELF_TYPE_NORMAL IGFeedPhotoView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$LikeConfirmation$IGFeedItemVideoView$_handleOverlayDoubleTap)(_LOGOS_SELF_TYPE_NORMAL IGFeedItemVideoView* _LOGOS_SELF_CONST, SEL); static void _logos_method$LikeConfirmation$IGFeedItemVideoView$_handleOverlayDoubleTap(_LOGOS_SELF_TYPE_NORMAL IGFeedItemVideoView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$LikeConfirmation$IGSundialViewerVideoCell$_handleDoubleTap$)(_LOGOS_SELF_TYPE_NORMAL IGSundialViewerVideoCell* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$LikeConfirmation$IGSundialViewerVideoCell$_handleDoubleTap$(_LOGOS_SELF_TYPE_NORMAL IGSundialViewerVideoCell* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$LikeConfirmation$IGSundialViewerLikeButton$touchDetector$touchesEnded$withEvent$)(_LOGOS_SELF_TYPE_NORMAL IGSundialViewerLikeButton* _LOGOS_SELF_CONST, SEL, id, id, id); static void _logos_method$LikeConfirmation$IGSundialViewerLikeButton$touchDetector$touchesEnded$withEvent$(_LOGOS_SELF_TYPE_NORMAL IGSundialViewerLikeButton* _LOGOS_SELF_CONST, SEL, id, id, id); static void (*_logos_orig$LikeConfirmation$IGCommentCell$_didDoubleTap$)(_LOGOS_SELF_TYPE_NORMAL IGCommentCell* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$LikeConfirmation$IGCommentCell$_didDoubleTap$(_LOGOS_SELF_TYPE_NORMAL IGCommentCell* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$LikeConfirmation$IGCommentCell$contentView$didTapOnLikeButton$)(_LOGOS_SELF_TYPE_NORMAL IGCommentCell* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$LikeConfirmation$IGCommentCell$contentView$didTapOnLikeButton$(_LOGOS_SELF_TYPE_NORMAL IGCommentCell* _LOGOS_SELF_CONST, SEL, id, id); 
  
    static void _logos_method$LikeConfirmation$IGUFIButtonBarView$_onLikeButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGUFIButtonBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      showConfirmation(^(void) { _logos_orig$LikeConfirmation$IGUFIButtonBarView$_onLikeButtonPressed$(self, _cmd, arg1); });
    }
  

  
    static void _logos_method$LikeConfirmation$IGFeedPhotoView$_onDoubleTap$(_LOGOS_SELF_TYPE_NORMAL IGFeedPhotoView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      showConfirmation(^(void) { _logos_orig$LikeConfirmation$IGFeedPhotoView$_onDoubleTap$(self, _cmd, arg1); });
    }
  

  
    static void _logos_method$LikeConfirmation$IGFeedItemVideoView$_handleOverlayDoubleTap(_LOGOS_SELF_TYPE_NORMAL IGFeedItemVideoView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      showConfirmation(^(void) { _logos_orig$LikeConfirmation$IGFeedItemVideoView$_handleOverlayDoubleTap(self, _cmd); });
    }
  

  
    static void _logos_method$LikeConfirmation$IGSundialViewerVideoCell$_handleDoubleTap$(_LOGOS_SELF_TYPE_NORMAL IGSundialViewerVideoCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      showConfirmation(^(void) { _logos_orig$LikeConfirmation$IGSundialViewerVideoCell$_handleDoubleTap$(self, _cmd, arg1); });
    }
  

  
    static void _logos_method$LikeConfirmation$IGSundialViewerLikeButton$touchDetector$touchesEnded$withEvent$(_LOGOS_SELF_TYPE_NORMAL IGSundialViewerLikeButton* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3) {
      showConfirmation(^(void) { _logos_orig$LikeConfirmation$IGSundialViewerLikeButton$touchDetector$touchesEnded$withEvent$(self, _cmd, arg1, arg2, arg3); });
    }
  

  
    static void _logos_method$LikeConfirmation$IGCommentCell$_didDoubleTap$(_LOGOS_SELF_TYPE_NORMAL IGCommentCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      showConfirmation(^(void) { _logos_orig$LikeConfirmation$IGCommentCell$_didDoubleTap$(self, _cmd, arg1); });
    }

    static void _logos_method$LikeConfirmation$IGCommentCell$contentView$didTapOnLikeButton$(_LOGOS_SELF_TYPE_NORMAL IGCommentCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
      showConfirmation(^(void) { _logos_orig$LikeConfirmation$IGCommentCell$contentView$didTapOnLikeButton$(self, _cmd, arg1, arg2); });
    }
  


static NSArray * (*_logos_orig$NoAds$IGMainFeedListAdapterDataSource$objectsForListAdapter$)(_LOGOS_SELF_TYPE_NORMAL IGMainFeedListAdapterDataSource* _LOGOS_SELF_CONST, SEL, id); static NSArray * _logos_method$NoAds$IGMainFeedListAdapterDataSource$objectsForListAdapter$(_LOGOS_SELF_TYPE_NORMAL IGMainFeedListAdapterDataSource* _LOGOS_SELF_CONST, SEL, id); static NSArray * (*_logos_orig$NoAds$IGVideoFeedViewController$objectsForListAdapter$)(_LOGOS_SELF_TYPE_NORMAL IGVideoFeedViewController* _LOGOS_SELF_CONST, SEL, id); static NSArray * _logos_method$NoAds$IGVideoFeedViewController$objectsForListAdapter$(_LOGOS_SELF_TYPE_NORMAL IGVideoFeedViewController* _LOGOS_SELF_CONST, SEL, id); static NSArray * (*_logos_orig$NoAds$IGChainingFeedViewController$objectsForListAdapter$)(_LOGOS_SELF_TYPE_NORMAL IGChainingFeedViewController* _LOGOS_SELF_CONST, SEL, id); static NSArray * _logos_method$NoAds$IGChainingFeedViewController$objectsForListAdapter$(_LOGOS_SELF_TYPE_NORMAL IGChainingFeedViewController* _LOGOS_SELF_CONST, SEL, id); static IGStoryAdPool* (*_logos_orig$NoAds$IGStoryAdPool$initWithUserSession$)(_LOGOS_SELF_TYPE_INIT IGStoryAdPool*, SEL, id) _LOGOS_RETURN_RETAINED; static IGStoryAdPool* _logos_method$NoAds$IGStoryAdPool$initWithUserSession$(_LOGOS_SELF_TYPE_INIT IGStoryAdPool*, SEL, id) _LOGOS_RETURN_RETAINED; static IGStoryAdsManager* (*_logos_orig$NoAds$IGStoryAdsManager$initWithUserSession$storyViewerLoggingContext$storyFullscreenSectionLoggingContext$viewController$)(_LOGOS_SELF_TYPE_INIT IGStoryAdsManager*, SEL, id, id, id, id) _LOGOS_RETURN_RETAINED; static IGStoryAdsManager* _logos_method$NoAds$IGStoryAdsManager$initWithUserSession$storyViewerLoggingContext$storyFullscreenSectionLoggingContext$viewController$(_LOGOS_SELF_TYPE_INIT IGStoryAdsManager*, SEL, id, id, id, id) _LOGOS_RETURN_RETAINED; static IGStoryAdsFetcher* (*_logos_orig$NoAds$IGStoryAdsFetcher$initWithUserSession$delegate$)(_LOGOS_SELF_TYPE_INIT IGStoryAdsFetcher*, SEL, id, id) _LOGOS_RETURN_RETAINED; static IGStoryAdsFetcher* _logos_method$NoAds$IGStoryAdsFetcher$initWithUserSession$delegate$(_LOGOS_SELF_TYPE_INIT IGStoryAdsFetcher*, SEL, id, id) _LOGOS_RETURN_RETAINED; static id (*_logos_orig$NoAds$IGStoryAdsResponseParser$parsedObjectFromResponse$)(_LOGOS_SELF_TYPE_NORMAL IGStoryAdsResponseParser* _LOGOS_SELF_CONST, SEL, id); static id _logos_method$NoAds$IGStoryAdsResponseParser$parsedObjectFromResponse$(_LOGOS_SELF_TYPE_NORMAL IGStoryAdsResponseParser* _LOGOS_SELF_CONST, SEL, id); static IGStoryAdsResponseParser* (*_logos_orig$NoAds$IGStoryAdsResponseParser$initWithReelStore$)(_LOGOS_SELF_TYPE_INIT IGStoryAdsResponseParser*, SEL, id) _LOGOS_RETURN_RETAINED; static IGStoryAdsResponseParser* _logos_method$NoAds$IGStoryAdsResponseParser$initWithReelStore$(_LOGOS_SELF_TYPE_INIT IGStoryAdsResponseParser*, SEL, id) _LOGOS_RETURN_RETAINED; static IGStoryAdsOptInTextView* (*_logos_orig$NoAds$IGStoryAdsOptInTextView$initWithBrandedContentStyledString$sponsoredPostLabel$)(_LOGOS_SELF_TYPE_INIT IGStoryAdsOptInTextView*, SEL, id, id) _LOGOS_RETURN_RETAINED; static IGStoryAdsOptInTextView* _logos_method$NoAds$IGStoryAdsOptInTextView$initWithBrandedContentStyledString$sponsoredPostLabel$(_LOGOS_SELF_TYPE_INIT IGStoryAdsOptInTextView*, SEL, id, id) _LOGOS_RETURN_RETAINED; static id (*_logos_orig$NoAds$IGSundialAdsResponseParser$parsedObjectFromResponse$)(_LOGOS_SELF_TYPE_NORMAL IGSundialAdsResponseParser* _LOGOS_SELF_CONST, SEL, id); static id _logos_method$NoAds$IGSundialAdsResponseParser$parsedObjectFromResponse$(_LOGOS_SELF_TYPE_NORMAL IGSundialAdsResponseParser* _LOGOS_SELF_CONST, SEL, id); static IGSundialAdsResponseParser* (*_logos_orig$NoAds$IGSundialAdsResponseParser$initWithMediaStore$userStore$)(_LOGOS_SELF_TYPE_INIT IGSundialAdsResponseParser*, SEL, id, id) _LOGOS_RETURN_RETAINED; static IGSundialAdsResponseParser* _logos_method$NoAds$IGSundialAdsResponseParser$initWithMediaStore$userStore$(_LOGOS_SELF_TYPE_INIT IGSundialAdsResponseParser*, SEL, id, id) _LOGOS_RETURN_RETAINED; 
  
    static NSArray * _logos_method$NoAds$IGMainFeedListAdapterDataSource$objectsForListAdapter$(_LOGOS_SELF_TYPE_NORMAL IGMainFeedListAdapterDataSource* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      return removeAdsItemsInList(_logos_orig$NoAds$IGMainFeedListAdapterDataSource$objectsForListAdapter$(self, _cmd, arg1));
    }
  

  
    static NSArray * _logos_method$NoAds$IGVideoFeedViewController$objectsForListAdapter$(_LOGOS_SELF_TYPE_NORMAL IGVideoFeedViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      return removeAdsItemsInList(_logos_orig$NoAds$IGVideoFeedViewController$objectsForListAdapter$(self, _cmd, arg1));
    }
  

  
    static NSArray * _logos_method$NoAds$IGChainingFeedViewController$objectsForListAdapter$(_LOGOS_SELF_TYPE_NORMAL IGChainingFeedViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      return removeAdsItemsInList(_logos_orig$NoAds$IGChainingFeedViewController$objectsForListAdapter$(self, _cmd, arg1));
    }
  

  
    static IGStoryAdPool* _logos_method$NoAds$IGStoryAdPool$initWithUserSession$(_LOGOS_SELF_TYPE_INIT IGStoryAdPool* __unused self, SEL __unused _cmd, id arg1) _LOGOS_RETURN_RETAINED {
      return nil;
    }
  

  
    static IGStoryAdsManager* _logos_method$NoAds$IGStoryAdsManager$initWithUserSession$storyViewerLoggingContext$storyFullscreenSectionLoggingContext$viewController$(_LOGOS_SELF_TYPE_INIT IGStoryAdsManager* __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3, id arg4) _LOGOS_RETURN_RETAINED {
      return nil;
    }
  

  
    static IGStoryAdsFetcher* _logos_method$NoAds$IGStoryAdsFetcher$initWithUserSession$delegate$(_LOGOS_SELF_TYPE_INIT IGStoryAdsFetcher* __unused self, SEL __unused _cmd, id arg1, id arg2) _LOGOS_RETURN_RETAINED {
      return nil;
    }
  

  
  
    static id _logos_method$NoAds$IGStoryAdsResponseParser$parsedObjectFromResponse$(_LOGOS_SELF_TYPE_NORMAL IGStoryAdsResponseParser* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      return nil;
    }

    static IGStoryAdsResponseParser* _logos_method$NoAds$IGStoryAdsResponseParser$initWithReelStore$(_LOGOS_SELF_TYPE_INIT IGStoryAdsResponseParser* __unused self, SEL __unused _cmd, id arg1) _LOGOS_RETURN_RETAINED {
      return nil;
    }
  

  
    static IGStoryAdsOptInTextView* _logos_method$NoAds$IGStoryAdsOptInTextView$initWithBrandedContentStyledString$sponsoredPostLabel$(_LOGOS_SELF_TYPE_INIT IGStoryAdsOptInTextView* __unused self, SEL __unused _cmd, id arg1, id arg2) _LOGOS_RETURN_RETAINED {
      return nil;
    }
  

  
    static id _logos_method$NoAds$IGSundialAdsResponseParser$parsedObjectFromResponse$(_LOGOS_SELF_TYPE_NORMAL IGSundialAdsResponseParser* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
      return nil;
    }

    static IGSundialAdsResponseParser* _logos_method$NoAds$IGSundialAdsResponseParser$initWithMediaStore$userStore$(_LOGOS_SELF_TYPE_INIT IGSundialAdsResponseParser* __unused self, SEL __unused _cmd, id arg1, id arg2) _LOGOS_RETURN_RETAINED {
      return nil;
    }
  


static IGImageView* (*_logos_orig$CanSaveMedia$IGImageView$initWithFrame$shouldBackgroundDecode$shouldUseProgressiveJPEG$placeholderProvider$)(_LOGOS_SELF_TYPE_INIT IGImageView*, SEL, CGRect, BOOL, BOOL, id) _LOGOS_RETURN_RETAINED; static IGImageView* _logos_method$CanSaveMedia$IGImageView$initWithFrame$shouldBackgroundDecode$shouldUseProgressiveJPEG$placeholderProvider$(_LOGOS_SELF_TYPE_INIT IGImageView*, SEL, CGRect, BOOL, BOOL, id) _LOGOS_RETURN_RETAINED; static IGImageView* (*_logos_orig$CanSaveMedia$IGImageView$initWithFrame$shouldUseProgressiveJPEG$placeholderProvider$)(_LOGOS_SELF_TYPE_INIT IGImageView*, SEL, CGRect, BOOL, id) _LOGOS_RETURN_RETAINED; static IGImageView* _logos_method$CanSaveMedia$IGImageView$initWithFrame$shouldUseProgressiveJPEG$placeholderProvider$(_LOGOS_SELF_TYPE_INIT IGImageView*, SEL, CGRect, BOOL, id) _LOGOS_RETURN_RETAINED; static void _logos_method$CanSaveMedia$IGImageView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGImageView* _LOGOS_SELF_CONST, SEL); static void _logos_method$CanSaveMedia$IGImageView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGImageView* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer *); static IGModernFeedVideoCell* (*_logos_orig$CanSaveMedia$IGModernFeedVideoCell$initWithFrame$)(_LOGOS_SELF_TYPE_INIT IGModernFeedVideoCell*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static IGModernFeedVideoCell* _logos_method$CanSaveMedia$IGModernFeedVideoCell$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGModernFeedVideoCell*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$CanSaveMedia$IGModernFeedVideoCell$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGModernFeedVideoCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$CanSaveMedia$IGModernFeedVideoCell$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGModernFeedVideoCell* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer *); static IGPanavisionFeedVideoCell* (*_logos_orig$CanSaveMedia$IGPanavisionFeedVideoCell$initWithFrame$)(_LOGOS_SELF_TYPE_INIT IGPanavisionFeedVideoCell*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static IGPanavisionFeedVideoCell* _logos_method$CanSaveMedia$IGPanavisionFeedVideoCell$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGPanavisionFeedVideoCell*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$CanSaveMedia$IGPanavisionFeedVideoCell$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGPanavisionFeedVideoCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$CanSaveMedia$IGPanavisionFeedVideoCell$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGPanavisionFeedVideoCell* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer *); static IGFeedItemVideoView* (*_logos_orig$CanSaveMedia$IGFeedItemVideoView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT IGFeedItemVideoView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static IGFeedItemVideoView* _logos_method$CanSaveMedia$IGFeedItemVideoView$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGFeedItemVideoView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$CanSaveMedia$IGFeedItemVideoView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGFeedItemVideoView* _LOGOS_SELF_CONST, SEL); static void _logos_method$CanSaveMedia$IGFeedItemVideoView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGFeedItemVideoView* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer *); static IGTVFullscreenVideoCell* (*_logos_orig$CanSaveMedia$IGTVFullscreenVideoCell$initWithFrame$)(_LOGOS_SELF_TYPE_INIT IGTVFullscreenVideoCell*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static IGTVFullscreenVideoCell* _logos_method$CanSaveMedia$IGTVFullscreenVideoCell$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGTVFullscreenVideoCell*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$CanSaveMedia$IGTVFullscreenVideoCell$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGTVFullscreenVideoCell* _LOGOS_SELF_CONST, SEL); static void _logos_method$CanSaveMedia$IGTVFullscreenVideoCell$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGTVFullscreenVideoCell* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer *); static IGStoryViewerContainerView* (*_logos_orig$CanSaveMedia$IGStoryViewerContainerView$initWithFrame$shouldCreateComposerBackgroundView$userSession$bloksContext$)(_LOGOS_SELF_TYPE_INIT IGStoryViewerContainerView*, SEL, CGRect, BOOL, id, id) _LOGOS_RETURN_RETAINED; static IGStoryViewerContainerView* _logos_method$CanSaveMedia$IGStoryViewerContainerView$initWithFrame$shouldCreateComposerBackgroundView$userSession$bloksContext$(_LOGOS_SELF_TYPE_INIT IGStoryViewerContainerView*, SEL, CGRect, BOOL, id, id) _LOGOS_RETURN_RETAINED; static void _logos_method$CanSaveMedia$IGStoryViewerContainerView$hDownloadButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGStoryViewerContainerView* _LOGOS_SELF_CONST, SEL, UIButton *); static IGSundialVideoPlaybackView* (*_logos_orig$CanSaveMedia$IGSundialVideoPlaybackView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT IGSundialVideoPlaybackView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static IGSundialVideoPlaybackView* _logos_method$CanSaveMedia$IGSundialVideoPlaybackView$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGSundialVideoPlaybackView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$CanSaveMedia$IGSundialVideoPlaybackView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGSundialVideoPlaybackView* _LOGOS_SELF_CONST, SEL); static void _logos_method$CanSaveMedia$IGSundialVideoPlaybackView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGSundialVideoPlaybackView* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer *); 
  
    static IGImageView* _logos_method$CanSaveMedia$IGImageView$initWithFrame$shouldBackgroundDecode$shouldUseProgressiveJPEG$placeholderProvider$(_LOGOS_SELF_TYPE_INIT IGImageView* __unused self, SEL __unused _cmd, CGRect arg1, BOOL arg2, BOOL arg3, id arg4) _LOGOS_RETURN_RETAINED {
      self = _logos_orig$CanSaveMedia$IGImageView$initWithFrame$shouldBackgroundDecode$shouldUseProgressiveJPEG$placeholderProvider$(self, _cmd, arg1, arg2, arg3, arg4);
      [self addHandleLongPress];
      return self;
    }

    static IGImageView* _logos_method$CanSaveMedia$IGImageView$initWithFrame$shouldUseProgressiveJPEG$placeholderProvider$(_LOGOS_SELF_TYPE_INIT IGImageView* __unused self, SEL __unused _cmd, CGRect arg1, BOOL arg2, id arg3) _LOGOS_RETURN_RETAINED {
      self = _logos_orig$CanSaveMedia$IGImageView$initWithFrame$shouldUseProgressiveJPEG$placeholderProvider$(self, _cmd, arg1, arg2, arg3);
      [self addHandleLongPress];
      return self;
    }

    
    static void _logos_method$CanSaveMedia$IGImageView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGImageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
      longPress.minimumPressDuration = 0.3;
      [self addGestureRecognizer:longPress];
    }

    
    static void _logos_method$CanSaveMedia$IGImageView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGImageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer * sender) {
      if (sender.state == UIGestureRecognizerStateBegan) {
        if ([self.viewController isKindOfClass:_logos_static_class_lookup$IGStoryViewerViewController()]) { 
          return;
        }

        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Instagram No Ads" message:nil preferredStyle:IS_iPAD ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet];
        [alert addAction:[UIAlertAction actionWithTitle:@"Preview" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
          InstaZoomImageViewController *imageVC = [[_logos_static_class_lookup$InstaZoomImageViewController() alloc] initWithSourceImage:self.image];

          if (imageVC)
          {
            imageVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
            imageVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            
            [self.viewController presentViewController:imageVC animated:YES completion:nil];
          }
        }]];

        [alert addAction:[UIAlertAction actionWithTitle:@"Download photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
          [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownloadURL:self.imageSpecifier.url appendExtension:nil mediaType:Image toAlbum:@"Instagram" view:self];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        [self.viewController presentViewController:alert animated:YES completion:nil];
      }
    }
  

  
  static IGModernFeedVideoCell* _logos_method$CanSaveMedia$IGModernFeedVideoCell$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGModernFeedVideoCell* __unused self, SEL __unused _cmd, CGRect arg1) _LOGOS_RETURN_RETAINED {
      id orig = _logos_orig$CanSaveMedia$IGModernFeedVideoCell$initWithFrame$(self, _cmd, arg1);
      [orig addHandleLongPress];
      return orig;
  }

   static void _logos_method$CanSaveMedia$IGModernFeedVideoCell$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGModernFeedVideoCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
      longPress.minimumPressDuration = 0.3;
      [self addGestureRecognizer:longPress];
  }
   static void _logos_method$CanSaveMedia$IGModernFeedVideoCell$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGModernFeedVideoCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer * sender) {
      if (sender.state == UIGestureRecognizerStateBegan) {
          UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Instagram No Ads" message:nil preferredStyle:IS_iPAD ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet];
          NSArray *videoURLArray = [self.post.video.allVideoURLs allObjects];
          
          [alert addAction:[UIAlertAction actionWithTitle:@"Preview" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
              AVPlayer *player = [AVPlayer playerWithURL:videoURLArray[videoURLArray.count - 1]];
              AVPlayerViewController *playerViewController = [AVPlayerViewController new];
              playerViewController.player = player;
              playerViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
              [self.viewController presentViewController:playerViewController animated:YES completion:^{
                  [playerViewController.player play];
              }];
          }]];
          
          for (int i = 0; i < [videoURLArray count]; i++) {
              [alert addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"Download video - link %d (%@)", i + 1, i == 0 ? @"HD" : @"SD"] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                  [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownloadURL:[videoURLArray objectAtIndex:i] appendExtension:nil mediaType:Video toAlbum:@"Instagram" view:self];
              }]];
          }
          [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
          [self.viewController presentViewController:alert animated:YES completion:nil];
      }
  }
  

  
  static IGPanavisionFeedVideoCell* _logos_method$CanSaveMedia$IGPanavisionFeedVideoCell$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGPanavisionFeedVideoCell* __unused self, SEL __unused _cmd, CGRect arg1) _LOGOS_RETURN_RETAINED {
      id orig = _logos_orig$CanSaveMedia$IGPanavisionFeedVideoCell$initWithFrame$(self, _cmd, arg1);
      [orig addHandleLongPress];
      return orig;
  }

   static void _logos_method$CanSaveMedia$IGPanavisionFeedVideoCell$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGPanavisionFeedVideoCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
      longPress.minimumPressDuration = 0.3;
      [self addGestureRecognizer:longPress];
  }
   static void _logos_method$CanSaveMedia$IGPanavisionFeedVideoCell$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGPanavisionFeedVideoCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer * sender) {
      if (sender.state == UIGestureRecognizerStateBegan) {
          UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Instagram No Ads" message:nil preferredStyle:IS_iPAD ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet];
          NSArray *videoURLArray = [self.post.video.allVideoURLs allObjects];
          
          [alert addAction:[UIAlertAction actionWithTitle:@"Preview" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
              AVPlayer *player = [AVPlayer playerWithURL:videoURLArray[videoURLArray.count - 1]];
              AVPlayerViewController *playerViewController = [AVPlayerViewController new];
              playerViewController.player = player;
              playerViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
              [self.viewController presentViewController:playerViewController animated:YES completion:^{
                  [playerViewController.player play];
              }];
          }]];
          
          for (int i = 0; i < [videoURLArray count]; i++) {
              [alert addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"Download video - link %d (%@)", i + 1, i == 0 ? @"HD" : @"SD"] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                  [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownloadURL:[videoURLArray objectAtIndex:i] appendExtension:nil mediaType:Video toAlbum:@"Instagram" view:self];
              }]];
          }
          [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
          [self.viewController presentViewController:alert animated:YES completion:nil];
      }
  }
  

  
    static IGFeedItemVideoView* _logos_method$CanSaveMedia$IGFeedItemVideoView$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGFeedItemVideoView* __unused self, SEL __unused _cmd, CGRect arg1) _LOGOS_RETURN_RETAINED {
      id orig = _logos_orig$CanSaveMedia$IGFeedItemVideoView$initWithFrame$(self, _cmd, arg1);
      [orig addHandleLongPress];
      return orig;
    }

    
    static void _logos_method$CanSaveMedia$IGFeedItemVideoView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGFeedItemVideoView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
      longPress.minimumPressDuration = 0.3;
      [self addGestureRecognizer:longPress];
    }

    
    static void _logos_method$CanSaveMedia$IGFeedItemVideoView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGFeedItemVideoView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer * sender) {
      if (sender.state == UIGestureRecognizerStateBegan) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Instagram No Ads" message:nil preferredStyle:IS_iPAD ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet];
        NSArray *videoURLArray = [self.video.allVideoURLs allObjects];

        [alert addAction:[UIAlertAction actionWithTitle:@"Preview" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            AVPlayer *player = [AVPlayer playerWithURL:videoURLArray[videoURLArray.count - 1]];
            AVPlayerViewController *playerViewController = [AVPlayerViewController new];
            playerViewController.player = player;
            playerViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self.viewController presentViewController:playerViewController animated:YES completion:^{
              [playerViewController.player play];
            }];
        }]];

        for (int i = 0; i < [videoURLArray count]; i++) {
          [alert addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"Download video - link %d (%@)", i + 1, i == 0 ? @"HD" : @"SD"] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownloadURL:[videoURLArray objectAtIndex:i] appendExtension:nil mediaType:Video toAlbum:@"Instagram" view:self];
          }]];
        }
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        [self.viewController presentViewController:alert animated:YES completion:nil];
      }
    }
  

  
    static IGTVFullscreenVideoCell* _logos_method$CanSaveMedia$IGTVFullscreenVideoCell$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGTVFullscreenVideoCell* __unused self, SEL __unused _cmd, CGRect arg1) _LOGOS_RETURN_RETAINED {
      id orig = _logos_orig$CanSaveMedia$IGTVFullscreenVideoCell$initWithFrame$(self, _cmd, arg1);
      [orig addHandleLongPress];
      return orig;
    }

    
    static void _logos_method$CanSaveMedia$IGTVFullscreenVideoCell$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGTVFullscreenVideoCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
      longPress.minimumPressDuration = 0.3;
      [self addGestureRecognizer:longPress];
    }

    
    static void _logos_method$CanSaveMedia$IGTVFullscreenVideoCell$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGTVFullscreenVideoCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer * sender) {
      if (sender.state == UIGestureRecognizerStateBegan) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Instagram No Ads" message:nil preferredStyle:IS_iPAD ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet];
        IGVideoPlayer *_videoPlayer = MSHookIvar<IGVideoPlayer *>(self.delegate, "_videoPlayer");
        IGVideo *_video = MSHookIvar<IGVideo *>(_videoPlayer, "_video");
        NSArray *videoURLArray = [_video.allVideoURLs allObjects];

        [alert addAction:[UIAlertAction actionWithTitle:@"Preview" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            AVPlayer *player = [AVPlayer playerWithURL:videoURLArray[videoURLArray.count - 1]];
            AVPlayerViewController *playerViewController = [AVPlayerViewController new];
            playerViewController.player = player;
            playerViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self.viewController presentViewController:playerViewController animated:YES completion:^{
              [playerViewController.player play];
            }];
        }]];

        for (int i = 0; i < [videoURLArray count]; i++) {
          [alert addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"Download video - link %d (%@)", i + 1, i == 0 ? @"HD" : @"SD"] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownloadURL:[videoURLArray objectAtIndex:i] appendExtension:nil mediaType:Video toAlbum:@"Instagram" viewController:self.viewController];
          }]];
        }
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        [self.viewController presentViewController:alert animated:YES completion:nil];
      }
    }
  

  
    __attribute__((used)) static UIButton * _logos_property$CanSaveMedia$IGStoryViewerContainerView$hDownloadButton(IGStoryViewerContainerView * __unused self, SEL __unused _cmd) { return (UIButton *)objc_getAssociatedObject(self, (void *)_logos_property$CanSaveMedia$IGStoryViewerContainerView$hDownloadButton); }; __attribute__((used)) static void _logos_property$CanSaveMedia$IGStoryViewerContainerView$setHDownloadButton(IGStoryViewerContainerView * __unused self, SEL __unused _cmd, UIButton * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$CanSaveMedia$IGStoryViewerContainerView$hDownloadButton, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
    static IGStoryViewerContainerView* _logos_method$CanSaveMedia$IGStoryViewerContainerView$initWithFrame$shouldCreateComposerBackgroundView$userSession$bloksContext$(_LOGOS_SELF_TYPE_INIT IGStoryViewerContainerView* __unused self, SEL __unused _cmd, CGRect arg1, BOOL arg2, id arg3, id arg4) _LOGOS_RETURN_RETAINED {
      self = _logos_orig$CanSaveMedia$IGStoryViewerContainerView$initWithFrame$shouldCreateComposerBackgroundView$userSession$bloksContext$(self, _cmd, arg1, arg2, arg3, arg4);

      self.hDownloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [self.hDownloadButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
      [self.hDownloadButton addTarget:self action:@selector(hDownloadButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
      
      [self.hDownloadButton setBackgroundImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/instanoads/download.png"] forState:UIControlStateNormal];
      self.hDownloadButton.frame = CGRectMake(self.frame.size.width - 40, self.frame.size.height - ([HCommon isNotch] ? 120.0 : 90.0), 24.0, 24.0);
      [self addSubview:self.hDownloadButton];
      return self;
    }

    
    static void _logos_method$CanSaveMedia$IGStoryViewerContainerView$hDownloadButtonPressed$(_LOGOS_SELF_TYPE_NORMAL IGStoryViewerContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton * sender) {
      if ([self.mediaView isKindOfClass:_logos_static_class_lookup$IGStoryPhotoView()]) {
        NSURL *url = ((IGStoryPhotoView *)self.mediaView).photoView.imageSpecifier.url;
        [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownloadURL:url appendExtension:nil mediaType:Image toAlbum:@"Instagram" view:self];
      } else if ([self.mediaView isKindOfClass:_logos_static_class_lookup$IGStoryVideoView()]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Instagram No Ads" message:nil preferredStyle:IS_iPAD ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet];
        IGVideo *_video = MSHookIvar<IGVideo *>(((IGStoryVideoView *)self.mediaView).videoPlayer, "_video");
        NSArray *videoURLArray = [_video.allVideoURLs allObjects];
        for (int i = 0; i < [videoURLArray count]; i++) {
          [alert addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"Download video - link %d (%@)", i + 1, i == 0 ? @"HD" : @"SD"] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownloadURL:[videoURLArray objectAtIndex:i] appendExtension:nil mediaType:Video toAlbum:@"Instagram" viewController:self.viewController];
          }]];
        }
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        [self.viewController presentViewController:alert animated:YES completion:nil];
      } else {
        [HCommon showAlertMessage:@"This story has no media to download. Seems like it's a bug. Please report to the developer" withTitle:@"Error" viewController:nil];
      }
    }
  

  
    static IGSundialVideoPlaybackView* _logos_method$CanSaveMedia$IGSundialVideoPlaybackView$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGSundialVideoPlaybackView* __unused self, SEL __unused _cmd, CGRect arg1) _LOGOS_RETURN_RETAINED {
      id orig = _logos_orig$CanSaveMedia$IGSundialVideoPlaybackView$initWithFrame$(self, _cmd, arg1);
      [orig addHandleLongPress];
      return orig;
    }

    
    static void _logos_method$CanSaveMedia$IGSundialVideoPlaybackView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGSundialVideoPlaybackView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
      longPress.minimumPressDuration = 0.3;
      [self addGestureRecognizer:longPress];
    }

    
    static void _logos_method$CanSaveMedia$IGSundialVideoPlaybackView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGSundialVideoPlaybackView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer * sender) {
      if (sender.state == UIGestureRecognizerStateBegan) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Instagram No Ads" message:nil preferredStyle:IS_iPAD ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet];
        IGFeedItem *_feedItem = MSHookIvar<IGFeedItem *>(self, "_video");
        IGVideo *video = _feedItem.video;
        NSArray *videoURLArray = [video.allVideoURLs allObjects];

        [alert addAction:[UIAlertAction actionWithTitle:@"Preview" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            AVPlayer *player = [AVPlayer playerWithURL:videoURLArray[videoURLArray.count - 1]];
            AVPlayerViewController *playerViewController = [AVPlayerViewController new];
            playerViewController.player = player;
            playerViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self.viewController presentViewController:playerViewController animated:YES completion:^{
              [playerViewController.player play];
            }];
        }]];

        for (int i = 0; i < [videoURLArray count]; i++) {
          [alert addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"Download video - link %d (%@)", i + 1, i == 0 ? @"HD" : @"SD"] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownloadURL:[videoURLArray objectAtIndex:i] appendExtension:nil mediaType:Video toAlbum:@"Instagram" view:self];
          }]];
        }
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        [self.viewController presentViewController:alert animated:YES completion:nil];
      }
    }
  


static IGProfilePictureImageView* (*_logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$buttonDisabled$)(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView*, SEL, CGRect, long long, id, BOOL) _LOGOS_RETURN_RETAINED; static IGProfilePictureImageView* _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$buttonDisabled$(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView*, SEL, CGRect, long long, id, BOOL) _LOGOS_RETURN_RETAINED; static IGProfilePictureImageView* (*_logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$)(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView*, SEL, CGRect, long long, id) _LOGOS_RETURN_RETAINED; static IGProfilePictureImageView* _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView*, SEL, CGRect, long long, id) _LOGOS_RETURN_RETAINED; static IGProfilePictureImageView* (*_logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$)(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView*, SEL, CGRect, long long) _LOGOS_RETURN_RETAINED; static IGProfilePictureImageView* _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView*, SEL, CGRect, long long) _LOGOS_RETURN_RETAINED; static IGProfilePictureImageView* (*_logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static IGProfilePictureImageView* _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGProfilePictureImageView* _LOGOS_SELF_CONST, SEL); static void _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGProfilePictureImageView* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer *); 
  
    static IGProfilePictureImageView* _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$buttonDisabled$(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView* __unused self, SEL __unused _cmd, CGRect arg1, long long arg2, id arg3, BOOL arg4) _LOGOS_RETURN_RETAINED {
      self = _logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$buttonDisabled$(self, _cmd, arg1, arg2, arg3, arg4);
      [self addHandleLongPress];
      return self;
    }

    static IGProfilePictureImageView* _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView* __unused self, SEL __unused _cmd, CGRect arg1, long long arg2, id arg3) _LOGOS_RETURN_RETAINED {
      self = _logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$(self, _cmd, arg1, arg2, arg3);
      [self addHandleLongPress];
      return self;
    }

    static IGProfilePictureImageView* _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView* __unused self, SEL __unused _cmd, CGRect arg1, long long arg2) _LOGOS_RETURN_RETAINED {
      self = _logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$(self, _cmd, arg1, arg2);
      [self addHandleLongPress];
      return self;
    }

    static IGProfilePictureImageView* _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGProfilePictureImageView* __unused self, SEL __unused _cmd, CGRect arg1) _LOGOS_RETURN_RETAINED {
      self = _logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$(self, _cmd, arg1);
      [self addHandleLongPress];
      return self;
    }

    
    static void _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL IGProfilePictureImageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
      longPress.minimumPressDuration = 0.3;
      [self addGestureRecognizer:longPress];
    }

    
    static void _logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL IGProfilePictureImageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer * sender) {
      if (sender.state == UIGestureRecognizerStateBegan) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Instagram No Ads" message:nil preferredStyle:IS_iPAD ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet];
        NSURL *HDProfilePicURL = [self.user HDProfilePicURL];

        [alert addAction:[UIAlertAction actionWithTitle:@"Preview" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
          InstaZoomImageViewController *imageVC = [[_logos_static_class_lookup$InstaZoomImageViewController() alloc] initWithSourceImageUrl:HDProfilePicURL];

          if (imageVC) {
            imageVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
            imageVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            
            [self.viewController presentViewController:imageVC animated:YES completion:nil];
          }
        }]];

        [alert addAction:[UIAlertAction actionWithTitle:@"Download HD Profile Picture" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
          [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownloadURL:HDProfilePicURL appendExtension:nil mediaType:Image toAlbum:@"Instagram" viewController:self.viewController];
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
        [self.viewController presentViewController:alert animated:YES completion:nil];
      }
    }
  


static BOOL (*_logos_orig$DisableDirectMessageSeenReceipt$IGDirectThreadViewListAdapterDataSource$shouldUpdateLastSeenMessage)(_LOGOS_SELF_TYPE_NORMAL IGDirectThreadViewListAdapterDataSource* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$DisableDirectMessageSeenReceipt$IGDirectThreadViewListAdapterDataSource$shouldUpdateLastSeenMessage(_LOGOS_SELF_TYPE_NORMAL IGDirectThreadViewListAdapterDataSource* _LOGOS_SELF_CONST, SEL); 
  
    static BOOL _logos_method$DisableDirectMessageSeenReceipt$IGDirectThreadViewListAdapterDataSource$shouldUpdateLastSeenMessage(_LOGOS_SELF_TYPE_NORMAL IGDirectThreadViewListAdapterDataSource* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      return FALSE;
    }
  


static void (*_logos_orig$DisableStorySeenReceipt$IGStoryViewerViewController$fullscreenSectionController$didMarkItemAsSeen$)(_LOGOS_SELF_TYPE_NORMAL IGStoryViewerViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$DisableStorySeenReceipt$IGStoryViewerViewController$fullscreenSectionController$didMarkItemAsSeen$(_LOGOS_SELF_TYPE_NORMAL IGStoryViewerViewController* _LOGOS_SELF_CONST, SEL, id, id); 
  
    static void _logos_method$DisableStorySeenReceipt$IGStoryViewerViewController$fullscreenSectionController$didMarkItemAsSeen$(_LOGOS_SELF_TYPE_NORMAL IGStoryViewerViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    }
  


static IGProfileSimpleAvatarStatsCell* (*_logos_orig$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$initWithFrame$)(_LOGOS_SELF_TYPE_INIT IGProfileSimpleAvatarStatsCell*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static IGProfileSimpleAvatarStatsCell* _logos_method$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGProfileSimpleAvatarStatsCell*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$addIsFollowingYouBadgeView(_LOGOS_SELF_TYPE_NORMAL IGProfileSimpleAvatarStatsCell* _LOGOS_SELF_CONST, SEL); 
  
    __attribute__((used)) static UILabel * _logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$isFollowingYouLabel(IGProfileSimpleAvatarStatsCell * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$isFollowingYouLabel); }; __attribute__((used)) static void _logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$setIsFollowingYouLabel(IGProfileSimpleAvatarStatsCell * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$isFollowingYouLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
    __attribute__((used)) static UIView * _logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$isFollowingYouBadge(IGProfileSimpleAvatarStatsCell * __unused self, SEL __unused _cmd) { return (UIView *)objc_getAssociatedObject(self, (void *)_logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$isFollowingYouBadge); }; __attribute__((used)) static void _logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$setIsFollowingYouBadge(IGProfileSimpleAvatarStatsCell * __unused self, SEL __unused _cmd, UIView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$isFollowingYouBadge, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

    static IGProfileSimpleAvatarStatsCell* _logos_method$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$initWithFrame$(_LOGOS_SELF_TYPE_INIT IGProfileSimpleAvatarStatsCell* __unused self, SEL __unused _cmd, CGRect arg1) _LOGOS_RETURN_RETAINED {
      self = _logos_orig$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$initWithFrame$(self, _cmd, arg1);

      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
        @try {
          IGProfileViewController *vc = (IGProfileViewController *)self.viewController;
          if (!vc) {
            throw [NSException exceptionWithName:@"NullPointerException" reason:@"IGProfileViewController is nil" userInfo:nil];
          }
          IGProfileBioModel *_bioModel = MSHookIvar<IGProfileBioModel *>(vc, "_bioModel");
          IGUser *user = _bioModel.user;

          IGWindow *rootView = (IGWindow *)[self _rootView];
          IGUser *currentUser = rootView.userSession.user;
          if (![user.username isEqualToString:currentUser.username] && user.followsCurrentUser) {
            [self addIsFollowingYouBadgeView];
          }
        } @catch (NSException *e) { }
      });

      return self;
    }

    
    static void _logos_method$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$addIsFollowingYouBadgeView(_LOGOS_SELF_TYPE_NORMAL IGProfileSimpleAvatarStatsCell* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      self.isFollowingYouBadge = [[UIView alloc] init];
      self.isFollowingYouBadge.frame = CGRectMake(155, 75, 70, 16);
      self.isFollowingYouBadge.alpha = 1;
      self.isFollowingYouBadge.layer.cornerRadius = 4;
      self.isFollowingYouBadge.backgroundColor = [HCommon isDarkMode] ? [UIColor colorWithRed:0.125 green:0.137 blue:0.153 alpha:1] : [UIColor colorWithRed:0.922 green:0.933 blue:0.941 alpha:1];

      [self addSubview:self.isFollowingYouBadge];

      UIFont * customFont = [UIFont fontWithName:@"Arial-BoldMT" size:10]; 
      self.isFollowingYouLabel = [[UILabel alloc] initWithFrame:CGRectMake(2.0, 0.0, 66.0, 16.0)];
      self.isFollowingYouLabel.translatesAutoresizingMaskIntoConstraints = false;
      self.isFollowingYouLabel.text = @"Follows you";
      self.isFollowingYouLabel.font = customFont;
      self.isFollowingYouLabel.adjustsFontSizeToFitWidth = true;
      self.isFollowingYouLabel.textAlignment = NSTextAlignmentCenter;
      self.isFollowingYouLabel.textColor = [HCommon isDarkMode] ? [UIColor colorWithRed:0.486 green:0.514 blue:0.541 alpha:1] : [UIColor colorWithRed:0.357 green:0.439 blue:0.541 alpha:1];
      [self.isFollowingYouBadge addSubview:self.isFollowingYouLabel];

    }
  


static id observer;
static __attribute__((constructor)) void _logosLocalCtor_4a53c512(int __unused argc, char __unused **argv, char __unused **envp) {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) reloadPrefs, CFSTR(PREF_CHANGED_NOTIF), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
  reloadPrefs();

  {Class _logos_class$SecurityGroup$IGInstagramAppDelegate = objc_getClass("IGInstagramAppDelegate"); { MSHookMessageEx(_logos_class$SecurityGroup$IGInstagramAppDelegate, @selector(applicationDidBecomeActive:), (IMP)&_logos_method$SecurityGroup$IGInstagramAppDelegate$applicationDidBecomeActive$, (IMP*)&_logos_orig$SecurityGroup$IGInstagramAppDelegate$applicationDidBecomeActive$);}{ MSHookMessageEx(_logos_class$SecurityGroup$IGInstagramAppDelegate, @selector(applicationWillEnterForeground:), (IMP)&_logos_method$SecurityGroup$IGInstagramAppDelegate$applicationWillEnterForeground$, (IMP*)&_logos_orig$SecurityGroup$IGInstagramAppDelegate$applicationWillEnterForeground$);}}

  
  observer = [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification
    object:nil queue:[NSOperationQueue mainQueue]
    usingBlock:^(NSNotification *notification) {
      if (showLikeCount) {
        {Class _logos_class$ShowLikeCount$IGFeedItem = objc_getClass("IGFeedItem"); { MSHookMessageEx(_logos_class$ShowLikeCount$IGFeedItem, @selector(buildLikeCellStyledStringWithIcon:andText:style:), (IMP)&_logos_method$ShowLikeCount$IGFeedItem$buildLikeCellStyledStringWithIcon$andText$style$, (IMP*)&_logos_orig$ShowLikeCount$IGFeedItem$buildLikeCellStyledStringWithIcon$andText$style$);}Class _logos_class$ShowLikeCount$IGFeedItemLikeCountCell = objc_getClass("IGFeedItemLikeCountCell"); Class _logos_metaclass$ShowLikeCount$IGFeedItemLikeCountCell = object_getClass(_logos_class$ShowLikeCount$IGFeedItemLikeCountCell); { MSHookMessageEx(_logos_metaclass$ShowLikeCount$IGFeedItemLikeCountCell, @selector(buildStyledStringWithMedia:feedItemRow:pageCellState:configuration:feedConfiguration:contentWidth:textWidth:combinedContextOptions:userSession:), (IMP)&_logos_meta_method$ShowLikeCount$IGFeedItemLikeCountCell$buildStyledStringWithMedia$feedItemRow$pageCellState$configuration$feedConfiguration$contentWidth$textWidth$combinedContextOptions$userSession$, (IMP*)&_logos_meta_orig$ShowLikeCount$IGFeedItemLikeCountCell$buildStyledStringWithMedia$feedItemRow$pageCellState$configuration$feedConfiguration$contentWidth$textWidth$combinedContextOptions$userSession$);}}
      }

      if (likeConfirmation) {
        {Class _logos_class$LikeConfirmation$IGUFIButtonBarView = objc_getClass("IGUFIButtonBarView"); { MSHookMessageEx(_logos_class$LikeConfirmation$IGUFIButtonBarView, @selector(_onLikeButtonPressed:), (IMP)&_logos_method$LikeConfirmation$IGUFIButtonBarView$_onLikeButtonPressed$, (IMP*)&_logos_orig$LikeConfirmation$IGUFIButtonBarView$_onLikeButtonPressed$);}Class _logos_class$LikeConfirmation$IGFeedPhotoView = objc_getClass("IGFeedPhotoView"); { MSHookMessageEx(_logos_class$LikeConfirmation$IGFeedPhotoView, @selector(_onDoubleTap:), (IMP)&_logos_method$LikeConfirmation$IGFeedPhotoView$_onDoubleTap$, (IMP*)&_logos_orig$LikeConfirmation$IGFeedPhotoView$_onDoubleTap$);}Class _logos_class$LikeConfirmation$IGFeedItemVideoView = objc_getClass("IGFeedItemVideoView"); { MSHookMessageEx(_logos_class$LikeConfirmation$IGFeedItemVideoView, @selector(_handleOverlayDoubleTap), (IMP)&_logos_method$LikeConfirmation$IGFeedItemVideoView$_handleOverlayDoubleTap, (IMP*)&_logos_orig$LikeConfirmation$IGFeedItemVideoView$_handleOverlayDoubleTap);}Class _logos_class$LikeConfirmation$IGSundialViewerVideoCell = objc_getClass("IGSundialViewerVideoCell"); { MSHookMessageEx(_logos_class$LikeConfirmation$IGSundialViewerVideoCell, @selector(_handleDoubleTap:), (IMP)&_logos_method$LikeConfirmation$IGSundialViewerVideoCell$_handleDoubleTap$, (IMP*)&_logos_orig$LikeConfirmation$IGSundialViewerVideoCell$_handleDoubleTap$);}Class _logos_class$LikeConfirmation$IGSundialViewerLikeButton = objc_getClass("IGSundialViewerLikeButton"); { MSHookMessageEx(_logos_class$LikeConfirmation$IGSundialViewerLikeButton, @selector(touchDetector:touchesEnded:withEvent:), (IMP)&_logos_method$LikeConfirmation$IGSundialViewerLikeButton$touchDetector$touchesEnded$withEvent$, (IMP*)&_logos_orig$LikeConfirmation$IGSundialViewerLikeButton$touchDetector$touchesEnded$withEvent$);}Class _logos_class$LikeConfirmation$IGCommentCell = objc_getClass("IGCommentCell"); { MSHookMessageEx(_logos_class$LikeConfirmation$IGCommentCell, @selector(_didDoubleTap:), (IMP)&_logos_method$LikeConfirmation$IGCommentCell$_didDoubleTap$, (IMP*)&_logos_orig$LikeConfirmation$IGCommentCell$_didDoubleTap$);}{ MSHookMessageEx(_logos_class$LikeConfirmation$IGCommentCell, @selector(contentView:didTapOnLikeButton:), (IMP)&_logos_method$LikeConfirmation$IGCommentCell$contentView$didTapOnLikeButton$, (IMP*)&_logos_orig$LikeConfirmation$IGCommentCell$contentView$didTapOnLikeButton$);}}
      }

      if (noads) {
        {Class _logos_class$NoAds$IGMainFeedListAdapterDataSource = objc_getClass("IGMainFeedListAdapterDataSource"); { MSHookMessageEx(_logos_class$NoAds$IGMainFeedListAdapterDataSource, @selector(objectsForListAdapter:), (IMP)&_logos_method$NoAds$IGMainFeedListAdapterDataSource$objectsForListAdapter$, (IMP*)&_logos_orig$NoAds$IGMainFeedListAdapterDataSource$objectsForListAdapter$);}Class _logos_class$NoAds$IGVideoFeedViewController = objc_getClass("IGVideoFeedViewController"); { MSHookMessageEx(_logos_class$NoAds$IGVideoFeedViewController, @selector(objectsForListAdapter:), (IMP)&_logos_method$NoAds$IGVideoFeedViewController$objectsForListAdapter$, (IMP*)&_logos_orig$NoAds$IGVideoFeedViewController$objectsForListAdapter$);}Class _logos_class$NoAds$IGChainingFeedViewController = objc_getClass("IGChainingFeedViewController"); { MSHookMessageEx(_logos_class$NoAds$IGChainingFeedViewController, @selector(objectsForListAdapter:), (IMP)&_logos_method$NoAds$IGChainingFeedViewController$objectsForListAdapter$, (IMP*)&_logos_orig$NoAds$IGChainingFeedViewController$objectsForListAdapter$);}Class _logos_class$NoAds$IGStoryAdPool = objc_getClass("IGStoryAdPool"); { MSHookMessageEx(_logos_class$NoAds$IGStoryAdPool, @selector(initWithUserSession:), (IMP)&_logos_method$NoAds$IGStoryAdPool$initWithUserSession$, (IMP*)&_logos_orig$NoAds$IGStoryAdPool$initWithUserSession$);}Class _logos_class$NoAds$IGStoryAdsManager = objc_getClass("IGStoryAdsManager"); { MSHookMessageEx(_logos_class$NoAds$IGStoryAdsManager, @selector(initWithUserSession:storyViewerLoggingContext:storyFullscreenSectionLoggingContext:viewController:), (IMP)&_logos_method$NoAds$IGStoryAdsManager$initWithUserSession$storyViewerLoggingContext$storyFullscreenSectionLoggingContext$viewController$, (IMP*)&_logos_orig$NoAds$IGStoryAdsManager$initWithUserSession$storyViewerLoggingContext$storyFullscreenSectionLoggingContext$viewController$);}Class _logos_class$NoAds$IGStoryAdsFetcher = objc_getClass("IGStoryAdsFetcher"); { MSHookMessageEx(_logos_class$NoAds$IGStoryAdsFetcher, @selector(initWithUserSession:delegate:), (IMP)&_logos_method$NoAds$IGStoryAdsFetcher$initWithUserSession$delegate$, (IMP*)&_logos_orig$NoAds$IGStoryAdsFetcher$initWithUserSession$delegate$);}Class _logos_class$NoAds$IGStoryAdsResponseParser = objc_getClass("IGStoryAdsResponseParser"); { MSHookMessageEx(_logos_class$NoAds$IGStoryAdsResponseParser, @selector(parsedObjectFromResponse:), (IMP)&_logos_method$NoAds$IGStoryAdsResponseParser$parsedObjectFromResponse$, (IMP*)&_logos_orig$NoAds$IGStoryAdsResponseParser$parsedObjectFromResponse$);}{ MSHookMessageEx(_logos_class$NoAds$IGStoryAdsResponseParser, @selector(initWithReelStore:), (IMP)&_logos_method$NoAds$IGStoryAdsResponseParser$initWithReelStore$, (IMP*)&_logos_orig$NoAds$IGStoryAdsResponseParser$initWithReelStore$);}Class _logos_class$NoAds$IGStoryAdsOptInTextView = objc_getClass("IGStoryAdsOptInTextView"); { MSHookMessageEx(_logos_class$NoAds$IGStoryAdsOptInTextView, @selector(initWithBrandedContentStyledString:sponsoredPostLabel:), (IMP)&_logos_method$NoAds$IGStoryAdsOptInTextView$initWithBrandedContentStyledString$sponsoredPostLabel$, (IMP*)&_logos_orig$NoAds$IGStoryAdsOptInTextView$initWithBrandedContentStyledString$sponsoredPostLabel$);}Class _logos_class$NoAds$IGSundialAdsResponseParser = objc_getClass("IGSundialAdsResponseParser"); { MSHookMessageEx(_logos_class$NoAds$IGSundialAdsResponseParser, @selector(parsedObjectFromResponse:), (IMP)&_logos_method$NoAds$IGSundialAdsResponseParser$parsedObjectFromResponse$, (IMP*)&_logos_orig$NoAds$IGSundialAdsResponseParser$parsedObjectFromResponse$);}{ MSHookMessageEx(_logos_class$NoAds$IGSundialAdsResponseParser, @selector(initWithMediaStore:userStore:), (IMP)&_logos_method$NoAds$IGSundialAdsResponseParser$initWithMediaStore$userStore$, (IMP*)&_logos_orig$NoAds$IGSundialAdsResponseParser$initWithMediaStore$userStore$);}}
      }

      if (canSaveMedia) {
        {Class _logos_class$CanSaveMedia$IGImageView = objc_getClass("IGImageView"); { MSHookMessageEx(_logos_class$CanSaveMedia$IGImageView, @selector(initWithFrame:shouldBackgroundDecode:shouldUseProgressiveJPEG:placeholderProvider:), (IMP)&_logos_method$CanSaveMedia$IGImageView$initWithFrame$shouldBackgroundDecode$shouldUseProgressiveJPEG$placeholderProvider$, (IMP*)&_logos_orig$CanSaveMedia$IGImageView$initWithFrame$shouldBackgroundDecode$shouldUseProgressiveJPEG$placeholderProvider$);}{ MSHookMessageEx(_logos_class$CanSaveMedia$IGImageView, @selector(initWithFrame:shouldUseProgressiveJPEG:placeholderProvider:), (IMP)&_logos_method$CanSaveMedia$IGImageView$initWithFrame$shouldUseProgressiveJPEG$placeholderProvider$, (IMP*)&_logos_orig$CanSaveMedia$IGImageView$initWithFrame$shouldUseProgressiveJPEG$placeholderProvider$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGImageView, @selector(addHandleLongPress), (IMP)&_logos_method$CanSaveMedia$IGImageView$addHandleLongPress, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer *), strlen(@encode(UILongPressGestureRecognizer *))); i += strlen(@encode(UILongPressGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGImageView, @selector(handleLongPress:), (IMP)&_logos_method$CanSaveMedia$IGImageView$handleLongPress$, _typeEncoding); }Class _logos_class$CanSaveMedia$IGModernFeedVideoCell = objc_getClass("IGModernFeedVideoCell"); { MSHookMessageEx(_logos_class$CanSaveMedia$IGModernFeedVideoCell, @selector(initWithFrame:), (IMP)&_logos_method$CanSaveMedia$IGModernFeedVideoCell$initWithFrame$, (IMP*)&_logos_orig$CanSaveMedia$IGModernFeedVideoCell$initWithFrame$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGModernFeedVideoCell, @selector(addHandleLongPress), (IMP)&_logos_method$CanSaveMedia$IGModernFeedVideoCell$addHandleLongPress, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer *), strlen(@encode(UILongPressGestureRecognizer *))); i += strlen(@encode(UILongPressGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGModernFeedVideoCell, @selector(handleLongPress:), (IMP)&_logos_method$CanSaveMedia$IGModernFeedVideoCell$handleLongPress$, _typeEncoding); }Class _logos_class$CanSaveMedia$IGPanavisionFeedVideoCell = objc_getClass("IGPanavisionFeedVideoCell"); { MSHookMessageEx(_logos_class$CanSaveMedia$IGPanavisionFeedVideoCell, @selector(initWithFrame:), (IMP)&_logos_method$CanSaveMedia$IGPanavisionFeedVideoCell$initWithFrame$, (IMP*)&_logos_orig$CanSaveMedia$IGPanavisionFeedVideoCell$initWithFrame$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGPanavisionFeedVideoCell, @selector(addHandleLongPress), (IMP)&_logos_method$CanSaveMedia$IGPanavisionFeedVideoCell$addHandleLongPress, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer *), strlen(@encode(UILongPressGestureRecognizer *))); i += strlen(@encode(UILongPressGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGPanavisionFeedVideoCell, @selector(handleLongPress:), (IMP)&_logos_method$CanSaveMedia$IGPanavisionFeedVideoCell$handleLongPress$, _typeEncoding); }Class _logos_class$CanSaveMedia$IGFeedItemVideoView = objc_getClass("IGFeedItemVideoView"); { MSHookMessageEx(_logos_class$CanSaveMedia$IGFeedItemVideoView, @selector(initWithFrame:), (IMP)&_logos_method$CanSaveMedia$IGFeedItemVideoView$initWithFrame$, (IMP*)&_logos_orig$CanSaveMedia$IGFeedItemVideoView$initWithFrame$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGFeedItemVideoView, @selector(addHandleLongPress), (IMP)&_logos_method$CanSaveMedia$IGFeedItemVideoView$addHandleLongPress, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer *), strlen(@encode(UILongPressGestureRecognizer *))); i += strlen(@encode(UILongPressGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGFeedItemVideoView, @selector(handleLongPress:), (IMP)&_logos_method$CanSaveMedia$IGFeedItemVideoView$handleLongPress$, _typeEncoding); }Class _logos_class$CanSaveMedia$IGTVFullscreenVideoCell = objc_getClass("IGTVFullscreenVideoCell"); { MSHookMessageEx(_logos_class$CanSaveMedia$IGTVFullscreenVideoCell, @selector(initWithFrame:), (IMP)&_logos_method$CanSaveMedia$IGTVFullscreenVideoCell$initWithFrame$, (IMP*)&_logos_orig$CanSaveMedia$IGTVFullscreenVideoCell$initWithFrame$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGTVFullscreenVideoCell, @selector(addHandleLongPress), (IMP)&_logos_method$CanSaveMedia$IGTVFullscreenVideoCell$addHandleLongPress, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer *), strlen(@encode(UILongPressGestureRecognizer *))); i += strlen(@encode(UILongPressGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGTVFullscreenVideoCell, @selector(handleLongPress:), (IMP)&_logos_method$CanSaveMedia$IGTVFullscreenVideoCell$handleLongPress$, _typeEncoding); }Class _logos_class$CanSaveMedia$IGStoryViewerContainerView = objc_getClass("IGStoryViewerContainerView"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIButton\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$CanSaveMedia$IGStoryViewerContainerView, "hDownloadButton", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIButton *)); class_addMethod(_logos_class$CanSaveMedia$IGStoryViewerContainerView, @selector(hDownloadButton), (IMP)&_logos_property$CanSaveMedia$IGStoryViewerContainerView$hDownloadButton, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIButton *)); class_addMethod(_logos_class$CanSaveMedia$IGStoryViewerContainerView, @selector(setHDownloadButton:), (IMP)&_logos_property$CanSaveMedia$IGStoryViewerContainerView$setHDownloadButton, _typeEncoding); } { MSHookMessageEx(_logos_class$CanSaveMedia$IGStoryViewerContainerView, @selector(initWithFrame:shouldCreateComposerBackgroundView:userSession:bloksContext:), (IMP)&_logos_method$CanSaveMedia$IGStoryViewerContainerView$initWithFrame$shouldCreateComposerBackgroundView$userSession$bloksContext$, (IMP*)&_logos_orig$CanSaveMedia$IGStoryViewerContainerView$initWithFrame$shouldCreateComposerBackgroundView$userSession$bloksContext$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton *), strlen(@encode(UIButton *))); i += strlen(@encode(UIButton *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGStoryViewerContainerView, @selector(hDownloadButtonPressed:), (IMP)&_logos_method$CanSaveMedia$IGStoryViewerContainerView$hDownloadButtonPressed$, _typeEncoding); }Class _logos_class$CanSaveMedia$IGSundialVideoPlaybackView = objc_getClass("IGSundialVideoPlaybackView"); { MSHookMessageEx(_logos_class$CanSaveMedia$IGSundialVideoPlaybackView, @selector(initWithFrame:), (IMP)&_logos_method$CanSaveMedia$IGSundialVideoPlaybackView$initWithFrame$, (IMP*)&_logos_orig$CanSaveMedia$IGSundialVideoPlaybackView$initWithFrame$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGSundialVideoPlaybackView, @selector(addHandleLongPress), (IMP)&_logos_method$CanSaveMedia$IGSundialVideoPlaybackView$addHandleLongPress, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer *), strlen(@encode(UILongPressGestureRecognizer *))); i += strlen(@encode(UILongPressGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveMedia$IGSundialVideoPlaybackView, @selector(handleLongPress:), (IMP)&_logos_method$CanSaveMedia$IGSundialVideoPlaybackView$handleLongPress$, _typeEncoding); }}
      }

      if (canSaveHDProfilePicture) {
        {Class _logos_class$CanSaveHDProfilePicture$IGProfilePictureImageView = objc_getClass("IGProfilePictureImageView"); { MSHookMessageEx(_logos_class$CanSaveHDProfilePicture$IGProfilePictureImageView, @selector(initWithFrame:imagePriority:placeholderImage:buttonDisabled:), (IMP)&_logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$buttonDisabled$, (IMP*)&_logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$buttonDisabled$);}{ MSHookMessageEx(_logos_class$CanSaveHDProfilePicture$IGProfilePictureImageView, @selector(initWithFrame:imagePriority:placeholderImage:), (IMP)&_logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$, (IMP*)&_logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$placeholderImage$);}{ MSHookMessageEx(_logos_class$CanSaveHDProfilePicture$IGProfilePictureImageView, @selector(initWithFrame:imagePriority:), (IMP)&_logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$, (IMP*)&_logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$imagePriority$);}{ MSHookMessageEx(_logos_class$CanSaveHDProfilePicture$IGProfilePictureImageView, @selector(initWithFrame:), (IMP)&_logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$, (IMP*)&_logos_orig$CanSaveHDProfilePicture$IGProfilePictureImageView$initWithFrame$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveHDProfilePicture$IGProfilePictureImageView, @selector(addHandleLongPress), (IMP)&_logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$addHandleLongPress, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer *), strlen(@encode(UILongPressGestureRecognizer *))); i += strlen(@encode(UILongPressGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveHDProfilePicture$IGProfilePictureImageView, @selector(handleLongPress:), (IMP)&_logos_method$CanSaveHDProfilePicture$IGProfilePictureImageView$handleLongPress$, _typeEncoding); }}
      }

      if (determineIfUserIsFollowingYou) {



        {Class _logos_class$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell = objc_getClass("IGProfileSimpleAvatarStatsCell"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UILabel\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell, "isFollowingYouLabel", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell, @selector(isFollowingYouLabel), (IMP)&_logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$isFollowingYouLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell, @selector(setIsFollowingYouLabel:), (IMP)&_logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$setIsFollowingYouLabel, _typeEncoding); } { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIView\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell, "isFollowingYouBadge", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIView *)); class_addMethod(_logos_class$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell, @selector(isFollowingYouBadge), (IMP)&_logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$isFollowingYouBadge, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIView *)); class_addMethod(_logos_class$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell, @selector(setIsFollowingYouBadge:), (IMP)&_logos_property$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$setIsFollowingYouBadge, _typeEncoding); } { MSHookMessageEx(_logos_class$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell, @selector(initWithFrame:), (IMP)&_logos_method$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$initWithFrame$, (IMP*)&_logos_orig$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$initWithFrame$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell, @selector(addIsFollowingYouBadgeView), (IMP)&_logos_method$DetermineIfUserIsFollowingYou$IGProfileSimpleAvatarStatsCell$addIsFollowingYouBadgeView, _typeEncoding); }} }  if (disableDirectMessageSeenReceipt) {



        {Class _logos_class$DisableDirectMessageSeenReceipt$IGDirectThreadViewListAdapterDataSource = objc_getClass("IGDirectThreadViewListAdapterDataSource"); { MSHookMessageEx(_logos_class$DisableDirectMessageSeenReceipt$IGDirectThreadViewListAdapterDataSource, @selector(shouldUpdateLastSeenMessage), (IMP)&_logos_method$DisableDirectMessageSeenReceipt$IGDirectThreadViewListAdapterDataSource$shouldUpdateLastSeenMessage, (IMP*)&_logos_orig$DisableDirectMessageSeenReceipt$IGDirectThreadViewListAdapterDataSource$shouldUpdateLastSeenMessage);}} }  if (disableStorySeenReceipt) {



        {Class _logos_class$DisableStorySeenReceipt$IGStoryViewerViewController = objc_getClass("IGStoryViewerViewController"); { MSHookMessageEx(_logos_class$DisableStorySeenReceipt$IGStoryViewerViewController, @selector(fullscreenSectionController:didMarkItemAsSeen:), (IMP)&_logos_method$DisableStorySeenReceipt$IGStoryViewerViewController$fullscreenSectionController$didMarkItemAsSeen$, (IMP*)&_logos_orig$DisableStorySeenReceipt$IGStoryViewerViewController$fullscreenSectionController$didMarkItemAsSeen$);}} }  if (unlimitedReplayDirectMessage) {



        {Class _logos_class$UnlimitedReplayDirectMessage$IGStoryPhotoView = objc_getClass("IGStoryPhotoView"); { MSHookMessageEx(_logos_class$UnlimitedReplayDirectMessage$IGStoryPhotoView, @selector(progressImageView:didLoadImage:loadSource:networkRequestSummary:), (IMP)&_logos_method$UnlimitedReplayDirectMessage$IGStoryPhotoView$progressImageView$didLoadImage$loadSource$networkRequestSummary$, (IMP*)&_logos_orig$UnlimitedReplayDirectMessage$IGStoryPhotoView$progressImageView$didLoadImage$loadSource$networkRequestSummary$);}} } } ];
}

static __attribute__((destructor)) void _logosLocalDtor_2d623409(int __unused argc, char __unused **argv, char __unused **envp) {
  [[NSNotificationCenter defaultCenter] removeObserver:observer];
}
