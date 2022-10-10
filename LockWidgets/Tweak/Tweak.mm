#line 1 "/Users/lovez/Desktop/AA/AA/LockWidgets/Tweak/Tweak.xm"
#import "Tweak.h"

static LockWidgetsConfig *tweakConfig = nil;
static LockWidgetsIPCServer *ipcServer = nil;


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

@class WGWidgetHostingViewController; @class CSNotificationAdjunctListViewController; @class SBReachabilityWindow; @class SBDashBoardNotificationAdjunctListViewController; @class SheetViewController; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$WGWidgetHostingViewController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("WGWidgetHostingViewController"); } return _klass; }
#line 6 "/Users/lovez/Desktop/AA/AA/LockWidgets/Tweak/Tweak.xm"
static SBReachabilityWindow* (*_logos_orig$reachability$SBReachabilityWindow$initWithWallpaperVariant$)(_LOGOS_SELF_TYPE_INIT SBReachabilityWindow*, SEL, long long) _LOGOS_RETURN_RETAINED; static SBReachabilityWindow* _logos_method$reachability$SBReachabilityWindow$initWithWallpaperVariant$(_LOGOS_SELF_TYPE_INIT SBReachabilityWindow*, SEL, long long) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$reachability$SBReachabilityWindow$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBReachabilityWindow* _LOGOS_SELF_CONST, SEL); static void _logos_method$reachability$SBReachabilityWindow$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBReachabilityWindow* _LOGOS_SELF_CONST, SEL); 

__attribute__((used)) static LockWidgetsView * _logos_property$reachability$SBReachabilityWindow$lwReachabilityView(SBReachabilityWindow * __unused self, SEL __unused _cmd) { return (LockWidgetsView *)objc_getAssociatedObject(self, (void *)_logos_property$reachability$SBReachabilityWindow$lwReachabilityView); }; __attribute__((used)) static void _logos_property$reachability$SBReachabilityWindow$setLwReachabilityView(SBReachabilityWindow * __unused self, SEL __unused _cmd, LockWidgetsView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$reachability$SBReachabilityWindow$lwReachabilityView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static SBReachabilityWindow* _logos_method$reachability$SBReachabilityWindow$initWithWallpaperVariant$(_LOGOS_SELF_TYPE_INIT SBReachabilityWindow* __unused self, SEL __unused _cmd, long long arg1) _LOGOS_RETURN_RETAINED  {
	if((self = _logos_orig$reachability$SBReachabilityWindow$initWithWallpaperVariant$(self, _cmd, arg1))) {
		self.lwReachabilityView = [[LockWidgetsView alloc] initWithFrame:CGRectMake(self.frame.origin.x + 5, self.frame.origin.y - (self.frame.size.height / 3.5), self.frame.size.width - 10, 150)];
	}
	return self;
}

static void _logos_method$reachability$SBReachabilityWindow$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBReachabilityWindow* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$reachability$SBReachabilityWindow$layoutSubviews(self, _cmd);
	if(self.lwReachabilityView && tweakConfig.reachabilityEnabled) {
		self.userInteractionEnabled = NO;
		self.layer.masksToBounds = NO;
		self.clipsToBounds = NO;

		if (self.lwReachabilityView.superview == NULL) {
			[self addSubview:self.lwReachabilityView];
			[self bringSubviewToFront:self.lwReachabilityView];
		}
	} else {
		[self.lwReachabilityView removeFromSuperview];
	}
}







@implementation LockWidgetsIPCServer {
	MRYIPCCenter* _center;
}

+(void)load {
	[self sharedInstance];
}

+(instancetype)sharedInstance {
	static dispatch_once_t onceToken = 0;
	__strong static LockWidgetsIPCServer* sharedInstance = nil;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[self alloc] init];
	});
	return sharedInstance;
}

-(instancetype)init {
	if ((self = [super init]))
	{
		_center = [MRYIPCCenter centerNamed:@"me.conorthedev.lockwidgetsipcserver"];
		[_center addTarget:self action:@selector(getAllIdentifiers:)];
		[_center addTarget:self action:@selector(getWidgetNamesForIdentifiers:)];

		LogDebug(@"running server in %@", [NSProcessInfo processInfo].processName);
	}
	return self;
}

-(NSArray*)getAllIdentifiers:(NSDictionary*)args {
	return [[LockWidgetsManager sharedInstance] getAllWidgetIdentifiers];
}

-(NSMutableDictionary*)getWidgetNamesForIdentifiers:(NSDictionary*)args {	
	NSMutableDictionary *allIdentifiers = [NSMutableDictionary new];

	for(NSString *identifier in args[@"identifiers"]) {
		NSError *error;
		NSExtension *extension = [NSExtension extensionWithIdentifier:identifier error:&error];
		WGWidgetInfo *widgetInfo = [[NSClassFromString(@"WGWidgetInfo") alloc] initWithExtension:extension];
		WGWidgetHostingViewController *host	= [[_logos_static_class_lookup$WGWidgetHostingViewController() alloc] initWithWidgetInfo:widgetInfo delegate:nil host:nil];

		if(!host.appBundleID) {
			[allIdentifiers setValue:@{@"name":[widgetInfo displayName]} forKey:identifier];
		} else {
			UIImage *image = [UIImage _applicationIconImageForBundleIdentifier:host.appBundleID format:2 scale:1];
			if(image) {
				[allIdentifiers setValue:@{@"name":[widgetInfo displayName], @"image": UIImagePNGRepresentation(image)} forKey:identifier];
			} else {
				[allIdentifiers setValue:@{@"name":[widgetInfo displayName]} forKey:identifier];
			}
		}
	}

	return allIdentifiers;
}
@end

static void (*_logos_orig$group$SheetViewController$setAuthenticated$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$group$SheetViewController$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$group$SheetViewController$setInScreenOffMode$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$group$SheetViewController$setInScreenOffMode$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); 

static void _logos_method$group$SheetViewController$setAuthenticated$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL authenticated) {
	_logos_orig$group$SheetViewController$setAuthenticated$(self, _cmd, authenticated);
	if(authenticated) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("me.conorthedev.lockwidgets/Authenticated"), NULL, NULL, YES);
	} else {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("me.conorthedev.lockwidgets/NotAuthenticated"), NULL, NULL, YES);
	}
}

static void _logos_method$group$SheetViewController$setInScreenOffMode$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL screenOff) {
    _logos_orig$group$SheetViewController$setInScreenOffMode$(self, _cmd, screenOff);
    if(screenOff) {
        CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("me.conorthedev.lockwidgets/NotAuthenticated"), NULL, NULL, YES);
    }
}



static void (*_logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$_insertItem$animated$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL, id, BOOL); static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$_insertItem$animated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL, id, BOOL); static void (*_logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$_updatePresentingContent)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$_updatePresentingContent(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$addLockWidgetsView(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$refreshView(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); 

__attribute__((used)) static LockWidgetsView * _logos_property$ios12$SBDashBoardNotificationAdjunctListViewController$lockWidgetsView(SBDashBoardNotificationAdjunctListViewController * __unused self, SEL __unused _cmd) { return (LockWidgetsView *)objc_getAssociatedObject(self, (void *)_logos_property$ios12$SBDashBoardNotificationAdjunctListViewController$lockWidgetsView); }; __attribute__((used)) static void _logos_property$ios12$SBDashBoardNotificationAdjunctListViewController$setLockWidgetsView(SBDashBoardNotificationAdjunctListViewController * __unused self, SEL __unused _cmd, LockWidgetsView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$ios12$SBDashBoardNotificationAdjunctListViewController$lockWidgetsView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidLoad(self, _cmd);
	[self addLockWidgetsView];
}

static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$_insertItem$animated$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, BOOL arg2) {
	_logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$_insertItem$animated$(self, _cmd, arg1, arg2);
	[self refreshView];
}

static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
	_logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidAppear$(self, _cmd, animated);
	[self refreshView];
}

static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$_updatePresentingContent(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$_updatePresentingContent(self, _cmd);
	[self refreshView];
}


static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$addLockWidgetsView(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if(!self.lockWidgetsView) {
		self.lockWidgetsView = [[LockWidgetsView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 160)];
	}

	UIStackView *stackView = [self valueForKey:@"_stackView"];
	[stackView addArrangedSubview:self.lockWidgetsView];
	
	self.lockWidgetsView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.lockWidgetsView.centerXAnchor constraintEqualToAnchor:stackView.centerXAnchor].active = true;
	[self.lockWidgetsView.leadingAnchor constraintEqualToAnchor:stackView.leadingAnchor constant:5].active = true;
	[self.lockWidgetsView.trailingAnchor constraintEqualToAnchor:stackView.trailingAnchor constant:-5].active = true;
	[self.lockWidgetsView.heightAnchor constraintEqualToConstant:160].active = true;

	[LockWidgetsManager sharedInstance].view = self.lockWidgetsView;

}

 
static void _logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$refreshView(_LOGOS_SELF_TYPE_NORMAL SBDashBoardNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if(self.lockWidgetsView) {
		[self.lockWidgetsView refresh];
	}
}



static void (*_logos_orig$ios13$CSNotificationAdjunctListViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios13$CSNotificationAdjunctListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$ios13$CSNotificationAdjunctListViewController$_insertItem$animated$)(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL, id, BOOL); static void _logos_method$ios13$CSNotificationAdjunctListViewController$_insertItem$animated$(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL, id, BOOL); static void (*_logos_orig$ios13$CSNotificationAdjunctListViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$ios13$CSNotificationAdjunctListViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$ios13$CSNotificationAdjunctListViewController$_updatePresentingContent)(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios13$CSNotificationAdjunctListViewController$_updatePresentingContent(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios13$CSNotificationAdjunctListViewController$addLockWidgetsView(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios13$CSNotificationAdjunctListViewController$refreshView(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST, SEL); 

__attribute__((used)) static LockWidgetsView * _logos_property$ios13$CSNotificationAdjunctListViewController$lockWidgetsView(CSNotificationAdjunctListViewController * __unused self, SEL __unused _cmd) { return (LockWidgetsView *)objc_getAssociatedObject(self, (void *)_logos_property$ios13$CSNotificationAdjunctListViewController$lockWidgetsView); }; __attribute__((used)) static void _logos_property$ios13$CSNotificationAdjunctListViewController$setLockWidgetsView(CSNotificationAdjunctListViewController * __unused self, SEL __unused _cmd, LockWidgetsView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_property$ios13$CSNotificationAdjunctListViewController$lockWidgetsView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static void _logos_method$ios13$CSNotificationAdjunctListViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$ios13$CSNotificationAdjunctListViewController$viewDidLoad(self, _cmd);
	[self addLockWidgetsView];
}

static void _logos_method$ios13$CSNotificationAdjunctListViewController$_insertItem$animated$(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, BOOL arg2) {
	_logos_orig$ios13$CSNotificationAdjunctListViewController$_insertItem$animated$(self, _cmd, arg1, arg2);
	[self refreshView];
}

static void _logos_method$ios13$CSNotificationAdjunctListViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
	_logos_orig$ios13$CSNotificationAdjunctListViewController$viewDidAppear$(self, _cmd, animated);
	[self refreshView];
}

static void _logos_method$ios13$CSNotificationAdjunctListViewController$_updatePresentingContent(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$ios13$CSNotificationAdjunctListViewController$_updatePresentingContent(self, _cmd);
	[self refreshView];
}


static void _logos_method$ios13$CSNotificationAdjunctListViewController$addLockWidgetsView(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if(!self.lockWidgetsView) {
		self.lockWidgetsView = [[LockWidgetsView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 160)];
	}

	UIStackView *stackView = [self valueForKey:@"_stackView"];
	[stackView addArrangedSubview:self.lockWidgetsView];
	
	self.lockWidgetsView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.lockWidgetsView.centerXAnchor constraintEqualToAnchor:stackView.centerXAnchor].active = true;
	[self.lockWidgetsView.leadingAnchor constraintEqualToAnchor:stackView.leadingAnchor constant:5].active = true;
	[self.lockWidgetsView.trailingAnchor constraintEqualToAnchor:stackView.trailingAnchor constant:-5].active = true;
	[self.lockWidgetsView.heightAnchor constraintEqualToConstant:160].active = true;

	[LockWidgetsManager sharedInstance].view = self.lockWidgetsView;

}

 
static void _logos_method$ios13$CSNotificationAdjunctListViewController$refreshView(_LOGOS_SELF_TYPE_NORMAL CSNotificationAdjunctListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if(self.lockWidgetsView) {
		[self.lockWidgetsView refresh];
	}
}




void reloadPreferences() {
	
	LogInfo("Reloading preferences...");

	
	tweakConfig = [LockWidgetsConfig sharedInstance];
	[tweakConfig reloadPreferences];

	
	[[LockWidgetsManager sharedInstance].view refresh];
	
	LogInfo("%s", tweakConfig.enabled ? "LockWidgets is enabled!" : "LockWidgets is disabled.");
	LogInfo("%s", tweakConfig.reachabilityEnabled ? "Reachability is enabled!" : "Reachability is disabled.");
}


static __attribute__((constructor)) void _logosLocalCtor_2d750367(int __unused argc, char __unused **argv, char __unused **envp) {	
	
	reloadPreferences();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPreferences, CFSTR("me.conorthedev.lockwidgets/ReloadPreferences"), NULL, kNilOptions);

	
	if(tweakConfig.enabled) {
		
		ipcServer = [[LockWidgetsIPCServer alloc] init];

		{Class _logos_class$reachability$SBReachabilityWindow = objc_getClass("SBReachabilityWindow"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"LockWidgetsView\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$reachability$SBReachabilityWindow, "lwReachabilityView", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(LockWidgetsView *)); class_addMethod(_logos_class$reachability$SBReachabilityWindow, @selector(lwReachabilityView), (IMP)&_logos_property$reachability$SBReachabilityWindow$lwReachabilityView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(LockWidgetsView *)); class_addMethod(_logos_class$reachability$SBReachabilityWindow, @selector(setLwReachabilityView:), (IMP)&_logos_property$reachability$SBReachabilityWindow$setLwReachabilityView, _typeEncoding); } { MSHookMessageEx(_logos_class$reachability$SBReachabilityWindow, @selector(initWithWallpaperVariant:), (IMP)&_logos_method$reachability$SBReachabilityWindow$initWithWallpaperVariant$, (IMP*)&_logos_orig$reachability$SBReachabilityWindow$initWithWallpaperVariant$);}{ MSHookMessageEx(_logos_class$reachability$SBReachabilityWindow, @selector(layoutSubviews), (IMP)&_logos_method$reachability$SBReachabilityWindow$layoutSubviews, (IMP*)&_logos_orig$reachability$SBReachabilityWindow$layoutSubviews);}}

		
        NSString *sheetControllerClass = @"SBDashBoardViewController";
        if(@available(iOS 13.0, *)) {
            sheetControllerClass = @"CSCoverSheetViewController";
            LogDebug(@"Current version is iOS 13 or higher, using %@", sheetControllerClass);
			{Class _logos_class$ios13$CSNotificationAdjunctListViewController = objc_getClass("CSNotificationAdjunctListViewController"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"LockWidgetsView\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$ios13$CSNotificationAdjunctListViewController, "lockWidgetsView", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(LockWidgetsView *)); class_addMethod(_logos_class$ios13$CSNotificationAdjunctListViewController, @selector(lockWidgetsView), (IMP)&_logos_property$ios13$CSNotificationAdjunctListViewController$lockWidgetsView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(LockWidgetsView *)); class_addMethod(_logos_class$ios13$CSNotificationAdjunctListViewController, @selector(setLockWidgetsView:), (IMP)&_logos_property$ios13$CSNotificationAdjunctListViewController$setLockWidgetsView, _typeEncoding); } { MSHookMessageEx(_logos_class$ios13$CSNotificationAdjunctListViewController, @selector(viewDidLoad), (IMP)&_logos_method$ios13$CSNotificationAdjunctListViewController$viewDidLoad, (IMP*)&_logos_orig$ios13$CSNotificationAdjunctListViewController$viewDidLoad);}{ MSHookMessageEx(_logos_class$ios13$CSNotificationAdjunctListViewController, @selector(_insertItem:animated:), (IMP)&_logos_method$ios13$CSNotificationAdjunctListViewController$_insertItem$animated$, (IMP*)&_logos_orig$ios13$CSNotificationAdjunctListViewController$_insertItem$animated$);}{ MSHookMessageEx(_logos_class$ios13$CSNotificationAdjunctListViewController, @selector(viewDidAppear:), (IMP)&_logos_method$ios13$CSNotificationAdjunctListViewController$viewDidAppear$, (IMP*)&_logos_orig$ios13$CSNotificationAdjunctListViewController$viewDidAppear$);}{ MSHookMessageEx(_logos_class$ios13$CSNotificationAdjunctListViewController, @selector(_updatePresentingContent), (IMP)&_logos_method$ios13$CSNotificationAdjunctListViewController$_updatePresentingContent, (IMP*)&_logos_orig$ios13$CSNotificationAdjunctListViewController$_updatePresentingContent);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$ios13$CSNotificationAdjunctListViewController, @selector(addLockWidgetsView), (IMP)&_logos_method$ios13$CSNotificationAdjunctListViewController$addLockWidgetsView, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$ios13$CSNotificationAdjunctListViewController, @selector(refreshView), (IMP)&_logos_method$ios13$CSNotificationAdjunctListViewController$refreshView, _typeEncoding); }}
        } else {
            LogDebug(@"Current version is iOS 12 or lower, using %@", sheetControllerClass);
			{Class _logos_class$ios12$SBDashBoardNotificationAdjunctListViewController = objc_getClass("SBDashBoardNotificationAdjunctListViewController"); { objc_property_attribute_t _attributes[16]; unsigned int attrc = 0; _attributes[attrc++] = (objc_property_attribute_t) { "T", "@\"LockWidgetsView\"" }; _attributes[attrc++] = (objc_property_attribute_t) { "&", "" }; _attributes[attrc++] = (objc_property_attribute_t) { "N", "" }; class_addProperty(_logos_class$ios12$SBDashBoardNotificationAdjunctListViewController, "lockWidgetsView", _attributes, attrc); char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(LockWidgetsView *)); class_addMethod(_logos_class$ios12$SBDashBoardNotificationAdjunctListViewController, @selector(lockWidgetsView), (IMP)&_logos_property$ios12$SBDashBoardNotificationAdjunctListViewController$lockWidgetsView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(LockWidgetsView *)); class_addMethod(_logos_class$ios12$SBDashBoardNotificationAdjunctListViewController, @selector(setLockWidgetsView:), (IMP)&_logos_property$ios12$SBDashBoardNotificationAdjunctListViewController$setLockWidgetsView, _typeEncoding); } { MSHookMessageEx(_logos_class$ios12$SBDashBoardNotificationAdjunctListViewController, @selector(viewDidLoad), (IMP)&_logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidLoad, (IMP*)&_logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidLoad);}{ MSHookMessageEx(_logos_class$ios12$SBDashBoardNotificationAdjunctListViewController, @selector(_insertItem:animated:), (IMP)&_logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$_insertItem$animated$, (IMP*)&_logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$_insertItem$animated$);}{ MSHookMessageEx(_logos_class$ios12$SBDashBoardNotificationAdjunctListViewController, @selector(viewDidAppear:), (IMP)&_logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidAppear$, (IMP*)&_logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$viewDidAppear$);}{ MSHookMessageEx(_logos_class$ios12$SBDashBoardNotificationAdjunctListViewController, @selector(_updatePresentingContent), (IMP)&_logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$_updatePresentingContent, (IMP*)&_logos_orig$ios12$SBDashBoardNotificationAdjunctListViewController$_updatePresentingContent);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$ios12$SBDashBoardNotificationAdjunctListViewController, @selector(addLockWidgetsView), (IMP)&_logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$addLockWidgetsView, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$ios12$SBDashBoardNotificationAdjunctListViewController, @selector(refreshView), (IMP)&_logos_method$ios12$SBDashBoardNotificationAdjunctListViewController$refreshView, _typeEncoding); }}
        }

		
		
		{Class _logos_class$group$SheetViewController = NSClassFromString(sheetControllerClass); { MSHookMessageEx(_logos_class$group$SheetViewController, @selector(setAuthenticated:), (IMP)&_logos_method$group$SheetViewController$setAuthenticated$, (IMP*)&_logos_orig$group$SheetViewController$setAuthenticated$);}{ MSHookMessageEx(_logos_class$group$SheetViewController, @selector(setInScreenOffMode:), (IMP)&_logos_method$group$SheetViewController$setInScreenOffMode$, (IMP*)&_logos_orig$group$SheetViewController$setInScreenOffMode$);}}
	}
}
