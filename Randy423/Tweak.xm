#import <UIKit/UIKit.h>

%hook ADAppAdvertisement
- (void)setAdData:(id)arg1 {
	%orig;
}
%end

%hook ADAppRepresentation
- (void)setAdamID:(id)arg1 {
	%orig;
}
%end

%hook ADCapService
- (id)init {
	return NULL;
}
%end

%hook ADDataObject
- (void)setAdData:(id)arg1 {
	%orig;
}
%end

%hook ADLocationManager
- (void)setLocationManager:(id)arg1 {
	%orig;
}
%end

%hook ADMetricManager
- (id)init {
	return NULL;
}
%end

%hook ADParameterFactory
- (id)init {
	return NULL;
}
%end

%hook ADSearchObject
- (id)init {
	return NULL;
}
%end

%hook ADSearchSession
- (void)setCapService:(id)arg1 {
	%orig;
}
%end

%hook ADTrackingTransparency
- (bool)crossAppTrackingAllowed {
	return NO;
}

- (bool)personalizedAds {
	return NO;
}
%end

%hook AVPlayerController
- (bool)isMuted {
	return YES;
}
%end

%hook AppStorePatchedSwiftClassNameSearchTextField
- (void)layoutSubviews {
	%orig;
}
%end

%hook FLPatch
- (id)apiVersion {
	return @"2";
}
%end

%ctor {
	%init(AppStorePatchedSwiftClassNameSearchTextField = objc_getClass("AppStore.SearchTextField"));

}