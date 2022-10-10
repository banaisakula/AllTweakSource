#line 1 "/Users/lovez/Desktop/AA/AA/tweak/Tweak.xm"
#import "Tweak.h"



static BOOL enabled;
BOOL hideswitchlabel13;
BOOL batterypercent;
BOOL breadcrumbs;
BOOL enabledrap;
BOOL hideweathercource;
BOOL DisableSwitcherAppSuggestion;
BOOL hidehomebar,HideDots13,hidewidghtline,hide3dline,hidedockbackground,hideupdatedot,hideHSlabel13,hide3dwidghts,kEnableOnHomescreen;
BOOL autodimiss,hasCamera,lockcamera,hideSshot;
BOOL BatteryBuddy,dooubletaptolock,hidebreadcrumb;
BOOL LScamera,LSflash,LSicon,nodndbanner,kEnableOnLockscreen;









static void loadPrefs() {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];

	enabled = [prefs objectForKey:@"enabled"] ? [[prefs objectForKey:@"enabled"] boolValue] : YES;
	kEnableOnHomescreen = [prefs objectForKey:@"kEnableOnHomescreen"] ? [[prefs objectForKey:@"kEnableOnHomescreen"] boolValue] : YES;
	kEnableOnLockscreen = [prefs objectForKey:@"kEnableOnLockscreen"] ? [[prefs objectForKey:@"kEnableOnLockscreen"] boolValue] : YES;
	nodndbanner = [prefs objectForKey:@"nodndbanner"] ? [[prefs objectForKey:@"nodndbanner"] boolValue] : YES;
	hideswitchlabel13 = [prefs objectForKey:@"hideswitchlabel13"] ? [[prefs objectForKey:@"hideswitchlabel13"] boolValue] : YES;
	hideHSlabel13 = [prefs objectForKey:@"hideHSlabel13"] ? [[prefs objectForKey:@"hideHSlabel13"] boolValue] : YES;
	hide3dwidghts = [prefs objectForKey:@"hide3dwidghts"] ? [[prefs objectForKey:@"hide3dwidghts"] boolValue] : YES;
	batterypercent = [prefs objectForKey:@"batterypercent"] ? [[prefs objectForKey:@"batterypercent"] boolValue] : YES;
	breadcrumbs = [prefs objectForKey:@"breadcrumbs"] ? [[prefs objectForKey:@"breadcrumbs"] boolValue] : YES;
	hideupdatedot = [prefs objectForKey:@"hideupdatedot"] ? [[prefs objectForKey:@"hideupdatedot"] boolValue] : YES;
	enabledrap = [prefs objectForKey:@"enabledrap"] ? [[prefs objectForKey:@"enabledrap"] boolValue] : YES;
	hideweathercource = [prefs objectForKey:@"hideweathercource"] ? [[prefs objectForKey:@"hideweathercource"] boolValue] : YES;
	hidewidghtline = [prefs objectForKey:@"hidewidghtline"] ? [[prefs objectForKey:@"hidewidghtline"] boolValue] : YES;
	DisableSwitcherAppSuggestion = [prefs objectForKey:@"DisableSwitcherAppSuggestion"] ? [[prefs objectForKey:@"DisableSwitcherAppSuggestion"] boolValue] : YES;
	HideDots13 = [prefs objectForKey:@"HideDots13"] ? [[prefs objectForKey:@"HideDots13"] boolValue] : YES;
	hidedockbackground = [prefs objectForKey:@"hidedockbackground"] ? [[prefs objectForKey:@"hidedockbackground"] boolValue] : YES;
	hidehomebar = [prefs objectForKey:@"hidehomebar"] ? [[prefs objectForKey:@"hidehomebar"] boolValue] : YES;
	hide3dline = [prefs objectForKey:@"hide3dline"] ? [[prefs objectForKey:@"hide3dline"] boolValue] : YES;
	BatteryBuddy = [prefs objectForKey:@"BatteryBuddy"] ? [[prefs objectForKey:@"BatteryBuddy"] boolValue] : YES;
	LScamera = [prefs objectForKey:@"LScamera"] ? [[prefs objectForKey:@"LScamera"] boolValue] : YES;
	LSflash = [prefs objectForKey:@"LSflash"] ? [[prefs objectForKey:@"LSflash"] boolValue] : YES;
	LSicon = [prefs objectForKey:@"LSicon"] ? [[prefs objectForKey:@"LSicon"] boolValue] : YES;
	dooubletaptolock = [prefs objectForKey:@"dooubletaptolock"] ? [[prefs objectForKey:@"dooubletaptolock"] boolValue] : YES;
	hidebreadcrumb = [prefs objectForKey:@"hidebreadcrumb"] ? [[prefs objectForKey:@"hidebreadcrumb"] boolValue] : YES;
	
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

@class SBDockView; @class SBUIActionKeylineView; @class MTLumaDodgePillSettings; @class _UIInterfaceActionBlankSeparatorView; @class SBMainDisplaySceneLayoutStatusBarView; @class SBMainDisplayPolicyAggregator; @class SBUIAppIconForceTouchShortcutViewController; @class DNDNotificationsService; @class _UIInterfaceActionVibrantSeparatorView; @class NSProcessInfo; @class SBIconListPageControl; @class SBRootFolderView; @class _SBIconListViewDataDraggingContext; @class T1TwitterPatchedSwiftClassNameT1Application; @class YTSettings; @class CSBatteryFillView; @class SBIconLabelImageParametersBuilder; @class SBHHomeScreenSettings; @class SBSwitcherAppSuggestionViewController; @class SBFluidSwitcherItemContainerHeaderView; @class _UIBatteryView; @class MTLumaDodgePillView; @class CSPageControl; @class SBUIAppIconForceTouchController; @class WGWidgetAttributionView; @class PXDragAndDropSettings; @class SBIconView; @class SBIconListView; @class SpringBoard; @class SBDeviceApplicationSceneStatusBarBreadcrumbProvider; @class UIDragInteraction; @class SBMutableIconLabelImageParameters; @class CSQuickActionsViewController; @class CSProudLockViewController; @class _UIDraggingSession; @class _UIInternalDraggingSessionSource; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SpringBoard(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SpringBoard"); } return _klass; }
#line 54 "/Users/lovez/Desktop/AA/AA/tweak/Tweak.xm"
static BOOL (*_logos_meta_orig$hidebreadcrumb$SBDeviceApplicationSceneStatusBarBreadcrumbProvider$_shouldAddBreadcrumbToActivatingSceneEntity$sceneHandle$withTransitionContext$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id, id); static BOOL _logos_meta_method$hidebreadcrumb$SBDeviceApplicationSceneStatusBarBreadcrumbProvider$_shouldAddBreadcrumbToActivatingSceneEntity$sceneHandle$withTransitionContext$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id, id, id); 


static BOOL _logos_meta_method$hidebreadcrumb$SBDeviceApplicationSceneStatusBarBreadcrumbProvider$_shouldAddBreadcrumbToActivatingSceneEntity$sceneHandle$withTransitionContext$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3) {
	return NO;
}







static void (*_logos_orig$HS$SBRootFolderView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST, SEL); static void _logos_method$HS$SBRootFolderView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST, SEL); 

static void _logos_method$HS$SBRootFolderView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL SBRootFolderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$HS$SBRootFolderView$didMoveToWindow(self, _cmd);
	self.todayViewPageHidden = YES;
}



static bool (*_logos_orig$LSfuyi$SBMainDisplayPolicyAggregator$_allowsCapabilityLockScreenTodayViewWithExplanation$)(_LOGOS_SELF_TYPE_NORMAL SBMainDisplayPolicyAggregator* _LOGOS_SELF_CONST, SEL, id); static bool _logos_method$LSfuyi$SBMainDisplayPolicyAggregator$_allowsCapabilityLockScreenTodayViewWithExplanation$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplayPolicyAggregator* _LOGOS_SELF_CONST, SEL, id); 

static bool _logos_method$LSfuyi$SBMainDisplayPolicyAggregator$_allowsCapabilityLockScreenTodayViewWithExplanation$(_LOGOS_SELF_TYPE_NORMAL SBMainDisplayPolicyAggregator* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	return NO;
}








static void (*_logos_orig$hideswitchlabel13$SBFluidSwitcherItemContainerHeaderView$setTextAlpha$)(_LOGOS_SELF_TYPE_NORMAL SBFluidSwitcherItemContainerHeaderView* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$hideswitchlabel13$SBFluidSwitcherItemContainerHeaderView$setTextAlpha$(_LOGOS_SELF_TYPE_NORMAL SBFluidSwitcherItemContainerHeaderView* _LOGOS_SELF_CONST, SEL, double); 


static void _logos_method$hideswitchlabel13$SBFluidSwitcherItemContainerHeaderView$setTextAlpha$(_LOGOS_SELF_TYPE_NORMAL SBFluidSwitcherItemContainerHeaderView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
	arg1 = 0;
	_logos_orig$hideswitchlabel13$SBFluidSwitcherItemContainerHeaderView$setTextAlpha$(self, _cmd, arg1);
}


static double (*_logos_orig$hideHSlabel13$SBIconLabelImageParametersBuilder$_scale)(_LOGOS_SELF_TYPE_NORMAL SBIconLabelImageParametersBuilder* _LOGOS_SELF_CONST, SEL); static double _logos_method$hideHSlabel13$SBIconLabelImageParametersBuilder$_scale(_LOGOS_SELF_TYPE_NORMAL SBIconLabelImageParametersBuilder* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$hideHSlabel13$SBIconView$setLabelHidden$)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL, bool); static void _logos_method$hideHSlabel13$SBIconView$setLabelHidden$(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL, bool); static void (*_logos_orig$hideHSlabel13$SBMutableIconLabelImageParameters$setText$)(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$hideHSlabel13$SBMutableIconLabelImageParameters$setText$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST, SEL, id); 


static double _logos_method$hideHSlabel13$SBIconLabelImageParametersBuilder$_scale(_LOGOS_SELF_TYPE_NORMAL SBIconLabelImageParametersBuilder* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return 0;
}



static void _logos_method$hideHSlabel13$SBIconView$setLabelHidden$(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, bool arg1) {
	arg1 = YES;
	_logos_orig$hideHSlabel13$SBIconView$setLabelHidden$(self, _cmd, arg1);
}



static void _logos_method$hideHSlabel13$SBMutableIconLabelImageParameters$setText$(_LOGOS_SELF_TYPE_NORMAL SBMutableIconLabelImageParameters* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	_logos_orig$hideHSlabel13$SBMutableIconLabelImageParameters$setText$(self, _cmd, arg1);
}





static bool (*_logos_orig$hide3dwidghts$SBHHomeScreenSettings$showWidgets)(_LOGOS_SELF_TYPE_NORMAL SBHHomeScreenSettings* _LOGOS_SELF_CONST, SEL); static bool _logos_method$hide3dwidghts$SBHHomeScreenSettings$showWidgets(_LOGOS_SELF_TYPE_NORMAL SBHHomeScreenSettings* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$hide3dwidghts$SBUIAppIconForceTouchController$_widgetViewControllerForDataProvider$)(_LOGOS_SELF_TYPE_NORMAL SBUIAppIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static id _logos_method$hide3dwidghts$SBUIAppIconForceTouchController$_widgetViewControllerForDataProvider$(_LOGOS_SELF_TYPE_NORMAL SBUIAppIconForceTouchController* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$hide3dwidghts$SBUIAppIconForceTouchShortcutViewController$setIconPosition$)(_LOGOS_SELF_TYPE_NORMAL SBUIAppIconForceTouchShortcutViewController* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$hide3dwidghts$SBUIAppIconForceTouchShortcutViewController$setIconPosition$(_LOGOS_SELF_TYPE_NORMAL SBUIAppIconForceTouchShortcutViewController* _LOGOS_SELF_CONST, SEL, long long); 

static bool _logos_method$hide3dwidghts$SBHHomeScreenSettings$showWidgets(_LOGOS_SELF_TYPE_NORMAL SBHHomeScreenSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}



static id _logos_method$hide3dwidghts$SBUIAppIconForceTouchController$_widgetViewControllerForDataProvider$(_LOGOS_SELF_TYPE_NORMAL SBUIAppIconForceTouchController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	arg1 = NULL;
	return NULL;
	return _logos_orig$hide3dwidghts$SBUIAppIconForceTouchController$_widgetViewControllerForDataProvider$(self, _cmd, arg1);
}



static void _logos_method$hide3dwidghts$SBUIAppIconForceTouchShortcutViewController$setIconPosition$(_LOGOS_SELF_TYPE_NORMAL SBUIAppIconForceTouchShortcutViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
	arg1 = 1;
	_logos_orig$hide3dwidghts$SBUIAppIconForceTouchShortcutViewController$setIconPosition$(self, _cmd, arg1);
}



static void (*_logos_orig$batterypercent$_UIBatteryView$setShowsPercentage$)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, bool); static void _logos_method$batterypercent$_UIBatteryView$setShowsPercentage$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, bool); static void (*_logos_orig$batterypercent$_UIBatteryView$setShowsInlineChargingIndicator$)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, bool); static void _logos_method$batterypercent$_UIBatteryView$setShowsInlineChargingIndicator$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL, bool); 

static void _logos_method$batterypercent$_UIBatteryView$setShowsPercentage$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, bool arg1) {
	arg1 = YES;
	_logos_orig$batterypercent$_UIBatteryView$setShowsPercentage$(self, _cmd, arg1);
}

static void _logos_method$batterypercent$_UIBatteryView$setShowsInlineChargingIndicator$(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, bool arg1) {
	_logos_orig$batterypercent$_UIBatteryView$setShowsInlineChargingIndicator$(self, _cmd, arg1);
}




static void (*_logos_orig$breadcrumbs$SBMainDisplaySceneLayoutStatusBarView$updateBreadcrumbActionIfNecessary)(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneLayoutStatusBarView* _LOGOS_SELF_CONST, SEL); static void _logos_method$breadcrumbs$SBMainDisplaySceneLayoutStatusBarView$updateBreadcrumbActionIfNecessary(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneLayoutStatusBarView* _LOGOS_SELF_CONST, SEL); 

static void _logos_method$breadcrumbs$SBMainDisplaySceneLayoutStatusBarView$updateBreadcrumbActionIfNecessary(_LOGOS_SELF_TYPE_NORMAL SBMainDisplaySceneLayoutStatusBarView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$breadcrumbs$SBMainDisplaySceneLayoutStatusBarView$updateBreadcrumbActionIfNecessary(self, _cmd);
}



static void (*_logos_orig$hideupdatedot$SBIconView$setLabelAccessoryHidden$)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL, bool); static void _logos_method$hideupdatedot$SBIconView$setLabelAccessoryHidden$(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL, bool); static bool (*_logos_orig$hideupdatedot$SBIconView$allowsLabelAccessoryView)(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static bool _logos_method$hideupdatedot$SBIconView$allowsLabelAccessoryView(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$hideupdatedot$_SBIconListViewDataDraggingContext$iconView)(_LOGOS_SELF_TYPE_NORMAL _SBIconListViewDataDraggingContext* _LOGOS_SELF_CONST, SEL); static id _logos_method$hideupdatedot$_SBIconListViewDataDraggingContext$iconView(_LOGOS_SELF_TYPE_NORMAL _SBIconListViewDataDraggingContext* _LOGOS_SELF_CONST, SEL); 


static void _logos_method$hideupdatedot$SBIconView$setLabelAccessoryHidden$(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, bool arg1) {
	arg1 = YES;
	_logos_orig$hideupdatedot$SBIconView$setLabelAccessoryHidden$(self, _cmd, arg1);
}

static bool _logos_method$hideupdatedot$SBIconView$allowsLabelAccessoryView(_LOGOS_SELF_TYPE_NORMAL SBIconView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}



static id _logos_method$hideupdatedot$_SBIconListViewDataDraggingContext$iconView(_LOGOS_SELF_TYPE_NORMAL _SBIconListViewDataDraggingContext* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return _logos_orig$hideupdatedot$_SBIconListViewDataDraggingContext$iconView(self, _cmd);
}



static bool (*_logos_orig$enabledrap$PXDragAndDropSettings$dragOutEnabled)(_LOGOS_SELF_TYPE_NORMAL PXDragAndDropSettings* _LOGOS_SELF_CONST, SEL); static bool _logos_method$enabledrap$PXDragAndDropSettings$dragOutEnabled(_LOGOS_SELF_TYPE_NORMAL PXDragAndDropSettings* _LOGOS_SELF_CONST, SEL); static bool (*_logos_orig$enabledrap$T1TwitterPatchedSwiftClassNameT1Application$isDragAndDropEnabled)(_LOGOS_SELF_TYPE_NORMAL T1TwitterPatchedSwiftClassNameT1Application* _LOGOS_SELF_CONST, SEL); static bool _logos_method$enabledrap$T1TwitterPatchedSwiftClassNameT1Application$isDragAndDropEnabled(_LOGOS_SELF_TYPE_NORMAL T1TwitterPatchedSwiftClassNameT1Application* _LOGOS_SELF_CONST, SEL); static bool (*_logos_orig$enabledrap$UIDragInteraction$isEnabled)(_LOGOS_SELF_TYPE_NORMAL UIDragInteraction* _LOGOS_SELF_CONST, SEL); static bool _logos_method$enabledrap$UIDragInteraction$isEnabled(_LOGOS_SELF_TYPE_NORMAL UIDragInteraction* _LOGOS_SELF_CONST, SEL); static bool (*_logos_orig$enabledrap$YTSettings$isDragDropEnabled)(_LOGOS_SELF_TYPE_NORMAL YTSettings* _LOGOS_SELF_CONST, SEL); static bool _logos_method$enabledrap$YTSettings$isDragDropEnabled(_LOGOS_SELF_TYPE_NORMAL YTSettings* _LOGOS_SELF_CONST, SEL); static bool (*_logos_orig$enabledrap$_UIDraggingSession$_shouldCancelOnAppDeactivation)(_LOGOS_SELF_TYPE_NORMAL _UIDraggingSession* _LOGOS_SELF_CONST, SEL); static bool _logos_method$enabledrap$_UIDraggingSession$_shouldCancelOnAppDeactivation(_LOGOS_SELF_TYPE_NORMAL _UIDraggingSession* _LOGOS_SELF_CONST, SEL); static bool (*_logos_orig$enabledrap$_UIInternalDraggingSessionSource$shouldCancelOnAppDeactivation)(_LOGOS_SELF_TYPE_NORMAL _UIInternalDraggingSessionSource* _LOGOS_SELF_CONST, SEL); static bool _logos_method$enabledrap$_UIInternalDraggingSessionSource$shouldCancelOnAppDeactivation(_LOGOS_SELF_TYPE_NORMAL _UIInternalDraggingSessionSource* _LOGOS_SELF_CONST, SEL); 

static bool _logos_method$enabledrap$PXDragAndDropSettings$dragOutEnabled(_LOGOS_SELF_TYPE_NORMAL PXDragAndDropSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return YES;
}



static bool _logos_method$enabledrap$T1TwitterPatchedSwiftClassNameT1Application$isDragAndDropEnabled(_LOGOS_SELF_TYPE_NORMAL T1TwitterPatchedSwiftClassNameT1Application* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return YES;
}



static bool _logos_method$enabledrap$UIDragInteraction$isEnabled(_LOGOS_SELF_TYPE_NORMAL UIDragInteraction* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return YES;
}



static bool _logos_method$enabledrap$YTSettings$isDragDropEnabled(_LOGOS_SELF_TYPE_NORMAL YTSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return YES;
}



static bool _logos_method$enabledrap$_UIDraggingSession$_shouldCancelOnAppDeactivation(_LOGOS_SELF_TYPE_NORMAL _UIDraggingSession* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return YES;
}



static bool _logos_method$enabledrap$_UIInternalDraggingSessionSource$shouldCancelOnAppDeactivation(_LOGOS_SELF_TYPE_NORMAL _UIInternalDraggingSessionSource* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return NO;
}







static WGWidgetAttributionView* (*_logos_orig$hideweathercource$WGWidgetAttributionView$initWithWidgetAttributedString$)(_LOGOS_SELF_TYPE_INIT WGWidgetAttributionView*, SEL, id) _LOGOS_RETURN_RETAINED; static WGWidgetAttributionView* _logos_method$hideweathercource$WGWidgetAttributionView$initWithWidgetAttributedString$(_LOGOS_SELF_TYPE_INIT WGWidgetAttributionView*, SEL, id) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$hideweathercource$WGWidgetAttributionView$_configureAttributedString)(_LOGOS_SELF_TYPE_NORMAL WGWidgetAttributionView* _LOGOS_SELF_CONST, SEL); static void _logos_method$hideweathercource$WGWidgetAttributionView$_configureAttributedString(_LOGOS_SELF_TYPE_NORMAL WGWidgetAttributionView* _LOGOS_SELF_CONST, SEL); 

static WGWidgetAttributionView* _logos_method$hideweathercource$WGWidgetAttributionView$initWithWidgetAttributedString$(_LOGOS_SELF_TYPE_INIT WGWidgetAttributionView* __unused self, SEL __unused _cmd, id arg1) _LOGOS_RETURN_RETAINED {
	arg1 = NULL;
	return _logos_orig$hideweathercource$WGWidgetAttributionView$initWithWidgetAttributedString$(self, _cmd, arg1);
}

static void _logos_method$hideweathercource$WGWidgetAttributionView$_configureAttributedString(_LOGOS_SELF_TYPE_NORMAL WGWidgetAttributionView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$hideweathercource$WGWidgetAttributionView$_configureAttributedString(self, _cmd);
}



static CGSize (*_logos_orig$hidewidghtline$SBUIActionKeylineView$intrinsicContentSize)(_LOGOS_SELF_TYPE_NORMAL SBUIActionKeylineView* _LOGOS_SELF_CONST, SEL); static CGSize _logos_method$hidewidghtline$SBUIActionKeylineView$intrinsicContentSize(_LOGOS_SELF_TYPE_NORMAL SBUIActionKeylineView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$hidewidghtline$SBUIActionKeylineView$didMoveToSuperview)(_LOGOS_SELF_TYPE_NORMAL SBUIActionKeylineView* _LOGOS_SELF_CONST, SEL); static void _logos_method$hidewidghtline$SBUIActionKeylineView$didMoveToSuperview(_LOGOS_SELF_TYPE_NORMAL SBUIActionKeylineView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$hidewidghtline$_UIInterfaceActionBlankSeparatorView$setConstantAxisDimension$)(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionBlankSeparatorView* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$hidewidghtline$_UIInterfaceActionBlankSeparatorView$setConstantAxisDimension$(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionBlankSeparatorView* _LOGOS_SELF_CONST, SEL, double); 

static CGSize _logos_method$hidewidghtline$SBUIActionKeylineView$intrinsicContentSize(_LOGOS_SELF_TYPE_NORMAL SBUIActionKeylineView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	return _logos_orig$hidewidghtline$SBUIActionKeylineView$intrinsicContentSize(self, _cmd);
}

static void _logos_method$hidewidghtline$SBUIActionKeylineView$didMoveToSuperview(_LOGOS_SELF_TYPE_NORMAL SBUIActionKeylineView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$hidewidghtline$SBUIActionKeylineView$didMoveToSuperview(self, _cmd);
}



static void _logos_method$hidewidghtline$_UIInterfaceActionBlankSeparatorView$setConstantAxisDimension$(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionBlankSeparatorView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
	_logos_orig$hidewidghtline$_UIInterfaceActionBlankSeparatorView$setConstantAxisDimension$(self, _cmd, arg1);
}




static void (*_logos_orig$DisableSwitcherAppSuggestion$SBSwitcherAppSuggestionViewController$setBestAppSuggestion$)(_LOGOS_SELF_TYPE_NORMAL SBSwitcherAppSuggestionViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$DisableSwitcherAppSuggestion$SBSwitcherAppSuggestionViewController$setBestAppSuggestion$(_LOGOS_SELF_TYPE_NORMAL SBSwitcherAppSuggestionViewController* _LOGOS_SELF_CONST, SEL, id); 

static void _logos_method$DisableSwitcherAppSuggestion$SBSwitcherAppSuggestionViewController$setBestAppSuggestion$(_LOGOS_SELF_TYPE_NORMAL SBSwitcherAppSuggestionViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
	_logos_orig$DisableSwitcherAppSuggestion$SBSwitcherAppSuggestionViewController$setBestAppSuggestion$(self, _cmd, arg1);
}







static SBIconListPageControl* (*_logos_orig$HideDots13$SBIconListPageControl$initWithFrame$)(_LOGOS_SELF_TYPE_INIT SBIconListPageControl*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static SBIconListPageControl* _logos_method$HideDots13$SBIconListPageControl$initWithFrame$(_LOGOS_SELF_TYPE_INIT SBIconListPageControl*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static CSPageControl* (*_logos_orig$HideDots13$CSPageControl$initWithFrame$)(_LOGOS_SELF_TYPE_INIT CSPageControl*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static CSPageControl* _logos_method$HideDots13$CSPageControl$initWithFrame$(_LOGOS_SELF_TYPE_INIT CSPageControl*, SEL, CGRect) _LOGOS_RETURN_RETAINED; 



    static SBIconListPageControl* _logos_method$HideDots13$SBIconListPageControl$initWithFrame$(_LOGOS_SELF_TYPE_INIT SBIconListPageControl* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {
    	return nil; _logos_orig$HideDots13$SBIconListPageControl$initWithFrame$(self, _cmd, frame);
}



static CSPageControl* _logos_method$HideDots13$CSPageControl$initWithFrame$(_LOGOS_SELF_TYPE_INIT CSPageControl* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {
  return nil; _logos_orig$HideDots13$CSPageControl$initWithFrame$(self, _cmd, frame);
}





static void (*_logos_orig$hidedockbackground$SBDockView$setBackgroundAlpha$)(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, double); static void _logos_method$hidedockbackground$SBDockView$setBackgroundAlpha$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST, SEL, double); 

static void _logos_method$hidedockbackground$SBDockView$setBackgroundAlpha$(_LOGOS_SELF_TYPE_NORMAL SBDockView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
	arg1 = 0;
	_logos_orig$hidedockbackground$SBDockView$setBackgroundAlpha$(self, _cmd, arg1);
}





static void (*_logos_orig$hidehomebar$MTLumaDodgePillSettings$setHeight$)(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillSettings* _LOGOS_SELF_CONST, SEL, float); static void _logos_method$hidehomebar$MTLumaDodgePillSettings$setHeight$(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillSettings* _LOGOS_SELF_CONST, SEL, float); static void (*_logos_orig$hidehomebar$MTLumaDodgePillView$setStyle$)(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillView* _LOGOS_SELF_CONST, SEL, long long); static void _logos_method$hidehomebar$MTLumaDodgePillView$setStyle$(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillView* _LOGOS_SELF_CONST, SEL, long long); 

static void _logos_method$hidehomebar$MTLumaDodgePillSettings$setHeight$(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, float arg1) {
	arg1 = 0;
	_logos_orig$hidehomebar$MTLumaDodgePillSettings$setHeight$(self, _cmd, arg1);
}


static void _logos_method$hidehomebar$MTLumaDodgePillView$setStyle$(_LOGOS_SELF_TYPE_NORMAL MTLumaDodgePillView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long arg1) {
	arg1 = 0;
	_logos_orig$hidehomebar$MTLumaDodgePillView$setStyle$(self, _cmd, arg1);
}





static void (*_logos_orig$hide3dline$_UIInterfaceActionBlankSeparatorView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionBlankSeparatorView* _LOGOS_SELF_CONST, SEL); static void _logos_method$hide3dline$_UIInterfaceActionBlankSeparatorView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionBlankSeparatorView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$hide3dline$_UIInterfaceActionVibrantSeparatorView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST, SEL); static void _logos_method$hide3dline$_UIInterfaceActionVibrantSeparatorView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST, SEL); 

static void _logos_method$hide3dline$_UIInterfaceActionBlankSeparatorView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionBlankSeparatorView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$hide3dline$_UIInterfaceActionBlankSeparatorView$didMoveToWindow(self, _cmd);
	self.hidden = YES;
}



static void _logos_method$hide3dline$_UIInterfaceActionVibrantSeparatorView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL _UIInterfaceActionVibrantSeparatorView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$hide3dline$_UIInterfaceActionVibrantSeparatorView$didMoveToWindow(self, _cmd);
	self.hidden = YES;
}






static BOOL (*_logos_orig$BatteryBuddy$_UIBatteryView$_shouldShowBolt)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$BatteryBuddy$_UIBatteryView$_shouldShowBolt(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static UIColor * (*_logos_orig$BatteryBuddy$_UIBatteryView$fillColor)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static UIColor * _logos_method$BatteryBuddy$_UIBatteryView$fillColor(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static CGFloat (*_logos_orig$BatteryBuddy$_UIBatteryView$chargePercent)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static CGFloat _logos_method$BatteryBuddy$_UIBatteryView$chargePercent(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static long long (*_logos_orig$BatteryBuddy$_UIBatteryView$chargingState)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static long long _logos_method$BatteryBuddy$_UIBatteryView$chargingState(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$BatteryBuddy$_UIBatteryView$_updateFillLayer)(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static void _logos_method$BatteryBuddy$_UIBatteryView$_updateFillLayer(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static void _logos_method$BatteryBuddy$_UIBatteryView$refreshIcon(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static void _logos_method$BatteryBuddy$_UIBatteryView$updateIconColor(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$BatteryBuddy$CSBatteryFillView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL CSBatteryFillView* _LOGOS_SELF_CONST, SEL); static void _logos_method$BatteryBuddy$CSBatteryFillView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL CSBatteryFillView* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled)(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST, SEL); 



static BOOL _logos_method$BatteryBuddy$_UIBatteryView$_shouldShowBolt(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	return NO;

}

static UIColor * _logos_method$BatteryBuddy$_UIBatteryView$fillColor(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	return [_logos_orig$BatteryBuddy$_UIBatteryView$fillColor(self, _cmd) colorWithAlphaComponent:0.25];
	
}

static CGFloat _logos_method$BatteryBuddy$_UIBatteryView$chargePercent(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	CGFloat orig = _logos_orig$BatteryBuddy$_UIBatteryView$chargePercent(self, _cmd);
	int actualPercentage = orig * 100;

	if (actualPercentage <= 20 && !isCharging)
		[batteryIconView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/sad.png"]];
	else if (actualPercentage <= 49 && !isCharging)
		[batteryIconView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/neutral.png"]];
	else if (actualPercentage > 49 && !isCharging)
		[batteryIconView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/happy.png"]];
	else if (isCharging)
		[batteryIconView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/happy.png"]];

	[self updateIconColor];

	return orig;

}

static long long _logos_method$BatteryBuddy$_UIBatteryView$chargingState(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	long long orig = _logos_orig$BatteryBuddy$_UIBatteryView$chargingState(self, _cmd);

	if (orig == 1) isCharging = YES;
	else isCharging = NO;

	[self refreshIcon];
	
	return orig;

}

static void _logos_method$BatteryBuddy$_UIBatteryView$_updateFillLayer(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	_logos_orig$BatteryBuddy$_UIBatteryView$_updateFillLayer(self, _cmd);

	[self chargingState];

}


static void _logos_method$BatteryBuddy$_UIBatteryView$refreshIcon(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 
	
	
	batteryIconView = nil;
	batteryChargerView = nil;
	for (UIImageView* imageView in [self subviews])
		[imageView removeFromSuperview];

	
	if (!batteryIconView) {
		batteryIconView = [[UIImageView alloc] initWithFrame:[self bounds]];
		[batteryIconView setContentMode:UIViewContentModeScaleAspectFill];
		[batteryIconView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		if (![batteryIconView isDescendantOfView:self]) [self addSubview:batteryIconView];
	}

	
	if (!batteryChargerView && isCharging) {
		batteryChargerView = [[UIImageView alloc] initWithFrame:[self bounds]];
		[batteryChargerView setContentMode:UIViewContentModeScaleAspectFill];
		[batteryChargerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[batteryChargerView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/charger.png"]];
		if (![batteryChargerView isDescendantOfView:self]) [self addSubview:batteryChargerView];
	}

	[self chargePercent];

}


static void _logos_method$BatteryBuddy$_UIBatteryView$updateIconColor(_LOGOS_SELF_TYPE_NORMAL _UIBatteryView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	batteryIconView.image = [batteryIconView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	batteryChargerView.image = [batteryChargerView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	if (!isLowPowerModeActive) {
		[batteryIconView setTintColor:[UIColor labelColor]];
		[batteryChargerView setTintColor:[UIColor labelColor]];
	} else {
		[batteryIconView setTintColor:[UIColor blackColor]];
		[batteryChargerView setTintColor:[UIColor blackColor]];
	}

}





static void _logos_method$BatteryBuddy$CSBatteryFillView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL CSBatteryFillView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	_logos_orig$BatteryBuddy$CSBatteryFillView$didMoveToWindow(self, _cmd);

	[[self superview] setClipsToBounds:NO];

	
	if (!LSBatteryIconView) {
		LSBatteryIconView = [[UIImageView alloc] initWithFrame:[self bounds]];
		[LSBatteryIconView setContentMode:UIViewContentModeScaleAspectFill];
		[LSBatteryIconView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[LSBatteryIconView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/happyLS.png"]];
	}
	LSBatteryIconView.image = [LSBatteryIconView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	[LSBatteryIconView setTintColor:[UIColor whiteColor]];
	if (![LSBatteryIconView isDescendantOfView:[self superview]]) [[self superview] addSubview:LSBatteryIconView];

	
	if (!LSBatteryChargerView) {
		LSBatteryChargerView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x - 25, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
		[LSBatteryChargerView setContentMode:UIViewContentModeScaleAspectFill];
		[LSBatteryChargerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[LSBatteryChargerView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/chargerLS.png"]];
	}
	LSBatteryChargerView.image = [LSBatteryChargerView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	[LSBatteryChargerView setTintColor:[UIColor whiteColor]];
	if (![LSBatteryChargerView isDescendantOfView:[self superview]]) [[self superview] addSubview:LSBatteryChargerView];

}





static BOOL _logos_method$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled(_LOGOS_SELF_TYPE_NORMAL NSProcessInfo* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { 

	isLowPowerModeActive = _logos_orig$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled(self, _cmd);

	return isLowPowerModeActive;

}









static bool (*_logos_orig$LS$CSQuickActionsViewController$hasFlashlight)(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsViewController* _LOGOS_SELF_CONST, SEL); static bool _logos_method$LS$CSQuickActionsViewController$hasFlashlight(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsViewController* _LOGOS_SELF_CONST, SEL); static bool (*_logos_orig$LS$CSQuickActionsViewController$hasCamera)(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsViewController* _LOGOS_SELF_CONST, SEL); static bool _logos_method$LS$CSQuickActionsViewController$hasCamera(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$LS$CSProudLockViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL CSProudLockViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$LS$CSProudLockViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL CSProudLockViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$LS$DNDNotificationsService$_queue_postOrRemoveNotificationWithUpdatedBehavior$significantTimeChange$)(_LOGOS_SELF_TYPE_NORMAL DNDNotificationsService* _LOGOS_SELF_CONST, SEL, bool, bool); static void _logos_method$LS$DNDNotificationsService$_queue_postOrRemoveNotificationWithUpdatedBehavior$significantTimeChange$(_LOGOS_SELF_TYPE_NORMAL DNDNotificationsService* _LOGOS_SELF_CONST, SEL, bool, bool); 

	static bool _logos_method$LS$CSQuickActionsViewController$hasFlashlight(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
		return !LSflash;
	}
	static bool _logos_method$LS$CSQuickActionsViewController$hasCamera(_LOGOS_SELF_TYPE_NORMAL CSQuickActionsViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
		return !LScamera;
	}



static void _logos_method$LS$CSProudLockViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL CSProudLockViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
if(!LSicon){
		_logos_orig$LS$CSProudLockViewController$viewDidLoad(self, _cmd);
}
}



static void _logos_method$LS$DNDNotificationsService$_queue_postOrRemoveNotificationWithUpdatedBehavior$significantTimeChange$(_LOGOS_SELF_TYPE_NORMAL DNDNotificationsService* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, bool arg1, bool arg2) {
	if(nodndbanner){
	arg2 = YES;
	_logos_orig$LS$DNDNotificationsService$_queue_postOrRemoveNotificationWithUpdatedBehavior$significantTimeChange$(self, _cmd, arg1, arg2);
	}else{
_logos_orig$LS$DNDNotificationsService$_queue_postOrRemoveNotificationWithUpdatedBehavior$significantTimeChange$(self, _cmd, arg1, arg2);
	}
}








static void (*_logos_orig$dooubletaptolock$SBIconListView$touchesEnded$withEvent$)(_LOGOS_SELF_TYPE_NORMAL SBIconListView* _LOGOS_SELF_CONST, SEL, NSSet *, UIEvent *); static void _logos_method$dooubletaptolock$SBIconListView$touchesEnded$withEvent$(_LOGOS_SELF_TYPE_NORMAL SBIconListView* _LOGOS_SELF_CONST, SEL, NSSet *, UIEvent *); 

  static void _logos_method$dooubletaptolock$SBIconListView$touchesEnded$withEvent$(_LOGOS_SELF_TYPE_NORMAL SBIconListView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSSet * touches, UIEvent * event) {
    if ([[touches anyObject] tapCount] == 2) [(SpringBoard *)[_logos_static_class_lookup$SpringBoard() sharedApplication] _simulateLockButtonPress];
  }





static __attribute__((constructor)) void _logosLocalCtor_1db6d3a7(int __unused argc, char __unused **argv, char __unused **envp) {
	loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.icraze.notodayview13prefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);



	if(enabled){
		{Class _logos_class$LS$CSQuickActionsViewController = objc_getClass("CSQuickActionsViewController"); { MSHookMessageEx(_logos_class$LS$CSQuickActionsViewController, @selector(hasFlashlight), (IMP)&_logos_method$LS$CSQuickActionsViewController$hasFlashlight, (IMP*)&_logos_orig$LS$CSQuickActionsViewController$hasFlashlight);}{ MSHookMessageEx(_logos_class$LS$CSQuickActionsViewController, @selector(hasCamera), (IMP)&_logos_method$LS$CSQuickActionsViewController$hasCamera, (IMP*)&_logos_orig$LS$CSQuickActionsViewController$hasCamera);}Class _logos_class$LS$CSProudLockViewController = objc_getClass("CSProudLockViewController"); { MSHookMessageEx(_logos_class$LS$CSProudLockViewController, @selector(viewDidLoad), (IMP)&_logos_method$LS$CSProudLockViewController$viewDidLoad, (IMP*)&_logos_orig$LS$CSProudLockViewController$viewDidLoad);}Class _logos_class$LS$DNDNotificationsService = objc_getClass("DNDNotificationsService"); { MSHookMessageEx(_logos_class$LS$DNDNotificationsService, @selector(_queue_postOrRemoveNotificationWithUpdatedBehavior:significantTimeChange:), (IMP)&_logos_method$LS$DNDNotificationsService$_queue_postOrRemoveNotificationWithUpdatedBehavior$significantTimeChange$, (IMP*)&_logos_orig$LS$DNDNotificationsService$_queue_postOrRemoveNotificationWithUpdatedBehavior$significantTimeChange$);}}

	if (kEnableOnHomescreen) {
		{Class _logos_class$HS$SBRootFolderView = objc_getClass("SBRootFolderView"); { MSHookMessageEx(_logos_class$HS$SBRootFolderView, @selector(didMoveToWindow), (IMP)&_logos_method$HS$SBRootFolderView$didMoveToWindow, (IMP*)&_logos_orig$HS$SBRootFolderView$didMoveToWindow);}}
	}
	if (kEnableOnLockscreen) {
		{Class _logos_class$LSfuyi$SBMainDisplayPolicyAggregator = objc_getClass("SBMainDisplayPolicyAggregator"); { MSHookMessageEx(_logos_class$LSfuyi$SBMainDisplayPolicyAggregator, @selector(_allowsCapabilityLockScreenTodayViewWithExplanation:), (IMP)&_logos_method$LSfuyi$SBMainDisplayPolicyAggregator$_allowsCapabilityLockScreenTodayViewWithExplanation$, (IMP*)&_logos_orig$LSfuyi$SBMainDisplayPolicyAggregator$_allowsCapabilityLockScreenTodayViewWithExplanation$);}}
	}
	if (hideswitchlabel13) {
		{Class _logos_class$hideswitchlabel13$SBFluidSwitcherItemContainerHeaderView = objc_getClass("SBFluidSwitcherItemContainerHeaderView"); { MSHookMessageEx(_logos_class$hideswitchlabel13$SBFluidSwitcherItemContainerHeaderView, @selector(setTextAlpha:), (IMP)&_logos_method$hideswitchlabel13$SBFluidSwitcherItemContainerHeaderView$setTextAlpha$, (IMP*)&_logos_orig$hideswitchlabel13$SBFluidSwitcherItemContainerHeaderView$setTextAlpha$);}}
	}
	if (hideHSlabel13) {
		{Class _logos_class$hideHSlabel13$SBIconLabelImageParametersBuilder = objc_getClass("SBIconLabelImageParametersBuilder"); { MSHookMessageEx(_logos_class$hideHSlabel13$SBIconLabelImageParametersBuilder, @selector(_scale), (IMP)&_logos_method$hideHSlabel13$SBIconLabelImageParametersBuilder$_scale, (IMP*)&_logos_orig$hideHSlabel13$SBIconLabelImageParametersBuilder$_scale);}Class _logos_class$hideHSlabel13$SBIconView = objc_getClass("SBIconView"); { MSHookMessageEx(_logos_class$hideHSlabel13$SBIconView, @selector(setLabelHidden:), (IMP)&_logos_method$hideHSlabel13$SBIconView$setLabelHidden$, (IMP*)&_logos_orig$hideHSlabel13$SBIconView$setLabelHidden$);}Class _logos_class$hideHSlabel13$SBMutableIconLabelImageParameters = objc_getClass("SBMutableIconLabelImageParameters"); { MSHookMessageEx(_logos_class$hideHSlabel13$SBMutableIconLabelImageParameters, @selector(setText:), (IMP)&_logos_method$hideHSlabel13$SBMutableIconLabelImageParameters$setText$, (IMP*)&_logos_orig$hideHSlabel13$SBMutableIconLabelImageParameters$setText$);}}
	}
	if (hide3dwidghts) {
		{Class _logos_class$hide3dwidghts$SBHHomeScreenSettings = objc_getClass("SBHHomeScreenSettings"); { MSHookMessageEx(_logos_class$hide3dwidghts$SBHHomeScreenSettings, @selector(showWidgets), (IMP)&_logos_method$hide3dwidghts$SBHHomeScreenSettings$showWidgets, (IMP*)&_logos_orig$hide3dwidghts$SBHHomeScreenSettings$showWidgets);}Class _logos_class$hide3dwidghts$SBUIAppIconForceTouchController = objc_getClass("SBUIAppIconForceTouchController"); { MSHookMessageEx(_logos_class$hide3dwidghts$SBUIAppIconForceTouchController, @selector(_widgetViewControllerForDataProvider:), (IMP)&_logos_method$hide3dwidghts$SBUIAppIconForceTouchController$_widgetViewControllerForDataProvider$, (IMP*)&_logos_orig$hide3dwidghts$SBUIAppIconForceTouchController$_widgetViewControllerForDataProvider$);}Class _logos_class$hide3dwidghts$SBUIAppIconForceTouchShortcutViewController = objc_getClass("SBUIAppIconForceTouchShortcutViewController"); { MSHookMessageEx(_logos_class$hide3dwidghts$SBUIAppIconForceTouchShortcutViewController, @selector(setIconPosition:), (IMP)&_logos_method$hide3dwidghts$SBUIAppIconForceTouchShortcutViewController$setIconPosition$, (IMP*)&_logos_orig$hide3dwidghts$SBUIAppIconForceTouchShortcutViewController$setIconPosition$);}}
	}

	if (batterypercent) {
		{Class _logos_class$batterypercent$_UIBatteryView = objc_getClass("_UIBatteryView"); { MSHookMessageEx(_logos_class$batterypercent$_UIBatteryView, @selector(setShowsPercentage:), (IMP)&_logos_method$batterypercent$_UIBatteryView$setShowsPercentage$, (IMP*)&_logos_orig$batterypercent$_UIBatteryView$setShowsPercentage$);}{ MSHookMessageEx(_logos_class$batterypercent$_UIBatteryView, @selector(setShowsInlineChargingIndicator:), (IMP)&_logos_method$batterypercent$_UIBatteryView$setShowsInlineChargingIndicator$, (IMP*)&_logos_orig$batterypercent$_UIBatteryView$setShowsInlineChargingIndicator$);}}
	}
	if (breadcrumbs) {
		{Class _logos_class$breadcrumbs$SBMainDisplaySceneLayoutStatusBarView = objc_getClass("SBMainDisplaySceneLayoutStatusBarView"); { MSHookMessageEx(_logos_class$breadcrumbs$SBMainDisplaySceneLayoutStatusBarView, @selector(updateBreadcrumbActionIfNecessary), (IMP)&_logos_method$breadcrumbs$SBMainDisplaySceneLayoutStatusBarView$updateBreadcrumbActionIfNecessary, (IMP*)&_logos_orig$breadcrumbs$SBMainDisplaySceneLayoutStatusBarView$updateBreadcrumbActionIfNecessary);}}
	}
	if (hideupdatedot) {
		{Class _logos_class$hideupdatedot$SBIconView = objc_getClass("SBIconView"); { MSHookMessageEx(_logos_class$hideupdatedot$SBIconView, @selector(setLabelAccessoryHidden:), (IMP)&_logos_method$hideupdatedot$SBIconView$setLabelAccessoryHidden$, (IMP*)&_logos_orig$hideupdatedot$SBIconView$setLabelAccessoryHidden$);}{ MSHookMessageEx(_logos_class$hideupdatedot$SBIconView, @selector(allowsLabelAccessoryView), (IMP)&_logos_method$hideupdatedot$SBIconView$allowsLabelAccessoryView, (IMP*)&_logos_orig$hideupdatedot$SBIconView$allowsLabelAccessoryView);}Class _logos_class$hideupdatedot$_SBIconListViewDataDraggingContext = objc_getClass("_SBIconListViewDataDraggingContext"); { MSHookMessageEx(_logos_class$hideupdatedot$_SBIconListViewDataDraggingContext, @selector(iconView), (IMP)&_logos_method$hideupdatedot$_SBIconListViewDataDraggingContext$iconView, (IMP*)&_logos_orig$hideupdatedot$_SBIconListViewDataDraggingContext$iconView);}}
	}
	if (enabledrap) {
		{Class _logos_class$enabledrap$PXDragAndDropSettings = objc_getClass("PXDragAndDropSettings"); { MSHookMessageEx(_logos_class$enabledrap$PXDragAndDropSettings, @selector(dragOutEnabled), (IMP)&_logos_method$enabledrap$PXDragAndDropSettings$dragOutEnabled, (IMP*)&_logos_orig$enabledrap$PXDragAndDropSettings$dragOutEnabled);}Class _logos_class$enabledrap$T1TwitterPatchedSwiftClassNameT1Application = objc_getClass("T1TwitterPatchedSwiftClassNameT1Application"); { MSHookMessageEx(_logos_class$enabledrap$T1TwitterPatchedSwiftClassNameT1Application, @selector(isDragAndDropEnabled), (IMP)&_logos_method$enabledrap$T1TwitterPatchedSwiftClassNameT1Application$isDragAndDropEnabled, (IMP*)&_logos_orig$enabledrap$T1TwitterPatchedSwiftClassNameT1Application$isDragAndDropEnabled);}Class _logos_class$enabledrap$UIDragInteraction = objc_getClass("UIDragInteraction"); { MSHookMessageEx(_logos_class$enabledrap$UIDragInteraction, @selector(isEnabled), (IMP)&_logos_method$enabledrap$UIDragInteraction$isEnabled, (IMP*)&_logos_orig$enabledrap$UIDragInteraction$isEnabled);}Class _logos_class$enabledrap$YTSettings = objc_getClass("YTSettings"); { MSHookMessageEx(_logos_class$enabledrap$YTSettings, @selector(isDragDropEnabled), (IMP)&_logos_method$enabledrap$YTSettings$isDragDropEnabled, (IMP*)&_logos_orig$enabledrap$YTSettings$isDragDropEnabled);}Class _logos_class$enabledrap$_UIDraggingSession = objc_getClass("_UIDraggingSession"); { MSHookMessageEx(_logos_class$enabledrap$_UIDraggingSession, @selector(_shouldCancelOnAppDeactivation), (IMP)&_logos_method$enabledrap$_UIDraggingSession$_shouldCancelOnAppDeactivation, (IMP*)&_logos_orig$enabledrap$_UIDraggingSession$_shouldCancelOnAppDeactivation);}Class _logos_class$enabledrap$_UIInternalDraggingSessionSource = objc_getClass("_UIInternalDraggingSessionSource"); { MSHookMessageEx(_logos_class$enabledrap$_UIInternalDraggingSessionSource, @selector(shouldCancelOnAppDeactivation), (IMP)&_logos_method$enabledrap$_UIInternalDraggingSessionSource$shouldCancelOnAppDeactivation, (IMP*)&_logos_orig$enabledrap$_UIInternalDraggingSessionSource$shouldCancelOnAppDeactivation);}}
	}
	if (hideweathercource) {
		{Class _logos_class$hideweathercource$WGWidgetAttributionView = objc_getClass("WGWidgetAttributionView"); { MSHookMessageEx(_logos_class$hideweathercource$WGWidgetAttributionView, @selector(initWithWidgetAttributedString:), (IMP)&_logos_method$hideweathercource$WGWidgetAttributionView$initWithWidgetAttributedString$, (IMP*)&_logos_orig$hideweathercource$WGWidgetAttributionView$initWithWidgetAttributedString$);}{ MSHookMessageEx(_logos_class$hideweathercource$WGWidgetAttributionView, @selector(_configureAttributedString), (IMP)&_logos_method$hideweathercource$WGWidgetAttributionView$_configureAttributedString, (IMP*)&_logos_orig$hideweathercource$WGWidgetAttributionView$_configureAttributedString);}}
	}
	if (hidewidghtline) {
		{Class _logos_class$hidewidghtline$SBUIActionKeylineView = objc_getClass("SBUIActionKeylineView"); { MSHookMessageEx(_logos_class$hidewidghtline$SBUIActionKeylineView, @selector(intrinsicContentSize), (IMP)&_logos_method$hidewidghtline$SBUIActionKeylineView$intrinsicContentSize, (IMP*)&_logos_orig$hidewidghtline$SBUIActionKeylineView$intrinsicContentSize);}{ MSHookMessageEx(_logos_class$hidewidghtline$SBUIActionKeylineView, @selector(didMoveToSuperview), (IMP)&_logos_method$hidewidghtline$SBUIActionKeylineView$didMoveToSuperview, (IMP*)&_logos_orig$hidewidghtline$SBUIActionKeylineView$didMoveToSuperview);}Class _logos_class$hidewidghtline$_UIInterfaceActionBlankSeparatorView = objc_getClass("_UIInterfaceActionBlankSeparatorView"); { MSHookMessageEx(_logos_class$hidewidghtline$_UIInterfaceActionBlankSeparatorView, @selector(setConstantAxisDimension:), (IMP)&_logos_method$hidewidghtline$_UIInterfaceActionBlankSeparatorView$setConstantAxisDimension$, (IMP*)&_logos_orig$hidewidghtline$_UIInterfaceActionBlankSeparatorView$setConstantAxisDimension$);}}
	}
	if (DisableSwitcherAppSuggestion) {
		{Class _logos_class$DisableSwitcherAppSuggestion$SBSwitcherAppSuggestionViewController = objc_getClass("SBSwitcherAppSuggestionViewController"); { MSHookMessageEx(_logos_class$DisableSwitcherAppSuggestion$SBSwitcherAppSuggestionViewController, @selector(setBestAppSuggestion:), (IMP)&_logos_method$DisableSwitcherAppSuggestion$SBSwitcherAppSuggestionViewController$setBestAppSuggestion$, (IMP*)&_logos_orig$DisableSwitcherAppSuggestion$SBSwitcherAppSuggestionViewController$setBestAppSuggestion$);}}
	}
	if (HideDots13) {
		{Class _logos_class$HideDots13$SBIconListPageControl = objc_getClass("SBIconListPageControl"); { MSHookMessageEx(_logos_class$HideDots13$SBIconListPageControl, @selector(initWithFrame:), (IMP)&_logos_method$HideDots13$SBIconListPageControl$initWithFrame$, (IMP*)&_logos_orig$HideDots13$SBIconListPageControl$initWithFrame$);}Class _logos_class$HideDots13$CSPageControl = objc_getClass("CSPageControl"); { MSHookMessageEx(_logos_class$HideDots13$CSPageControl, @selector(initWithFrame:), (IMP)&_logos_method$HideDots13$CSPageControl$initWithFrame$, (IMP*)&_logos_orig$HideDots13$CSPageControl$initWithFrame$);}}
	}
	if (hidedockbackground) {
		{Class _logos_class$hidedockbackground$SBDockView = objc_getClass("SBDockView"); { MSHookMessageEx(_logos_class$hidedockbackground$SBDockView, @selector(setBackgroundAlpha:), (IMP)&_logos_method$hidedockbackground$SBDockView$setBackgroundAlpha$, (IMP*)&_logos_orig$hidedockbackground$SBDockView$setBackgroundAlpha$);}}
	}
	if (hidehomebar) {
		{Class _logos_class$hidehomebar$MTLumaDodgePillSettings = objc_getClass("MTLumaDodgePillSettings"); { MSHookMessageEx(_logos_class$hidehomebar$MTLumaDodgePillSettings, @selector(setHeight:), (IMP)&_logos_method$hidehomebar$MTLumaDodgePillSettings$setHeight$, (IMP*)&_logos_orig$hidehomebar$MTLumaDodgePillSettings$setHeight$);}Class _logos_class$hidehomebar$MTLumaDodgePillView = objc_getClass("MTLumaDodgePillView"); { MSHookMessageEx(_logos_class$hidehomebar$MTLumaDodgePillView, @selector(setStyle:), (IMP)&_logos_method$hidehomebar$MTLumaDodgePillView$setStyle$, (IMP*)&_logos_orig$hidehomebar$MTLumaDodgePillView$setStyle$);}}
	}
	if (hide3dline) {
		{Class _logos_class$hide3dline$_UIInterfaceActionBlankSeparatorView = objc_getClass("_UIInterfaceActionBlankSeparatorView"); { MSHookMessageEx(_logos_class$hide3dline$_UIInterfaceActionBlankSeparatorView, @selector(didMoveToWindow), (IMP)&_logos_method$hide3dline$_UIInterfaceActionBlankSeparatorView$didMoveToWindow, (IMP*)&_logos_orig$hide3dline$_UIInterfaceActionBlankSeparatorView$didMoveToWindow);}Class _logos_class$hide3dline$_UIInterfaceActionVibrantSeparatorView = objc_getClass("_UIInterfaceActionVibrantSeparatorView"); { MSHookMessageEx(_logos_class$hide3dline$_UIInterfaceActionVibrantSeparatorView, @selector(didMoveToWindow), (IMP)&_logos_method$hide3dline$_UIInterfaceActionVibrantSeparatorView$didMoveToWindow, (IMP*)&_logos_orig$hide3dline$_UIInterfaceActionVibrantSeparatorView$didMoveToWindow);}}
	}
	if(BatteryBuddy){
		{Class _logos_class$BatteryBuddy$_UIBatteryView = objc_getClass("_UIBatteryView"); { MSHookMessageEx(_logos_class$BatteryBuddy$_UIBatteryView, @selector(_shouldShowBolt), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$_shouldShowBolt, (IMP*)&_logos_orig$BatteryBuddy$_UIBatteryView$_shouldShowBolt);}{ MSHookMessageEx(_logos_class$BatteryBuddy$_UIBatteryView, @selector(fillColor), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$fillColor, (IMP*)&_logos_orig$BatteryBuddy$_UIBatteryView$fillColor);}{ MSHookMessageEx(_logos_class$BatteryBuddy$_UIBatteryView, @selector(chargePercent), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$chargePercent, (IMP*)&_logos_orig$BatteryBuddy$_UIBatteryView$chargePercent);}{ MSHookMessageEx(_logos_class$BatteryBuddy$_UIBatteryView, @selector(chargingState), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$chargingState, (IMP*)&_logos_orig$BatteryBuddy$_UIBatteryView$chargingState);}{ MSHookMessageEx(_logos_class$BatteryBuddy$_UIBatteryView, @selector(_updateFillLayer), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$_updateFillLayer, (IMP*)&_logos_orig$BatteryBuddy$_UIBatteryView$_updateFillLayer);}{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$BatteryBuddy$_UIBatteryView, @selector(refreshIcon), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$refreshIcon, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$BatteryBuddy$_UIBatteryView, @selector(updateIconColor), (IMP)&_logos_method$BatteryBuddy$_UIBatteryView$updateIconColor, _typeEncoding); }Class _logos_class$BatteryBuddy$CSBatteryFillView = objc_getClass("CSBatteryFillView"); { MSHookMessageEx(_logos_class$BatteryBuddy$CSBatteryFillView, @selector(didMoveToWindow), (IMP)&_logos_method$BatteryBuddy$CSBatteryFillView$didMoveToWindow, (IMP*)&_logos_orig$BatteryBuddy$CSBatteryFillView$didMoveToWindow);}Class _logos_class$BatteryBuddy$NSProcessInfo = objc_getClass("NSProcessInfo"); { MSHookMessageEx(_logos_class$BatteryBuddy$NSProcessInfo, @selector(isLowPowerModeEnabled), (IMP)&_logos_method$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled, (IMP*)&_logos_orig$BatteryBuddy$NSProcessInfo$isLowPowerModeEnabled);}}
		}

	if(dooubletaptolock){
		{Class _logos_class$dooubletaptolock$SBIconListView = objc_getClass("SBIconListView"); { MSHookMessageEx(_logos_class$dooubletaptolock$SBIconListView, @selector(touchesEnded:withEvent:), (IMP)&_logos_method$dooubletaptolock$SBIconListView$touchesEnded$withEvent$, (IMP*)&_logos_orig$dooubletaptolock$SBIconListView$touchesEnded$withEvent$);}}
		}
	if(hidebreadcrumb){
		{Class _logos_class$hidebreadcrumb$SBDeviceApplicationSceneStatusBarBreadcrumbProvider = objc_getClass("SBDeviceApplicationSceneStatusBarBreadcrumbProvider"); Class _logos_metaclass$hidebreadcrumb$SBDeviceApplicationSceneStatusBarBreadcrumbProvider = object_getClass(_logos_class$hidebreadcrumb$SBDeviceApplicationSceneStatusBarBreadcrumbProvider); { MSHookMessageEx(_logos_metaclass$hidebreadcrumb$SBDeviceApplicationSceneStatusBarBreadcrumbProvider, @selector(_shouldAddBreadcrumbToActivatingSceneEntity:sceneHandle:withTransitionContext:), (IMP)&_logos_meta_method$hidebreadcrumb$SBDeviceApplicationSceneStatusBarBreadcrumbProvider$_shouldAddBreadcrumbToActivatingSceneEntity$sceneHandle$withTransitionContext$, (IMP*)&_logos_meta_orig$hidebreadcrumb$SBDeviceApplicationSceneStatusBarBreadcrumbProvider$_shouldAddBreadcrumbToActivatingSceneEntity$sceneHandle$withTransitionContext$);}}
		}








	}
	}
