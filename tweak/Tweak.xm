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


%group hidebreadcrumb
%hook SBDeviceApplicationSceneStatusBarBreadcrumbProvider
+(BOOL)_shouldAddBreadcrumbToActivatingSceneEntity:(id)arg1 sceneHandle:(id)arg2 withTransitionContext:(id)arg3
{
	return NO;
}
%end
%end





%group HS
%hook SBRootFolderView
-(void)didMoveToWindow {
	%orig;
	self.todayViewPageHidden = YES;
}
%end
%end

%group LSfuyi
%hook SBMainDisplayPolicyAggregator
-(bool)_allowsCapabilityLockScreenTodayViewWithExplanation:(id)arg1 {
	return NO;
}
%end
%end






%group hideswitchlabel13
//// Switcher - No Labels For iOS 13
%hook SBFluidSwitcherItemContainerHeaderView
- (void)setTextAlpha:(double)arg1 {
	arg1 = 0;
	RLog(@"Test log: %@", arg1);
	%orig;
}
%end
%end
%group hideHSlabel13
//// Icons - Label / Hidden
%hook SBIconLabelImageParametersBuilder
- (double)_scale {
	return 0;
}
%end

%hook SBIconView
- (void)setLabelHidden:(bool)arg1 {
	arg1 = YES;
	%orig;
}
%end

%hook SBMutableIconLabelImageParameters
- (void)setText:(id)arg1 {
	%orig;
}
%end
%end



%group hide3dwidghts
%hook SBHHomeScreenSettings
- (bool)showWidgets {
	return NO;
}
%end

%hook SBUIAppIconForceTouchController
- (id)_widgetViewControllerForDataProvider:(id)arg1 {
	arg1 = NULL;
	return NULL;
	return %orig;
}
%end

%hook SBUIAppIconForceTouchShortcutViewController
- (void)setIconPosition:(long long)arg1 {
	arg1 = 1;
	%orig;
}
%end
%end

%group batterypercent
%hook _UIBatteryView
- (void)setShowsPercentage:(bool)arg1 {
	arg1 = YES;

	%orig;
}

- (void)setShowsInlineChargingIndicator:(bool)arg1 {
	%orig;
}
%end
%end


%group breadcrumbs
%hook SBMainDisplaySceneLayoutStatusBarView
- (void)updateBreadcrumbActionIfNecessary {
	%orig;
}
%end
%end

%group hideupdatedot
////隐藏更新测试蓝黄点咸鱼吖
%hook SBIconView
- (void)setLabelAccessoryHidden:(bool)arg1 {
	arg1 = YES;
	%orig;
}

- (bool)allowsLabelAccessoryView {
	return NO;
}
%end

%hook _SBIconListViewDataDraggingContext
- (id)iconView {
	return %orig;
}
%end
%end

%group enabledrap
%hook PXDragAndDropSettings
- (bool)dragOutEnabled {
	return YES;
}
%end

%hook T1TwitterPatchedSwiftClassNameT1Application
- (bool)isDragAndDropEnabled {
	return YES;
}
%end

%hook UIDragInteraction
- (bool)isEnabled {
	return YES;
}
%end

%hook YTSettings
- (bool)isDragDropEnabled {
	return YES;
}
%end

%hook _UIDraggingSession
- (bool)_shouldCancelOnAppDeactivation {
	return YES;
}
%end

%hook _UIInternalDraggingSessionSource
- (bool)shouldCancelOnAppDeactivation {
	return NO;
}
%end
%end





%group hideweathercource
%hook WGWidgetAttributionView
- (id)initWithWidgetAttributedString:(id)arg1 {
	arg1 = NULL;
	return %orig;
}

- (void)_configureAttributedString {
	%orig;
}
%end
%end

%group hidewidghtline
%hook SBUIActionKeylineView
- (CGSize)intrinsicContentSize {
	return %orig;
}

- (void)didMoveToSuperview {
	%orig;
}
%end

%hook _UIInterfaceActionBlankSeparatorView
- (void)setConstantAxisDimension:(double)arg1 {
	%orig;
}
%end
%end


%group DisableSwitcherAppSuggestion
%hook SBSwitcherAppSuggestionViewController
- (void)setBestAppSuggestion:(id)arg1 {
	%orig;
}
%end
%end





%group HideDots13

%hook SBIconListPageControl
    - (id)initWithFrame:(CGRect)frame
    {
    	return nil; %orig;
}
%end
%hook CSPageControl
- (id)initWithFrame:(CGRect)frame
{
  return nil; %orig;
}
%end

%end


%group hidedockbackground
%hook SBDockView
- (void)setBackgroundAlpha:(double)arg1 {
	arg1 = 0;
	%orig;
}
%end
%end



%group hidehomebar
%hook MTLumaDodgePillSettings
- (void)setHeight:(float)arg1 {
	arg1 = 0;
	%orig;
}
%end
%hook MTLumaDodgePillView
- (void)setStyle:(long long)arg1 {
	arg1 = 0;
	%orig;
}
%end
%end



%group hide3dline
%hook _UIInterfaceActionBlankSeparatorView
- (void)didMoveToWindow {
	%orig;
	self.hidden = YES;
}
%end

%hook _UIInterfaceActionVibrantSeparatorView
- (void)didMoveToWindow {
	%orig;
	self.hidden = YES;
}
%end
%end




%group BatteryBuddy

%hook _UIBatteryView

- (BOOL)_shouldShowBolt { // hide charging bolt

	return NO;

}

- (UIColor *)fillColor { // get color and lower the opacity of the battery icon fill color

	return [%orig colorWithAlphaComponent:0.25];
	
}

- (CGFloat)chargePercent { // update face corresponding the battery percentage

	CGFloat orig = %orig;
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

- (long long)chargingState { // refresh icons when charging state changed

	long long orig = %orig;

	if (orig == 1) isCharging = YES;
	else isCharging = NO;

	[self refreshIcon];
	
	return orig;

}

- (void)_updateFillLayer { // update the icon

	%orig;

	[self chargingState];

}

%new
- (void)refreshIcon { // refresh status bar icons
	
	// remove existing images
	batteryIconView = nil;
	batteryChargerView = nil;
	for (UIImageView* imageView in [self subviews])
		[imageView removeFromSuperview];

	// face
	if (!batteryIconView) {
		batteryIconView = [[UIImageView alloc] initWithFrame:[self bounds]];
		[batteryIconView setContentMode:UIViewContentModeScaleAspectFill];
		[batteryIconView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		if (![batteryIconView isDescendantOfView:self]) [self addSubview:batteryIconView];
	}

	// charger
	if (!batteryChargerView && isCharging) {
		batteryChargerView = [[UIImageView alloc] initWithFrame:[self bounds]];
		[batteryChargerView setContentMode:UIViewContentModeScaleAspectFill];
		[batteryChargerView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[batteryChargerView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/charger.png"]];
		if (![batteryChargerView isDescendantOfView:self]) [self addSubview:batteryChargerView];
	}

	[self chargePercent];

}

%new
- (void)updateIconColor { // update icon color

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

%end

%hook CSBatteryFillView

- (void)didMoveToWindow { // add lockscreen battery icons

	%orig;

	[[self superview] setClipsToBounds:NO];

	// face
	if (!LSBatteryIconView) {
		LSBatteryIconView = [[UIImageView alloc] initWithFrame:[self bounds]];
		[LSBatteryIconView setContentMode:UIViewContentModeScaleAspectFill];
		[LSBatteryIconView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
		[LSBatteryIconView setImage:[UIImage imageWithContentsOfFile:@"/Library/BatteryBuddy/happyLS.png"]];
	}
	LSBatteryIconView.image = [LSBatteryIconView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	[LSBatteryIconView setTintColor:[UIColor whiteColor]];
	if (![LSBatteryIconView isDescendantOfView:[self superview]]) [[self superview] addSubview:LSBatteryIconView];

	// charger
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

%end

%hook NSProcessInfo

- (BOOL)isLowPowerModeEnabled { // check if low power mode is active

	isLowPowerModeActive = %orig;

	return isLowPowerModeActive;

}

%end

%end





%group  LS
%hook CSQuickActionsViewController
	- (bool)hasFlashlight {
		return !LSflash;
	}
	- (bool)hasCamera {
		return !LScamera;
	}
%end

%hook CSProudLockViewController
- (void)viewDidLoad {
if(!LSicon){
		%orig;
}
}
%end

%hook DNDNotificationsService
- (void)_queue_postOrRemoveNotificationWithUpdatedBehavior:(bool)arg1 significantTimeChange:(bool)arg2 {
	if(nodndbanner){
	arg2 = YES;
	%orig;
	}else{
%orig;
	}
}
%end

%end





%group dooubletaptolock
%hook SBIconListView
  - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([[touches anyObject] tapCount] == 2) [(SpringBoard *)[%c(SpringBoard) sharedApplication] _simulateLockButtonPress];
  }
%end
%end



%ctor {
	loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.yourcompany.learn.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);



	if(enabled){
		%init(LS);

	if (kEnableOnHomescreen) {
		%init(HS);
	}
	if (kEnableOnLockscreen) {
		%init(LSfuyi);
	}
	if (hideswitchlabel13) {
		%init(hideswitchlabel13);
	}
	if (hideHSlabel13) {
		%init(hideHSlabel13);
	}
	if (hide3dwidghts) {
		%init(hide3dwidghts);
	}

	if (batterypercent) {
		%init(batterypercent);
	}
	if (breadcrumbs) {
		%init(breadcrumbs);
	}
	if (hideupdatedot) {
		%init(hideupdatedot);
	}
	if (enabledrap) {
		%init(enabledrap);
	}
	if (hideweathercource) {
		%init(hideweathercource);
	}
	if (hidewidghtline) {
		%init(hidewidghtline);
	}
	if (DisableSwitcherAppSuggestion) {
		%init(DisableSwitcherAppSuggestion);
	}
	if (HideDots13) {
		%init(HideDots13);
	}
	if (hidedockbackground) {
		%init(hidedockbackground);
	}
	if (hidehomebar) {
		%init(hidehomebar);
	}
	if (hide3dline) {
		%init(hide3dline);
	}
	if(BatteryBuddy){
		%init(BatteryBuddy);
		}

	if(dooubletaptolock){
		%init(dooubletaptolock);
		}
	if(hidebreadcrumb){
		%init(hidebreadcrumb);
		}








	}
	}
