#line 1 "/Users/lovez/Desktop/AA/AA/app/facebook-no-ads/Tweak.xm"
#import "Tweak.h"




BOOL noads;
BOOL canSaveVideo;
BOOL canSaveStory;
BOOL canSaveOnlyMeProfilePicture;
BOOL disableStorySeen;
BOOL hideNewsFeedComposer;
BOOL hideNewsFeedStories;

static void reloadPrefs() {
  NSDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@PLIST_PATH] ?: [@{} mutableCopy];

  noads = [[settings objectForKey:@"noads"] ?: @(YES) boolValue];
  canSaveVideo = [[settings objectForKey:@"canSaveVideo"] ?: @(YES) boolValue];
  canSaveStory = [[settings objectForKey:@"canSaveStory"] ?: @(YES) boolValue];
  canSaveOnlyMeProfilePicture = [[settings objectForKey:@"canSaveOnlyMeProfilePicture"] ?: @(YES) boolValue];
  disableStorySeen = [[settings objectForKey:@"disableStorySeen"] ?: @(YES) boolValue];
  hideNewsFeedComposer = [[settings objectForKey:@"hideNewsFeedComposer"] ?: @(NO) boolValue];
  hideNewsFeedStories = [[settings objectForKey:@"hideNewsFeedStories"] ?: @(NO) boolValue];
}

static void showDownloadVideoAlert(NSURL *HDPlaybackURL, NSURL *SDPlaybackURL, UIViewController *viewController) {
  UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:IS_iPAD ? UIAlertControllerStyleAlert : UIAlertControllerStyleActionSheet];
  [alert addAction:[UIAlertAction actionWithTitle:@"Download Video - HD" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    NSURL *videoURL = HDPlaybackURL;
    if (!videoURL) {
      [HCommon showAlertMessage:@"This video doesn't have HD quality, please select other quality" withTitle:@"No HD quality" viewController:viewController];
      return;
    }
    NSString *videoURLString = videoURL.absoluteString;
    [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownload:videoURLString appendExtension:nil mediaType:Video toAlbum:@"Facebook" viewController:viewController];
  }]];
  [alert addAction:[UIAlertAction actionWithTitle:@"Download Video - SD" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    NSURL *videoURL = SDPlaybackURL;
    if (!videoURL) {
      [HCommon showAlertMessage:@"This video doesn't have SD quality, please select other quality" withTitle:@"No SD quality" viewController:viewController];
      return;
    }
    NSString *videoURLString = videoURL.absoluteString;
    [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownload:videoURLString appendExtension:nil mediaType:Video toAlbum:@"Facebook" viewController:viewController];
  }]];
  [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
  [viewController presentViewController:alert animated:YES completion:nil];
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

@class FBMemFeedStory; @class FBNewsFeedCollectionView; @class FBVideoChannelPlaylistItem; @class FBMemNewsFeedEdge; @class FBComponentCollectionViewDataSource; @class FBSnacksMediaContainerView; @class FBPhotoViewController; @class FBWebImageMemorySpecifier; @class FBSnacksBucketsSeenStateManager; @class FBSnacksPhotoView; @class VideoContainerView; @class FBWebImageNetworkSpecifier; @class FBNewsFeedViewControllerConfiguration; @class FBVideoOverlayPluginComponentBackgroundView; @class FBSnacksNewVideoView; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$FBWebImageMemorySpecifier(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("FBWebImageMemorySpecifier"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$FBSnacksNewVideoView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("FBSnacksNewVideoView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$VideoContainerView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("VideoContainerView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$FBWebImageNetworkSpecifier(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("FBWebImageNetworkSpecifier"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$FBSnacksPhotoView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("FBSnacksPhotoView"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$FBNewsFeedCollectionView(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("FBNewsFeedCollectionView"); } return _klass; }
#line 50 "/Users/lovez/Desktop/AA/AA/app/facebook-no-ads/Tweak.xm"
static FBMemNewsFeedEdge* (*_logos_orig$NoAds$FBMemNewsFeedEdge$initWithFBTree$)(_LOGOS_SELF_TYPE_INIT FBMemNewsFeedEdge*, SEL, void *) _LOGOS_RETURN_RETAINED; static FBMemNewsFeedEdge* _logos_method$NoAds$FBMemNewsFeedEdge$initWithFBTree$(_LOGOS_SELF_TYPE_INIT FBMemNewsFeedEdge*, SEL, void *) _LOGOS_RETURN_RETAINED; static FBMemFeedStory* (*_logos_orig$NoAds$FBMemFeedStory$initWithFBTree$)(_LOGOS_SELF_TYPE_INIT FBMemFeedStory*, SEL, void *) _LOGOS_RETURN_RETAINED; static FBMemFeedStory* _logos_method$NoAds$FBMemFeedStory$initWithFBTree$(_LOGOS_SELF_TYPE_INIT FBMemFeedStory*, SEL, void *) _LOGOS_RETURN_RETAINED; static id (*_logos_orig$NoAds$FBVideoChannelPlaylistItem$Bi$$$$$$$)(_LOGOS_SELF_TYPE_NORMAL FBVideoChannelPlaylistItem* _LOGOS_SELF_CONST, SEL, id, id, id, id, id, id, id); static id _logos_method$NoAds$FBVideoChannelPlaylistItem$Bi$$$$$$$(_LOGOS_SELF_TYPE_NORMAL FBVideoChannelPlaylistItem* _LOGOS_SELF_CONST, SEL, id, id, id, id, id, id, id); 
  
    static FBMemNewsFeedEdge* _logos_method$NoAds$FBMemNewsFeedEdge$initWithFBTree$(_LOGOS_SELF_TYPE_INIT FBMemNewsFeedEdge* __unused self, SEL __unused _cmd, void * arg1) _LOGOS_RETURN_RETAINED {
      id orig = _logos_orig$NoAds$FBMemNewsFeedEdge$initWithFBTree$(self, _cmd, arg1);
      id category = [orig category];
      return category ? [category isEqualToString:@"ORGANIC"] ? orig : nil : orig;
    }
  

  
    static FBMemFeedStory* _logos_method$NoAds$FBMemFeedStory$initWithFBTree$(_LOGOS_SELF_TYPE_INIT FBMemFeedStory* __unused self, SEL __unused _cmd, void * arg1) _LOGOS_RETURN_RETAINED {
      id orig = _logos_orig$NoAds$FBMemFeedStory$initWithFBTree$(self, _cmd, arg1);
      return [orig sponsoredData] == nil ? orig : nil;
    }
  

  
    static id _logos_method$NoAds$FBVideoChannelPlaylistItem$Bi$$$$$$$(_LOGOS_SELF_TYPE_NORMAL FBVideoChannelPlaylistItem* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3, id arg4, id arg5, id arg6, id arg7) {
      id orig = _logos_orig$NoAds$FBVideoChannelPlaylistItem$Bi$$$$$$$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
      return [orig isSponsored] ? nil : orig;
    }
  


static BOOL (*_logos_orig$HideNewsFeedComposer$FBNewsFeedViewControllerConfiguration$shouldHideComposer)(_LOGOS_SELF_TYPE_NORMAL FBNewsFeedViewControllerConfiguration* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$HideNewsFeedComposer$FBNewsFeedViewControllerConfiguration$shouldHideComposer(_LOGOS_SELF_TYPE_NORMAL FBNewsFeedViewControllerConfiguration* _LOGOS_SELF_CONST, SEL); 
  
    static BOOL _logos_method$HideNewsFeedComposer$FBNewsFeedViewControllerConfiguration$shouldHideComposer(_LOGOS_SELF_TYPE_NORMAL FBNewsFeedViewControllerConfiguration* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      return TRUE;
    }
  


static id (*_logos_orig$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$cellForItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL FBComponentCollectionViewDataSource* _LOGOS_SELF_CONST, SEL, id, NSIndexPath *); static id _logos_method$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$cellForItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL FBComponentCollectionViewDataSource* _LOGOS_SELF_CONST, SEL, id, NSIndexPath *); static CGSize (*_logos_orig$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$layout$sizeForItemAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL FBComponentCollectionViewDataSource* _LOGOS_SELF_CONST, SEL, id, id, NSIndexPath *); static CGSize _logos_method$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$layout$sizeForItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL FBComponentCollectionViewDataSource* _LOGOS_SELF_CONST, SEL, id, id, NSIndexPath *); static BOOL _logos_method$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$shouldHideSectionNumber$(_LOGOS_SELF_TYPE_NORMAL FBComponentCollectionViewDataSource* _LOGOS_SELF_CONST, SEL, int); 
  
    static id _logos_method$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$cellForItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL FBComponentCollectionViewDataSource* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, NSIndexPath * arg2) {
      id orig = _logos_orig$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$cellForItemAtIndexPath$(self, _cmd, arg1, arg2);
      if (![arg1 isKindOfClass:_logos_static_class_lookup$FBNewsFeedCollectionView()]) {
        return orig;
      }

      if ([self shouldHideSectionNumber:arg2.section]) {
        [orig setHidden: YES];
      } else {
        [orig setHidden: NO];
      }
      return orig;
    }

    static CGSize _logos_method$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$layout$sizeForItemAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL FBComponentCollectionViewDataSource* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, NSIndexPath * arg3) {
      CGSize orig = _logos_orig$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$layout$sizeForItemAtIndexPath$(self, _cmd, arg1, arg2, arg3);
      if (![arg1 isKindOfClass:_logos_static_class_lookup$FBNewsFeedCollectionView()]) {
        return orig;
      }

      if ([self shouldHideSectionNumber:arg3.section]) {
        orig.height = 1;
        orig.width = 1;
      }
      return orig;
    }

    
    static BOOL _logos_method$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$shouldHideSectionNumber$(_LOGOS_SELF_TYPE_NORMAL FBComponentCollectionViewDataSource* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int sectionNumber) {
      if (hideNewsFeedComposer) {
        if (([self dataSourceState].sections.count == 3 && sectionNumber == 0) || ([self dataSourceState].sections.count == 4 && (sectionNumber == 0 || sectionNumber == 1))) {
          return TRUE;
        }
      } else {
        if (([self dataSourceState].sections.count == 4 && sectionNumber == 1) || ([self dataSourceState].sections.count == 5 && (sectionNumber == 1 || sectionNumber == 2))) {
          return TRUE;
        }
      }
      return FALSE;
    }
  


static id (*_logos_orig$CanSaveVideo$VideoContainerView$syc$$)(_LOGOS_SELF_TYPE_NORMAL VideoContainerView* _LOGOS_SELF_CONST, SEL, CGRect, id); static id _logos_method$CanSaveVideo$VideoContainerView$syc$$(_LOGOS_SELF_TYPE_NORMAL VideoContainerView* _LOGOS_SELF_CONST, SEL, CGRect, id); static id (*_logos_orig$CanSaveVideo$VideoContainerView$nyc$$)(_LOGOS_SELF_TYPE_NORMAL VideoContainerView* _LOGOS_SELF_CONST, SEL, CGRect, id); static id _logos_method$CanSaveVideo$VideoContainerView$nyc$$(_LOGOS_SELF_TYPE_NORMAL VideoContainerView* _LOGOS_SELF_CONST, SEL, CGRect, id); static void _logos_method$CanSaveVideo$VideoContainerView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL VideoContainerView* _LOGOS_SELF_CONST, SEL); static void _logos_method$CanSaveVideo$VideoContainerView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL VideoContainerView* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer *); static FBVideoOverlayPluginComponentBackgroundView* (*_logos_orig$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT FBVideoOverlayPluginComponentBackgroundView*, SEL, struct CGRect) _LOGOS_RETURN_RETAINED; static FBVideoOverlayPluginComponentBackgroundView* _logos_method$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$initWithFrame$(_LOGOS_SELF_TYPE_INIT FBVideoOverlayPluginComponentBackgroundView*, SEL, struct CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL FBVideoOverlayPluginComponentBackgroundView* _LOGOS_SELF_CONST, SEL); static void _logos_method$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL FBVideoOverlayPluginComponentBackgroundView* _LOGOS_SELF_CONST, SEL, UILongPressGestureRecognizer *); 
  
    static id _logos_method$CanSaveVideo$VideoContainerView$syc$$(_LOGOS_SELF_TYPE_NORMAL VideoContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1, id arg2) {
      id orig = _logos_orig$CanSaveVideo$VideoContainerView$syc$$(self, _cmd, arg1, arg2);
      [orig addHandleLongPress];
      return orig;
    }

    static id _logos_method$CanSaveVideo$VideoContainerView$nyc$$(_LOGOS_SELF_TYPE_NORMAL VideoContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect arg1, id arg2) {
      id orig = _logos_orig$CanSaveVideo$VideoContainerView$nyc$$(self, _cmd, arg1, arg2);
      [orig addHandleLongPress];
      return orig;
    }

    
    static void _logos_method$CanSaveVideo$VideoContainerView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL VideoContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
      longPress.minimumPressDuration = 0.5;
      [self addGestureRecognizer:longPress];
    }

    
    static void _logos_method$CanSaveVideo$VideoContainerView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL VideoContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer * sender) {
      if (sender.state == UIGestureRecognizerStateBegan) {
        FBVideoPlaybackItem *videoPlaybackItem = [self.controller currentVideoPlaybackItem];
        if (!videoPlaybackItem) {
          [HCommon showAlertMessage:@"Can't find Video source, please report to developer" withTitle:@"Error" viewController:nil];
          return;
        }

        showDownloadVideoAlert(videoPlaybackItem.HDPlaybackURL, videoPlaybackItem.SDPlaybackURL, [self reactViewController]);
      }
    }
  

  
    static FBVideoOverlayPluginComponentBackgroundView* _logos_method$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$initWithFrame$(_LOGOS_SELF_TYPE_INIT FBVideoOverlayPluginComponentBackgroundView* __unused self, SEL __unused _cmd, struct CGRect arg1) _LOGOS_RETURN_RETAINED {
      id orig = _logos_orig$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$initWithFrame$(self, _cmd, arg1);
      [orig addHandleLongPress];
      return orig;
    }

    
    static void _logos_method$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$addHandleLongPress(_LOGOS_SELF_TYPE_NORMAL FBVideoOverlayPluginComponentBackgroundView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
      UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
      longPress.minimumPressDuration = 0.5;
      [self addGestureRecognizer:longPress];
    }

    
    static void _logos_method$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$handleLongPress$(_LOGOS_SELF_TYPE_NORMAL FBVideoOverlayPluginComponentBackgroundView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UILongPressGestureRecognizer * sender) {
      if (sender.state == UIGestureRecognizerStateBegan) {
        UIView *view = self.superview.superview.superview.superview;
        if (![view isKindOfClass:_logos_static_class_lookup$VideoContainerView()]) {
          @try {
            view = self.superview.subviews[1].subviews[0].subviews[0];
          } @catch (NSException *exception) { }
        }
        if (![view isKindOfClass:_logos_static_class_lookup$VideoContainerView()]) {
          @try {
            view = self.superview.subviews[2].subviews[0].subviews[0];
          } @catch (NSException *exception) { }
        }
        if (![view isKindOfClass:_logos_static_class_lookup$VideoContainerView()]) {
          @try {
            view = self.superview.subviews[3].subviews[0].subviews[0];
          } @catch (NSException *exception) { }
        }
        if (![view isKindOfClass:_logos_static_class_lookup$VideoContainerView()]) {
          [HCommon showAlertMessage:@"Can't find Video container, please report to developer" withTitle:@"Error" viewController:nil];
          return;
        }
        VideoContainerView *videoContainerView = (VideoContainerView *)view;
        FBVideoPlaybackItem *videoPlaybackItem = [videoContainerView.controller currentVideoPlaybackItem];
        if (!videoPlaybackItem) {
          [HCommon showAlertMessage:@"Can't find Video source, please report to developer" withTitle:@"Error" viewController:nil];
          return;
        }

        showDownloadVideoAlert(videoPlaybackItem.HDPlaybackURL, videoPlaybackItem.SDPlaybackURL, [self reactViewController]);
      }
    }
  


static FBSnacksMediaContainerView* (*_logos_orig$CanSaveStory$FBSnacksMediaContainerView$initWithThread$bucket$mediaViewDelegate$mediaViewGenerator$toolbox$)(_LOGOS_SELF_TYPE_INIT FBSnacksMediaContainerView*, SEL, id, id, id, id *, id) _LOGOS_RETURN_RETAINED; static FBSnacksMediaContainerView* _logos_method$CanSaveStory$FBSnacksMediaContainerView$initWithThread$bucket$mediaViewDelegate$mediaViewGenerator$toolbox$(_LOGOS_SELF_TYPE_INIT FBSnacksMediaContainerView*, SEL, id, id, id, id *, id) _LOGOS_RETURN_RETAINED; static void _logos_method$CanSaveStory$FBSnacksMediaContainerView$hDownloadButtonPressed$(_LOGOS_SELF_TYPE_NORMAL FBSnacksMediaContainerView* _LOGOS_SELF_CONST, SEL, UIButton *); 
  
    __attribute__((used)) static UIButton * _logos_property$CanSaveStory$FBSnacksMediaContainerView$hDownloadButton(FBSnacksMediaContainerView * __unused self, SEL __unused _cmd) { return (UIButton *)objc_getAssociatedObject(self, (void *)_logos_property$CanSaveStory$FBSnacksMediaContainerView$hDownloadButton); }; __attribute__((used)) static void _logos_property$CanSaveStory$FBSnacksMediaContainerView$setHDownloadButton(FBSnacksMediaContainerView * __unused self, SEL __unused _cmd, UIButton * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$CanSaveStory$FBSnacksMediaContainerView$hDownloadButton, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
    static FBSnacksMediaContainerView* _logos_method$CanSaveStory$FBSnacksMediaContainerView$initWithThread$bucket$mediaViewDelegate$mediaViewGenerator$toolbox$(_LOGOS_SELF_TYPE_INIT FBSnacksMediaContainerView* __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3, id * arg4, id arg5) _LOGOS_RETURN_RETAINED {
      self = _logos_orig$CanSaveStory$FBSnacksMediaContainerView$initWithThread$bucket$mediaViewDelegate$mediaViewGenerator$toolbox$(self, _cmd, arg1, arg2, arg3, arg4, arg5);

      self.hDownloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [self.hDownloadButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
      [self.hDownloadButton addTarget:self action:@selector(hDownloadButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
      [self.hDownloadButton setBackgroundImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/facebooknoads/download.png"] forState:UIControlStateNormal];
      self.hDownloadButton.frame = IS_iPAD ? CGRectMake([[UIApplication sharedApplication] keyWindow].frame.size.width / 2 + 60, [[UIApplication sharedApplication] keyWindow].frame.size.height - 140.0, 24.0, 24.0) : CGRectMake([[UIApplication sharedApplication] keyWindow].frame.size.width - 40, [[UIApplication sharedApplication] keyWindow].frame.size.height - ([HCommon isNotch] ? 190.0 : 90.0), 24.0, 24.0);
      [self addSubview:self.hDownloadButton];
      return self;
    }

    
    static void _logos_method$CanSaveStory$FBSnacksMediaContainerView$hDownloadButtonPressed$(_LOGOS_SELF_TYPE_NORMAL FBSnacksMediaContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton * sender) {
      if ([self.mediaView isKindOfClass:_logos_static_class_lookup$FBSnacksPhotoView()]) {
        @try {
          FBSnacksWebPhotoView *_snacksWebPhotoView = MSHookIvar<FBSnacksWebPhotoView *>(self.mediaView, "_photoView");
          FBWebPhotoView *_photoView = MSHookIvar<FBWebPhotoView *>(_snacksWebPhotoView, "_photoView");
          id imageSpecifier = _photoView.imageSpecifier;
          if ([imageSpecifier isKindOfClass:_logos_static_class_lookup$FBWebImageNetworkSpecifier()]) {
            NSURL *url = ((FBWebImageNetworkSpecifier *)imageSpecifier).allInfoURLsSortedByDescImageFlag[0];
            [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownloadURL:url appendExtension:nil mediaType:Image toAlbum:@"Facebook" view:self];
          }
          else if ([imageSpecifier isKindOfClass:_logos_static_class_lookup$FBWebImageMemorySpecifier()]) {
            UIImageWriteToSavedPhotosAlbum(((FBWebImageMemorySpecifier *)imageSpecifier).image, nil, nil, nil);
            [HCommon showToastMessage:@"" withTitle:@"Done!" timeout:0.5 viewController:nil];
          }
        } @catch(NSException *exception) {
          [HCommon showAlertMessage:exception.reason withTitle:@"Error" viewController:nil];
        }
      } else if ([self.mediaView isKindOfClass:_logos_static_class_lookup$FBSnacksNewVideoView()]) {
        FBVideoPlaybackItem *videoPlaybackItem = [((FBSnacksNewVideoView *)self.mediaView).manager currentVideoPlaybackItem];
        showDownloadVideoAlert(videoPlaybackItem.HDPlaybackURL, videoPlaybackItem.SDPlaybackURL, [self reactViewController]);
      } else {
        [HCommon showAlertMessage:@"This story has no media to download. Seems like it's a bug. Please report to the developer" withTitle:@"Error" viewController:nil];
      }
    }
  


static void (*_logos_orig$CanSaveOnlyMeProfilePicture$FBPhotoViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL FBPhotoViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$CanSaveOnlyMeProfilePicture$FBPhotoViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL FBPhotoViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$CanSaveOnlyMeProfilePicture$FBPhotoViewController$hDownloadButtonPressed$(_LOGOS_SELF_TYPE_NORMAL FBPhotoViewController* _LOGOS_SELF_CONST, SEL, UIButton *); 
  
    __attribute__((used)) static UIButton * _logos_property$CanSaveOnlyMeProfilePicture$FBPhotoViewController$hDownloadButton(FBPhotoViewController * __unused self, SEL __unused _cmd) { return (UIButton *)objc_getAssociatedObject(self, (void *)_logos_property$CanSaveOnlyMeProfilePicture$FBPhotoViewController$hDownloadButton); }; __attribute__((used)) static void _logos_property$CanSaveOnlyMeProfilePicture$FBPhotoViewController$setHDownloadButton(FBPhotoViewController * __unused self, SEL __unused _cmd, UIButton * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$CanSaveOnlyMeProfilePicture$FBPhotoViewController$hDownloadButton, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
    static void _logos_method$CanSaveOnlyMeProfilePicture$FBPhotoViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL FBPhotoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
      _logos_orig$CanSaveOnlyMeProfilePicture$FBPhotoViewController$viewDidAppear$(self, _cmd, arg1);

      NSUInteger _actionSheetOptions = MSHookIvar<NSUInteger>(self, "_actionSheetOptions");
      if (_actionSheetOptions != 0 || (self.hDownloadButton && [self.hDownloadButton isDescendantOfView:self.view])) {
        return;
      }

      self.hDownloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
      [self.hDownloadButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
      [self.hDownloadButton addTarget:self action:@selector(hDownloadButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
      [self.hDownloadButton setBackgroundImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/facebooknoads/download.png"] forState:UIControlStateNormal];
      self.hDownloadButton.frame = CGRectMake([[UIApplication sharedApplication] keyWindow].frame.size.width - 40, [[UIApplication sharedApplication] keyWindow].frame.size.height - ([HCommon isNotch] ? 190.0 : 90.0), 24.0, 24.0);
      [self.view addSubview:self.hDownloadButton];
    }

    
    static void _logos_method$CanSaveOnlyMeProfilePicture$FBPhotoViewController$hDownloadButtonPressed$(_LOGOS_SELF_TYPE_NORMAL FBPhotoViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton * sender) {
      UIImageWriteToSavedPhotosAlbum(self.displayedImage, nil, nil, nil);
      [HCommon showToastMessage:@"" withTitle:@"Done!" timeout:0.5 viewController:nil];
    }
  


static void (*_logos_orig$DisableStorySeen$FBSnacksBucketsSeenStateManager$_sendSeenThreadIDsWithBucket$session$)(_LOGOS_SELF_TYPE_NORMAL FBSnacksBucketsSeenStateManager* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$DisableStorySeen$FBSnacksBucketsSeenStateManager$_sendSeenThreadIDsWithBucket$session$(_LOGOS_SELF_TYPE_NORMAL FBSnacksBucketsSeenStateManager* _LOGOS_SELF_CONST, SEL, id, id); 
  
    static void _logos_method$DisableStorySeen$FBSnacksBucketsSeenStateManager$_sendSeenThreadIDsWithBucket$session$(_LOGOS_SELF_TYPE_NORMAL FBSnacksBucketsSeenStateManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
    }
  


static __attribute__((constructor)) void _logosLocalCtor_cdf9af0b(int __unused argc, char __unused **argv, char __unused **envp) {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) reloadPrefs, CFSTR(PREF_CHANGED_NOTIF), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
  reloadPrefs();

  dlopen([[[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"Frameworks/FBSharedDynamicFramework.framework/FBSharedDynamicFramework"] UTF8String], RTLD_NOW);
  

  if (noads) {
    {Class _logos_class$NoAds$FBMemNewsFeedEdge = objc_getClass("FBMemNewsFeedEdge"); { MSHookMessageEx(_logos_class$NoAds$FBMemNewsFeedEdge, @selector(initWithFBTree:), (IMP)&_logos_method$NoAds$FBMemNewsFeedEdge$initWithFBTree$, (IMP*)&_logos_orig$NoAds$FBMemNewsFeedEdge$initWithFBTree$);}Class _logos_class$NoAds$FBMemFeedStory = objc_getClass("FBMemFeedStory"); { MSHookMessageEx(_logos_class$NoAds$FBMemFeedStory, @selector(initWithFBTree:), (IMP)&_logos_method$NoAds$FBMemFeedStory$initWithFBTree$, (IMP*)&_logos_orig$NoAds$FBMemFeedStory$initWithFBTree$);}Class _logos_class$NoAds$FBVideoChannelPlaylistItem = objc_getClass("FBVideoChannelPlaylistItem"); { MSHookMessageEx(_logos_class$NoAds$FBVideoChannelPlaylistItem, @selector(Bi:::::::), (IMP)&_logos_method$NoAds$FBVideoChannelPlaylistItem$Bi$$$$$$$, (IMP*)&_logos_orig$NoAds$FBVideoChannelPlaylistItem$Bi$$$$$$$);}}
  }

  if (canSaveVideo) {
    {Class _logos_class$CanSaveVideo$VideoContainerView = objc_getClass("VideoContainerView"); { MSHookMessageEx(_logos_class$CanSaveVideo$VideoContainerView, @selector(syc::), (IMP)&_logos_method$CanSaveVideo$VideoContainerView$syc$$, (IMP*)&_logos_orig$CanSaveVideo$VideoContainerView$syc$$);}{ MSHookMessageEx(_logos_class$CanSaveVideo$VideoContainerView, @selector(nyc::), (IMP)&_logos_method$CanSaveVideo$VideoContainerView$nyc$$, (IMP*)&_logos_orig$CanSaveVideo$VideoContainerView$nyc$$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveVideo$VideoContainerView, @selector(addHandleLongPress), (IMP)&_logos_method$CanSaveVideo$VideoContainerView$addHandleLongPress, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer *), strlen(@encode(UILongPressGestureRecognizer *))); i += strlen(@encode(UILongPressGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveVideo$VideoContainerView, @selector(handleLongPress:), (IMP)&_logos_method$CanSaveVideo$VideoContainerView$handleLongPress$, _typeEncoding); }Class _logos_class$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView = objc_getClass("FBVideoOverlayPluginComponentBackgroundView"); { MSHookMessageEx(_logos_class$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView, @selector(initWithFrame:), (IMP)&_logos_method$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$initWithFrame$, (IMP*)&_logos_orig$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$initWithFrame$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView, @selector(addHandleLongPress), (IMP)&_logos_method$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$addHandleLongPress, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UILongPressGestureRecognizer *), strlen(@encode(UILongPressGestureRecognizer *))); i += strlen(@encode(UILongPressGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView, @selector(handleLongPress:), (IMP)&_logos_method$CanSaveVideo$FBVideoOverlayPluginComponentBackgroundView$handleLongPress$, _typeEncoding); }}
  }

  if (canSaveStory) {
    {Class _logos_class$CanSaveStory$FBSnacksMediaContainerView = objc_getClass("FBSnacksMediaContainerView"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIButton\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$CanSaveStory$FBSnacksMediaContainerView, "hDownloadButton", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIButton *)); class_addMethod(_logos_class$CanSaveStory$FBSnacksMediaContainerView, @selector(hDownloadButton), (IMP)&_logos_property$CanSaveStory$FBSnacksMediaContainerView$hDownloadButton, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIButton *)); class_addMethod(_logos_class$CanSaveStory$FBSnacksMediaContainerView, @selector(setHDownloadButton:), (IMP)&_logos_property$CanSaveStory$FBSnacksMediaContainerView$setHDownloadButton, _typeEncoding); } { MSHookMessageEx(_logos_class$CanSaveStory$FBSnacksMediaContainerView, @selector(initWithThread:bucket:mediaViewDelegate:mediaViewGenerator:toolbox:), (IMP)&_logos_method$CanSaveStory$FBSnacksMediaContainerView$initWithThread$bucket$mediaViewDelegate$mediaViewGenerator$toolbox$, (IMP*)&_logos_orig$CanSaveStory$FBSnacksMediaContainerView$initWithThread$bucket$mediaViewDelegate$mediaViewGenerator$toolbox$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton *), strlen(@encode(UIButton *))); i += strlen(@encode(UIButton *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveStory$FBSnacksMediaContainerView, @selector(hDownloadButtonPressed:), (IMP)&_logos_method$CanSaveStory$FBSnacksMediaContainerView$hDownloadButtonPressed$, _typeEncoding); }}
  }

  if (canSaveOnlyMeProfilePicture) {
    {Class _logos_class$CanSaveOnlyMeProfilePicture$FBPhotoViewController = objc_getClass("FBPhotoViewController"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIButton\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$CanSaveOnlyMeProfilePicture$FBPhotoViewController, "hDownloadButton", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIButton *)); class_addMethod(_logos_class$CanSaveOnlyMeProfilePicture$FBPhotoViewController, @selector(hDownloadButton), (IMP)&_logos_property$CanSaveOnlyMeProfilePicture$FBPhotoViewController$hDownloadButton, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIButton *)); class_addMethod(_logos_class$CanSaveOnlyMeProfilePicture$FBPhotoViewController, @selector(setHDownloadButton:), (IMP)&_logos_property$CanSaveOnlyMeProfilePicture$FBPhotoViewController$setHDownloadButton, _typeEncoding); } { MSHookMessageEx(_logos_class$CanSaveOnlyMeProfilePicture$FBPhotoViewController, @selector(viewDidAppear:), (IMP)&_logos_method$CanSaveOnlyMeProfilePicture$FBPhotoViewController$viewDidAppear$, (IMP*)&_logos_orig$CanSaveOnlyMeProfilePicture$FBPhotoViewController$viewDidAppear$);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton *), strlen(@encode(UIButton *))); i += strlen(@encode(UIButton *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CanSaveOnlyMeProfilePicture$FBPhotoViewController, @selector(hDownloadButtonPressed:), (IMP)&_logos_method$CanSaveOnlyMeProfilePicture$FBPhotoViewController$hDownloadButtonPressed$, _typeEncoding); }}
  }

  if (disableStorySeen) {
    {Class _logos_class$DisableStorySeen$FBSnacksBucketsSeenStateManager = objc_getClass("FBSnacksBucketsSeenStateManager"); { MSHookMessageEx(_logos_class$DisableStorySeen$FBSnacksBucketsSeenStateManager, @selector(_sendSeenThreadIDsWithBucket:session:), (IMP)&_logos_method$DisableStorySeen$FBSnacksBucketsSeenStateManager$_sendSeenThreadIDsWithBucket$session$, (IMP*)&_logos_orig$DisableStorySeen$FBSnacksBucketsSeenStateManager$_sendSeenThreadIDsWithBucket$session$);}}
  }

  if (hideNewsFeedComposer) {
    {Class _logos_class$HideNewsFeedComposer$FBNewsFeedViewControllerConfiguration = objc_getClass("FBNewsFeedViewControllerConfiguration"); { MSHookMessageEx(_logos_class$HideNewsFeedComposer$FBNewsFeedViewControllerConfiguration, @selector(shouldHideComposer), (IMP)&_logos_method$HideNewsFeedComposer$FBNewsFeedViewControllerConfiguration$shouldHideComposer, (IMP*)&_logos_orig$HideNewsFeedComposer$FBNewsFeedViewControllerConfiguration$shouldHideComposer);}}
  }

  if (hideNewsFeedStories) {
    {Class _logos_class$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource = objc_getClass("FBComponentCollectionViewDataSource"); { MSHookMessageEx(_logos_class$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource, @selector(collectionView:cellForItemAtIndexPath:), (IMP)&_logos_method$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$cellForItemAtIndexPath$, (IMP*)&_logos_orig$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$cellForItemAtIndexPath$);}{ MSHookMessageEx(_logos_class$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource, @selector(collectionView:layout:sizeForItemAtIndexPath:), (IMP)&_logos_method$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$layout$sizeForItemAtIndexPath$, (IMP*)&_logos_orig$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$collectionView$layout$sizeForItemAtIndexPath$);}{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(BOOL), strlen(@encode(BOOL))); i += strlen(@encode(BOOL)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = 'i'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource, @selector(shouldHideSectionNumber:), (IMP)&_logos_method$HideNewsFeedChatRoomStories$FBComponentCollectionViewDataSource$shouldHideSectionNumber$, _typeEncoding); }}
  }
}

