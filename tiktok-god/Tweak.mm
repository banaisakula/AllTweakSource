#line 1 "/Users/lovez/Desktop/AA/AA/app/tiktok-god/Tweak.xm"




#include "Tweak.h"

BOOL noads;
BOOL downloadWithoutWatermark;
BOOL autoPlayNextVideo;
BOOL changeRegion;
BOOL showProgressBar;
BOOL canHideUI;
BOOL enableFavoritesCollections;
NSDictionary *region;

static void reloadPrefs() {
    NSDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@PLIST_PATH] ?: [@{} mutableCopy];

    noads = [[settings objectForKey:@"noads"] ?: @(YES) boolValue];
    downloadWithoutWatermark = [[settings objectForKey:@"downloadWithoutWatermark"] ?: @(YES) boolValue];
    autoPlayNextVideo = [[settings objectForKey:@"autoPlayNextVideo"] ?: @(NO) boolValue];
    changeRegion = [[settings objectForKey:@"changeRegion"] ?: @(NO) boolValue];
    region = [settings objectForKey:@"region"] ?: [@{} mutableCopy];
    showProgressBar = [[settings objectForKey:@"showProgressBar"] ?: @(NO) boolValue];
    enableFavoritesCollections = [[settings objectForKey:@"enableFavoritesCollections"] ?: @(NO) boolValue];
    canHideUI = [[settings objectForKey:@"canHideUI"] ?: @(YES) boolValue];
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

@class AWEFeedTableViewController; @class AWEFeedCellViewController; @class AWEPlayVideoPlayerController; @class AWEFavoriteAwemeViewController; @class AWEFeedContainerViewController; @class AWEAwemeModel; @class AWEPlayInteractionViewController; @class TTKFavoriteAwemeCollectionsViewController; @class CTCarrier; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$TTKFavoriteAwemeCollectionsViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("TTKFavoriteAwemeCollectionsViewController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$AWEFeedTableViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("AWEFeedTableViewController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$AWEFeedContainerViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("AWEFeedContainerViewController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$AWEFeedCellViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("AWEFeedCellViewController"); } return _klass; }
#line 29 "/Users/lovez/Desktop/AA/AA/app/tiktok-god/Tweak.xm"
static AWEAwemeModel* (*_logos_orig$CoreLogic$AWEAwemeModel$initWithDictionary$error$)(_LOGOS_SELF_TYPE_INIT AWEAwemeModel*, SEL, id, id *) _LOGOS_RETURN_RETAINED; static AWEAwemeModel* _logos_method$CoreLogic$AWEAwemeModel$initWithDictionary$error$(_LOGOS_SELF_TYPE_INIT AWEAwemeModel*, SEL, id, id *) _LOGOS_RETURN_RETAINED; static AWEAwemeModel* (*_logos_orig$CoreLogic$AWEAwemeModel$init)(_LOGOS_SELF_TYPE_INIT AWEAwemeModel*, SEL) _LOGOS_RETURN_RETAINED; static AWEAwemeModel* _logos_method$CoreLogic$AWEAwemeModel$init(_LOGOS_SELF_TYPE_INIT AWEAwemeModel*, SEL) _LOGOS_RETURN_RETAINED; static BOOL (*_logos_orig$CoreLogic$AWEAwemeModel$progressBarDraggable)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$CoreLogic$AWEAwemeModel$progressBarDraggable(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$CoreLogic$AWEAwemeModel$progressBarVisible)(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$CoreLogic$AWEAwemeModel$progressBarVisible(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$CoreLogic$CTCarrier$mobileCountryCode)(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$CoreLogic$CTCarrier$mobileCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$CoreLogic$CTCarrier$isoCountryCode)(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$CoreLogic$CTCarrier$isoCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$CoreLogic$CTCarrier$mobileNetworkCode)(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$CoreLogic$CTCarrier$mobileNetworkCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$)(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoPlayerController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoPlayerController* _LOGOS_SELF_CONST, SEL, id); static AWEFeedContainerViewController* (*_logos_orig$CoreLogic$AWEFeedContainerViewController$init)(_LOGOS_SELF_TYPE_INIT AWEFeedContainerViewController*, SEL) _LOGOS_RETURN_RETAINED; static AWEFeedContainerViewController* _logos_method$CoreLogic$AWEFeedContainerViewController$init(_LOGOS_SELF_TYPE_INIT AWEFeedContainerViewController*, SEL) _LOGOS_RETURN_RETAINED; static AWEFeedContainerViewController * _logos_meta_method$CoreLogic$AWEFeedContainerViewController$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$CoreLogic$AWEPlayInteractionViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CoreLogic$AWEPlayInteractionViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation)(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$CoreLogic$AWEPlayInteractionViewController$hideUIButtonPressed$(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST, SEL, UIButton *); static void _logos_method$CoreLogic$AWEPlayInteractionViewController$downloadButtonPressed$(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST, SEL, UIButton *); static void _logos_method$CoreLogic$AWEPlayInteractionViewController$updateShowOrHideUI(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST, SEL); static AWEFavoriteAwemeViewController* (*_logos_orig$CoreLogic$AWEFavoriteAwemeViewController$init)(_LOGOS_SELF_TYPE_INIT AWEFavoriteAwemeViewController*, SEL) _LOGOS_RETURN_RETAINED; static AWEFavoriteAwemeViewController* _logos_method$CoreLogic$AWEFavoriteAwemeViewController$init(_LOGOS_SELF_TYPE_INIT AWEFavoriteAwemeViewController*, SEL) _LOGOS_RETURN_RETAINED; 

static AWEAwemeModel* _logos_method$CoreLogic$AWEAwemeModel$initWithDictionary$error$(_LOGOS_SELF_TYPE_INIT AWEAwemeModel* __unused self, SEL __unused _cmd, id arg1, id * arg2) _LOGOS_RETURN_RETAINED {
    id orig = _logos_orig$CoreLogic$AWEAwemeModel$initWithDictionary$error$(self, _cmd, arg1, arg2);
    return noads && self.isAds ? nil : orig;
}

static AWEAwemeModel* _logos_method$CoreLogic$AWEAwemeModel$init(_LOGOS_SELF_TYPE_INIT AWEAwemeModel* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    id orig = _logos_orig$CoreLogic$AWEAwemeModel$init(self, _cmd);
    return noads && self.isAds ? nil : orig;
}

static BOOL _logos_method$CoreLogic$AWEAwemeModel$progressBarDraggable(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return showProgressBar || _logos_orig$CoreLogic$AWEAwemeModel$progressBarDraggable(self, _cmd);
}
static BOOL _logos_method$CoreLogic$AWEAwemeModel$progressBarVisible(_LOGOS_SELF_TYPE_NORMAL AWEAwemeModel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return showProgressBar || _logos_orig$CoreLogic$AWEAwemeModel$progressBarVisible(self, _cmd);
}





static NSString * _logos_method$CoreLogic$CTCarrier$mobileCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return (changeRegion && region[@"mcc"] != nil) ? region[@"mcc"] : _logos_orig$CoreLogic$CTCarrier$mobileCountryCode(self, _cmd);
}

static NSString * _logos_method$CoreLogic$CTCarrier$isoCountryCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return (changeRegion && region[@"code"] != nil) ? region[@"code"] : _logos_orig$CoreLogic$CTCarrier$isoCountryCode(self, _cmd);
}

static NSString * _logos_method$CoreLogic$CTCarrier$mobileNetworkCode(_LOGOS_SELF_TYPE_NORMAL CTCarrier* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return (changeRegion && region[@"mnc"] != nil) ? region[@"mnc"] : _logos_orig$CoreLogic$CTCarrier$mobileNetworkCode(self, _cmd);
}



static void _logos_method$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$(_LOGOS_SELF_TYPE_NORMAL AWEPlayVideoPlayerController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    if (autoPlayNextVideo) {
        if ([self.container.parentViewController isKindOfClass:_logos_static_class_lookup$AWEFeedTableViewController()]) {
            [((AWEFeedTableViewController *)self.container.parentViewController) scrollToNextVideo];
            return;
        }
    }
    _logos_orig$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$(self, _cmd, arg1);
}



static AWEFeedContainerViewController *__weak sharedInstance;
__attribute__((used)) static BOOL _logos_property$CoreLogic$AWEFeedContainerViewController$isUIHidden(AWEFeedContainerViewController * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_property$CoreLogic$AWEFeedContainerViewController$isUIHidden); BOOL rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_property$CoreLogic$AWEFeedContainerViewController$setIsUIHidden(AWEFeedContainerViewController * __unused self, SEL __unused _cmd, BOOL rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(BOOL)]; objc_setAssociatedObject(self, (void *)_logos_property$CoreLogic$AWEFeedContainerViewController$isUIHidden, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static AWEFeedContainerViewController* _logos_method$CoreLogic$AWEFeedContainerViewController$init(_LOGOS_SELF_TYPE_INIT AWEFeedContainerViewController* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    id orig = _logos_orig$CoreLogic$AWEFeedContainerViewController$init(self, _cmd);
    self.isUIHidden = NO;
    sharedInstance = orig;
    return orig;
}


static AWEFeedContainerViewController * _logos_meta_method$CoreLogic$AWEFeedContainerViewController$sharedInstance(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return sharedInstance;
}



__attribute__((used)) static UIButton * _logos_property$CoreLogic$AWEPlayInteractionViewController$hideUIButton(AWEPlayInteractionViewController * __unused self, SEL __unused _cmd) { return (UIButton *)objc_getAssociatedObject(self, (void *)_logos_property$CoreLogic$AWEPlayInteractionViewController$hideUIButton); }; __attribute__((used)) static void _logos_property$CoreLogic$AWEPlayInteractionViewController$setHideUIButton(AWEPlayInteractionViewController * __unused self, SEL __unused _cmd, UIButton * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$CoreLogic$AWEPlayInteractionViewController$hideUIButton, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIButton * _logos_property$CoreLogic$AWEPlayInteractionViewController$downloadButton(AWEPlayInteractionViewController * __unused self, SEL __unused _cmd) { return (UIButton *)objc_getAssociatedObject(self, (void *)_logos_property$CoreLogic$AWEPlayInteractionViewController$downloadButton); }; __attribute__((used)) static void _logos_property$CoreLogic$AWEPlayInteractionViewController$setDownloadButton(AWEPlayInteractionViewController * __unused self, SEL __unused _cmd, UIButton * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$CoreLogic$AWEPlayInteractionViewController$downloadButton, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static void _logos_method$CoreLogic$AWEPlayInteractionViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$CoreLogic$AWEPlayInteractionViewController$viewDidLoad(self, _cmd);

    if (downloadWithoutWatermark) {
        self.downloadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.downloadButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [self.downloadButton addTarget:self action:@selector(downloadButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.downloadButton setImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/tiktokgod/download.png"] forState:UIControlStateNormal];
        self.downloadButton.imageEdgeInsets = UIEdgeInsetsMake(3.0, 3.0, 3.0, 3.0);
        self.downloadButton.frame = CGRectMake(self.view.frame.size.width - 30 - 10, 135.0, 30.0, 30.0);
        [self.view addSubview:self.downloadButton];
    }

    if (canHideUI) {
        AWEFeedContainerViewController *afcVC = (AWEFeedContainerViewController *)[_logos_static_class_lookup$AWEFeedContainerViewController() sharedInstance];
        self.hideUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.hideUIButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [self.hideUIButton addTarget:self action:@selector(hideUIButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.hideUIButton setImage:[UIImage imageWithContentsOfFile:afcVC.isUIHidden?@"/Library/Application Support/tiktokgod/showui.png":@"/Library/Application Support/tiktokgod/hideui.png"] forState:UIControlStateNormal];
        self.hideUIButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.hideUIButton.imageEdgeInsets = UIEdgeInsetsMake(3.0, 3.0, 3.0, 3.0);
        self.hideUIButton.frame = CGRectMake(self.view.frame.size.width - 30 - 10, 100.0, 30.0, 30.0);
        [self.view addSubview:self.hideUIButton];
    }
}

static void _logos_method$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation(self, _cmd);
    if (canHideUI) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateShowOrHideUI];
        });
    }
}


static void _logos_method$CoreLogic$AWEPlayInteractionViewController$hideUIButtonPressed$(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton * sender) {
    AWEFeedContainerViewController *afcVC = (AWEFeedContainerViewController *)[_logos_static_class_lookup$AWEFeedContainerViewController() sharedInstance];
    afcVC.isUIHidden = !afcVC.isUIHidden;
    [self updateShowOrHideUI];
}


static void _logos_method$CoreLogic$AWEPlayInteractionViewController$downloadButtonPressed$(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton * sender) {
    NSString *videoURLString = self.model.video.playURL.originURLList.firstObject;
    if ([videoURLString containsString:@".m3u8"]) {
        [HCommon showAlertMessage:@"This video format is not supported (.m3u8 file extension)" withTitle:@"Not supported" viewController:nil];
    }
    [[[HDownloadMediaWithProgress alloc] init] checkPermissionToPhotosAndDownload:videoURLString appendExtension:@"mp4" mediaType:Video toAlbum:@"TikTok" viewController:self];
}


static void _logos_method$CoreLogic$AWEPlayInteractionViewController$updateShowOrHideUI(_LOGOS_SELF_TYPE_NORMAL AWEPlayInteractionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    AWEFeedContainerViewController *afcVC = (AWEFeedContainerViewController *)[_logos_static_class_lookup$AWEFeedContainerViewController() sharedInstance];
    [self setHide:afcVC.isUIHidden];
    [self.downloadButton setHidden:afcVC.isUIHidden];
    
    [self.hideUIButton setImage:[UIImage imageWithContentsOfFile:afcVC.isUIHidden?@"/Library/Application Support/tiktokgod/showui.png":@"/Library/Application Support/tiktokgod/hideui.png"] forState:UIControlStateNormal];
    if ([self.parentViewController isKindOfClass:_logos_static_class_lookup$AWEFeedCellViewController()]) {
        [afcVC setAccessoriesHidden:afcVC.isUIHidden];
    }

    afcVC.tabControl.hidden = afcVC.isUIHidden;
    afcVC.specialEventEntranceView.hidden = afcVC.isUIHidden;
}

    

static AWEFavoriteAwemeViewController* _logos_method$CoreLogic$AWEFavoriteAwemeViewController$init(_LOGOS_SELF_TYPE_INIT AWEFavoriteAwemeViewController* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    if (enableFavoritesCollections) {
        return [_logos_static_class_lookup$TTKFavoriteAwemeCollectionsViewController() new];
    } else {
        return _logos_orig$CoreLogic$AWEFavoriteAwemeViewController$init(self, _cmd);
    }
}



static __attribute__((constructor)) void _logosLocalCtor_a75f682b(int __unused argc, char __unused **argv, char __unused **envp) {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) reloadPrefs, CFSTR(PREF_CHANGED_NOTIF), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
    reloadPrefs();

    {Class _logos_class$CoreLogic$AWEAwemeModel = objc_getClass("AWEAwemeModel"); { MSHookMessageEx(_logos_class$CoreLogic$AWEAwemeModel, @selector(initWithDictionary:error:), (IMP)&_logos_method$CoreLogic$AWEAwemeModel$initWithDictionary$error$, (IMP*)&_logos_orig$CoreLogic$AWEAwemeModel$initWithDictionary$error$);}{ MSHookMessageEx(_logos_class$CoreLogic$AWEAwemeModel, @selector(init), (IMP)&_logos_method$CoreLogic$AWEAwemeModel$init, (IMP*)&_logos_orig$CoreLogic$AWEAwemeModel$init);}{ MSHookMessageEx(_logos_class$CoreLogic$AWEAwemeModel, @selector(progressBarDraggable), (IMP)&_logos_method$CoreLogic$AWEAwemeModel$progressBarDraggable, (IMP*)&_logos_orig$CoreLogic$AWEAwemeModel$progressBarDraggable);}{ MSHookMessageEx(_logos_class$CoreLogic$AWEAwemeModel, @selector(progressBarVisible), (IMP)&_logos_method$CoreLogic$AWEAwemeModel$progressBarVisible, (IMP*)&_logos_orig$CoreLogic$AWEAwemeModel$progressBarVisible);}Class _logos_class$CoreLogic$CTCarrier = objc_getClass("CTCarrier"); { MSHookMessageEx(_logos_class$CoreLogic$CTCarrier, @selector(mobileCountryCode), (IMP)&_logos_method$CoreLogic$CTCarrier$mobileCountryCode, (IMP*)&_logos_orig$CoreLogic$CTCarrier$mobileCountryCode);}{ MSHookMessageEx(_logos_class$CoreLogic$CTCarrier, @selector(isoCountryCode), (IMP)&_logos_method$CoreLogic$CTCarrier$isoCountryCode, (IMP*)&_logos_orig$CoreLogic$CTCarrier$isoCountryCode);}{ MSHookMessageEx(_logos_class$CoreLogic$CTCarrier, @selector(mobileNetworkCode), (IMP)&_logos_method$CoreLogic$CTCarrier$mobileNetworkCode, (IMP*)&_logos_orig$CoreLogic$CTCarrier$mobileNetworkCode);}Class _logos_class$CoreLogic$AWEPlayVideoPlayerController = objc_getClass("AWEPlayVideoPlayerController"); { MSHookMessageEx(_logos_class$CoreLogic$AWEPlayVideoPlayerController, @selector(playerWillLoopPlaying:), (IMP)&_logos_method$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$, (IMP*)&_logos_orig$CoreLogic$AWEPlayVideoPlayerController$playerWillLoopPlaying$);}Class _logos_class$CoreLogic$AWEFeedContainerViewController = objc_getClass("AWEFeedContainerViewController"); Class _logos_metaclass$CoreLogic$AWEFeedContainerViewController = object_getClass(_logos_class$CoreLogic$AWEFeedContainerViewController); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", @encode(BOOL) }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$CoreLogic$AWEFeedContainerViewController, "isUIHidden", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(BOOL)); class_addMethod(_logos_class$CoreLogic$AWEFeedContainerViewController, @selector(isUIHidden), (IMP)&_logos_property$CoreLogic$AWEFeedContainerViewController$isUIHidden, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(BOOL)); class_addMethod(_logos_class$CoreLogic$AWEFeedContainerViewController, @selector(setIsUIHidden:), (IMP)&_logos_property$CoreLogic$AWEFeedContainerViewController$setIsUIHidden, _typeEncoding); } { MSHookMessageEx(_logos_class$CoreLogic$AWEFeedContainerViewController, @selector(init), (IMP)&_logos_method$CoreLogic$AWEFeedContainerViewController$init, (IMP*)&_logos_orig$CoreLogic$AWEFeedContainerViewController$init);}{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(AWEFeedContainerViewController *), strlen(@encode(AWEFeedContainerViewController *))); i += strlen(@encode(AWEFeedContainerViewController *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_metaclass$CoreLogic$AWEFeedContainerViewController, @selector(sharedInstance), (IMP)&_logos_meta_method$CoreLogic$AWEFeedContainerViewController$sharedInstance, _typeEncoding); }Class _logos_class$CoreLogic$AWEPlayInteractionViewController = objc_getClass("AWEPlayInteractionViewController"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIButton\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$CoreLogic$AWEPlayInteractionViewController, "hideUIButton", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIButton *)); class_addMethod(_logos_class$CoreLogic$AWEPlayInteractionViewController, @selector(hideUIButton), (IMP)&_logos_property$CoreLogic$AWEPlayInteractionViewController$hideUIButton, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIButton *)); class_addMethod(_logos_class$CoreLogic$AWEPlayInteractionViewController, @selector(setHideUIButton:), (IMP)&_logos_property$CoreLogic$AWEPlayInteractionViewController$setHideUIButton, _typeEncoding); } { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"UIButton\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$CoreLogic$AWEPlayInteractionViewController, "downloadButton", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIButton *)); class_addMethod(_logos_class$CoreLogic$AWEPlayInteractionViewController, @selector(downloadButton), (IMP)&_logos_property$CoreLogic$AWEPlayInteractionViewController$downloadButton, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIButton *)); class_addMethod(_logos_class$CoreLogic$AWEPlayInteractionViewController, @selector(setDownloadButton:), (IMP)&_logos_property$CoreLogic$AWEPlayInteractionViewController$setDownloadButton, _typeEncoding); } { MSHookMessageEx(_logos_class$CoreLogic$AWEPlayInteractionViewController, @selector(viewDidLoad), (IMP)&_logos_method$CoreLogic$AWEPlayInteractionViewController$viewDidLoad, (IMP*)&_logos_orig$CoreLogic$AWEPlayInteractionViewController$viewDidLoad);}{ MSHookMessageEx(_logos_class$CoreLogic$AWEPlayInteractionViewController, @selector(stopLoadingAnimation), (IMP)&_logos_method$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation, (IMP*)&_logos_orig$CoreLogic$AWEPlayInteractionViewController$stopLoadingAnimation);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton *), strlen(@encode(UIButton *))); i += strlen(@encode(UIButton *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CoreLogic$AWEPlayInteractionViewController, @selector(hideUIButtonPressed:), (IMP)&_logos_method$CoreLogic$AWEPlayInteractionViewController$hideUIButtonPressed$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton *), strlen(@encode(UIButton *))); i += strlen(@encode(UIButton *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CoreLogic$AWEPlayInteractionViewController, @selector(downloadButtonPressed:), (IMP)&_logos_method$CoreLogic$AWEPlayInteractionViewController$downloadButtonPressed$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$CoreLogic$AWEPlayInteractionViewController, @selector(updateShowOrHideUI), (IMP)&_logos_method$CoreLogic$AWEPlayInteractionViewController$updateShowOrHideUI, _typeEncoding); }Class _logos_class$CoreLogic$AWEFavoriteAwemeViewController = objc_getClass("AWEFavoriteAwemeViewController"); { MSHookMessageEx(_logos_class$CoreLogic$AWEFavoriteAwemeViewController, @selector(init), (IMP)&_logos_method$CoreLogic$AWEFavoriteAwemeViewController$init, (IMP*)&_logos_orig$CoreLogic$AWEFavoriteAwemeViewController$init);}}
}

