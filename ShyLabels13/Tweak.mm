#line 1 "/Users/lovez/Desktop/AA/AA/ShyLabels13/Tweak.xm"
#import <Tweak.h>

BOOL isDragging = NO;
BOOL hasFullyLoaded = NO;
BOOL isUsingGoodges = NO;

BOOL enabled;
double delay;


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

@class SBFolderView; @class SpringBoard; @class SBIconView; @class SBIconController; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBIconController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBIconController"); } return _klass; }
#line 10 "/Users/lovez/Desktop/AA/AA/ShyLabels13/Tweak.xm"
static void (*_logos_orig$ios13$SBFolderView$pageControl$didRecieveTouchInDirection$)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id, int); static void _logos_method$ios13$SBFolderView$pageControl$didRecieveTouchInDirection$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id, int); static void (*_logos_orig$ios13$SBFolderView$scrollViewDidEndDragging$willDecelerate$)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id, _Bool); static void _logos_method$ios13$SBFolderView$scrollViewDidEndDragging$willDecelerate$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id, _Bool); static void (*_logos_orig$ios13$SBFolderView$scrollViewWillBeginDragging$)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$ios13$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$ios13$SBFolderView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios13$SBFolderView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios13$SBFolderView$_prepareHideLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios13$SBFolderView$_hideLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios13$SBFolderView$_showLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$ios13$SBIconView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void _logos_method$ios13$SBIconView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$ios13$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$ios13$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id);  


static void _logos_method$ios13$SBFolderView$pageControl$didRecieveTouchInDirection$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, int arg2) {
	_logos_orig$ios13$SBFolderView$pageControl$didRecieveTouchInDirection$(self, _cmd, arg1, arg2);
	[self _prepareHideLabels];
}

static void _logos_method$ios13$SBFolderView$scrollViewDidEndDragging$willDecelerate$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, _Bool arg2) {
	_logos_orig$ios13$SBFolderView$scrollViewDidEndDragging$willDecelerate$(self, _cmd, arg1, arg2);
	[self _prepareHideLabels];
}

static void _logos_method$ios13$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	_logos_orig$ios13$SBFolderView$scrollViewWillBeginDragging$(self, _cmd, arg1);
	isDragging = YES;
	[self _showLabels];
}

static void _logos_method$ios13$SBFolderView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$ios13$SBFolderView$layoutSubviews(self, _cmd);
	
	
	if (delay >= 2.0) {
		[self _prepareHideLabels];
	} else {
		[self _hideLabels];
	}

}


static void _logos_method$ios13$SBFolderView$_prepareHideLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(_hideLabels) object:nil];
	[self performSelector:@selector(_hideLabels) withObject:nil afterDelay:delay];
}


static void _logos_method$ios13$SBFolderView$_hideLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	animateIconLabelAlpha(0, 13);
	isDragging = NO;
}


static void _logos_method$ios13$SBFolderView$_showLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	animateIconLabelAlpha(1, 13);
}



static void _logos_method$ios13$SBIconView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$ios13$SBIconView$layoutSubviews(self, _cmd);

	
	if (hasFullyLoaded && isUsingGoodges && !isDragging) {
		SBIconController *controller = [_logos_static_class_lookup$SBIconController() sharedInstance];
		SBRootFolderController *rootFolderController = [controller _rootFolderController];
		SBIconListView *rootView = [[rootFolderController rootFolderView] currentIconListView];

		NSArray *icons = [rootView icons];
		SBIcon *icon = [self icon];

		
		if (![icons containsObject:icon]) return;

		int badgeValue = (int)[icon badgeValue];

		if (badgeValue < 1) {
			[self setIconLabelAlpha: 0];
		} else {
			[self setIconLabelAlpha: 1];
		}
	}
}




static void _logos_method$ios13$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id application) {
    _logos_orig$ios13$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void) {
        hasFullyLoaded = YES;
    });
}



static void (*_logos_orig$old$SBFolderView$pageControl$didRecieveTouchInDirection$)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id, int); static void _logos_method$old$SBFolderView$pageControl$didRecieveTouchInDirection$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id, int); static void (*_logos_orig$old$SBFolderView$scrollViewDidEndDragging$willDecelerate$)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id, _Bool); static void _logos_method$old$SBFolderView$scrollViewDidEndDragging$willDecelerate$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id, _Bool); static void (*_logos_orig$old$SBFolderView$scrollViewWillBeginDragging$)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$old$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$old$SBFolderView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static void _logos_method$old$SBFolderView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static void _logos_method$old$SBFolderView$_prepareHideLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static void _logos_method$old$SBFolderView$_hideLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static void _logos_method$old$SBFolderView$_showLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$old$SBIconView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void _logos_method$old$SBIconView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$old$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$old$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); 

static void _logos_method$old$SBFolderView$pageControl$didRecieveTouchInDirection$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, int arg2) {
	_logos_orig$old$SBFolderView$pageControl$didRecieveTouchInDirection$(self, _cmd, arg1, arg2);
	[self _prepareHideLabels];
}

static void _logos_method$old$SBFolderView$scrollViewDidEndDragging$willDecelerate$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, _Bool arg2) {
	_logos_orig$old$SBFolderView$scrollViewDidEndDragging$willDecelerate$(self, _cmd, arg1, arg2);
	[self _prepareHideLabels];
}

static void _logos_method$old$SBFolderView$scrollViewWillBeginDragging$(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	_logos_orig$old$SBFolderView$scrollViewWillBeginDragging$(self, _cmd, arg1);
	isDragging = YES;
	[self _showLabels];
}

static void _logos_method$old$SBFolderView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$old$SBFolderView$layoutSubviews(self, _cmd);
	
	
	if (delay >= 2.0) {
		[self _prepareHideLabels];
	} else {
		[self _hideLabels];
	}

}


static void _logos_method$old$SBFolderView$_prepareHideLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(_hideLabels) object:nil];
	[self performSelector:@selector(_hideLabels) withObject:nil afterDelay:delay];
}


static void _logos_method$old$SBFolderView$_hideLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	animateIconLabelAlpha(0, 12);
	isDragging = NO;
}


static void _logos_method$old$SBFolderView$_showLabels(_LOGOS_SELF_TYPE_NORMAL SBFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	animateIconLabelAlpha(1, 12);
}



static void _logos_method$old$SBIconView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$old$SBIconView$layoutSubviews(self, _cmd);

	
	if (hasFullyLoaded && isUsingGoodges && !isDragging) {
		SBIconController *controller = [_logos_static_class_lookup$SBIconController() sharedInstance];
		SBRootIconListView *rootView = [controller currentRootIconList];

		NSArray *icons = [rootView icons];
		SBIcon *icon = [self icon];

		
		if (![icons containsObject:icon]) return;

		int badgeValue = (int)[icon badgeValue];

		if (badgeValue < 1) {
			[self setIconLabelAlpha: 0];
		} else {
			[self setIconLabelAlpha: 1];
		}
	}
}



static void _logos_method$old$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id application) {
    _logos_orig$old$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void) {
        hasFullyLoaded = YES;
    });
}



static void animateIconLabelAlpha(double alpha, int version) {
	if(version == 13) {
	SBIconController *controller = [_logos_static_class_lookup$SBIconController() sharedInstance];
		SBRootFolderController *rootFolderController = [controller _rootFolderController];
		SBIconListView *rootView = [[rootFolderController rootFolderView] currentIconListView];

		[UIView animateWithDuration:0.5 animations:^{
			for(UIView *icon in rootView.subviews) {
				if (![icon.description containsString:@"SBIconView"]) continue;
				SBIconView *iconView = (SBIconView*)icon;

				int badgeValue = (int)[iconView.icon badgeValue];
				if (!isUsingGoodges || badgeValue < 1) {
					[iconView setIconLabelAlpha: alpha];
				} else {
					[iconView setIconLabelAlpha: 1];
				}
			}
		}];
	} else {
		SBIconController *controller = [_logos_static_class_lookup$SBIconController() sharedInstance];
		SBRootIconListView *rootView = [controller currentRootIconList];

		NSArray *icons = [rootView icons];
		SBIconViewMap* map = [rootView viewMap];

		[UIView animateWithDuration:0.5 animations:^{
			for(SBIcon *icon in icons) {
				SBIconView *iconView = [map mappedIconViewForIcon:icon];

				int badgeValue = (int)[icon badgeValue];
				if (!isUsingGoodges || badgeValue < 1) {
					[iconView setIconLabelAlpha: alpha];
				} else {
					[iconView setIconLabelAlpha: 1];
				}
			}
		}];
	}
}



static void loadPrefs() {
  NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/me.conorthedev.shylabels.plist"];

  if (prefs) {
    enabled = ( [prefs objectForKey:@"enabled"] ? [[prefs objectForKey:@"enabled"] boolValue] : YES );
    delay = ( [prefs objectForKey:@"delay"] ? [[prefs objectForKey:@"delay"] doubleValue] : 1.0 );
  }

}

static void initPrefs() {
  
  NSString *path = @"/User/Library/Preferences/me.conorthedev.shylabels.plist";
  NSString *pathDefault = @"/Library/PreferenceBundles/ShyLabels.bundle/defaults.plist";
  NSFileManager *fileManager = [NSFileManager defaultManager];
  if (![fileManager fileExistsAtPath:path]) {
    [fileManager copyItemAtPath:pathDefault toPath:path error:nil];
  }
}

static __attribute__((constructor)) void _logosLocalCtor_c4f12235(int __unused argc, char __unused **argv, char __unused **envp) {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("me.conorthedev.shylabels/prefsupdated"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	initPrefs();
	loadPrefs();

	NSFileManager *fileManager = [NSFileManager defaultManager];
	isUsingGoodges = [fileManager fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/Goodges.dylib"];

	if(enabled) {
		if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"13.0")) {
			{Class _logos_class$ios13$SBFolderView = objc_getClass("SBFolderView"); { MSHookMessageEx(_logos_class$ios13$SBFolderView, @selector(pageControl:didRecieveTouchInDirection:), (IMP)&_logos_method$ios13$SBFolderView$pageControl$didRecieveTouchInDirection$, (IMP*)&_logos_orig$ios13$SBFolderView$pageControl$didRecieveTouchInDirection$);}{ MSHookMessageEx(_logos_class$ios13$SBFolderView, @selector(scrollViewDidEndDragging:willDecelerate:), (IMP)&_logos_method$ios13$SBFolderView$scrollViewDidEndDragging$willDecelerate$, (IMP*)&_logos_orig$ios13$SBFolderView$scrollViewDidEndDragging$willDecelerate$);}{ MSHookMessageEx(_logos_class$ios13$SBFolderView, @selector(scrollViewWillBeginDragging:), (IMP)&_logos_method$ios13$SBFolderView$scrollViewWillBeginDragging$, (IMP*)&_logos_orig$ios13$SBFolderView$scrollViewWillBeginDragging$);}{ MSHookMessageEx(_logos_class$ios13$SBFolderView, @selector(layoutSubviews), (IMP)&_logos_method$ios13$SBFolderView$layoutSubviews, (IMP*)&_logos_orig$ios13$SBFolderView$layoutSubviews);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$ios13$SBFolderView, @selector(_prepareHideLabels), (IMP)&_logos_method$ios13$SBFolderView$_prepareHideLabels, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$ios13$SBFolderView, @selector(_hideLabels), (IMP)&_logos_method$ios13$SBFolderView$_hideLabels, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$ios13$SBFolderView, @selector(_showLabels), (IMP)&_logos_method$ios13$SBFolderView$_showLabels, _typeEncoding); }Class _logos_class$ios13$SBIconView = objc_getClass("SBIconView"); { MSHookMessageEx(_logos_class$ios13$SBIconView, @selector(layoutSubviews), (IMP)&_logos_method$ios13$SBIconView$layoutSubviews, (IMP*)&_logos_orig$ios13$SBIconView$layoutSubviews);}Class _logos_class$ios13$SpringBoard = objc_getClass("SpringBoard"); { MSHookMessageEx(_logos_class$ios13$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$ios13$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$ios13$SpringBoard$applicationDidFinishLaunching$);}}
		} else {
			{Class _logos_class$old$SBFolderView = objc_getClass("SBFolderView"); { MSHookMessageEx(_logos_class$old$SBFolderView, @selector(pageControl:didRecieveTouchInDirection:), (IMP)&_logos_method$old$SBFolderView$pageControl$didRecieveTouchInDirection$, (IMP*)&_logos_orig$old$SBFolderView$pageControl$didRecieveTouchInDirection$);}{ MSHookMessageEx(_logos_class$old$SBFolderView, @selector(scrollViewDidEndDragging:willDecelerate:), (IMP)&_logos_method$old$SBFolderView$scrollViewDidEndDragging$willDecelerate$, (IMP*)&_logos_orig$old$SBFolderView$scrollViewDidEndDragging$willDecelerate$);}{ MSHookMessageEx(_logos_class$old$SBFolderView, @selector(scrollViewWillBeginDragging:), (IMP)&_logos_method$old$SBFolderView$scrollViewWillBeginDragging$, (IMP*)&_logos_orig$old$SBFolderView$scrollViewWillBeginDragging$);}{ MSHookMessageEx(_logos_class$old$SBFolderView, @selector(layoutSubviews), (IMP)&_logos_method$old$SBFolderView$layoutSubviews, (IMP*)&_logos_orig$old$SBFolderView$layoutSubviews);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$old$SBFolderView, @selector(_prepareHideLabels), (IMP)&_logos_method$old$SBFolderView$_prepareHideLabels, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$old$SBFolderView, @selector(_hideLabels), (IMP)&_logos_method$old$SBFolderView$_hideLabels, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$old$SBFolderView, @selector(_showLabels), (IMP)&_logos_method$old$SBFolderView$_showLabels, _typeEncoding); }Class _logos_class$old$SBIconView = objc_getClass("SBIconView"); { MSHookMessageEx(_logos_class$old$SBIconView, @selector(layoutSubviews), (IMP)&_logos_method$old$SBIconView$layoutSubviews, (IMP*)&_logos_orig$old$SBIconView$layoutSubviews);}Class _logos_class$old$SpringBoard = objc_getClass("SpringBoard"); { MSHookMessageEx(_logos_class$old$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$old$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$old$SpringBoard$applicationDidFinishLaunching$);}}
		}
	}
}
