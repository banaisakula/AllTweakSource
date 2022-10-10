// iOS 10 - 12
%hook SBIconController
-(id)appIconForceTouchController:(id)arg1 applicationShortcutWidgetBundleIdentifierForGestureRecognizer:(id)arg2 {
	return nil;
}
%end

%hook SBUIAppIconForceTouchController
-(id)_widgetViewControllerForDataProvider:(id)arg1 {
	return nil;
}
%end

// iOS 13
%hook SBHHomeScreenSettings
-(BOOL)showWidgets {
	return NO;
}
%end
