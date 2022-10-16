#import <UIKit/UIKit.h>
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.icraze.notodayview13prefs.plist"


static BOOL diandian;

static void loadPrefs() {
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
	diandian = [prefs objectForKey:@"diandian"] ? [[prefs objectForKey:@"diandian"] boolValue] : YES;
}


%group diandian

%hook BUNativeExpressAdView
- (void)_initPlayer {

}

- (id)nativeAd {
	return NULL;
}

- (void)setNativeAd:(id)arg1 {

}
%end

%hook DCSplashAdView
- (void)loadAdData {

}

- (void)setDcloudAd:(id)arg1 {

}

- (void)setAdHttp:(id)arg1 {

}

- (void)setAdStore:(id)arg1 {
	%orig;
}

- (void)setAdLabel:(id)arg1 {
	%orig;
}
%end

%hook KSAdInterstitialCollectionView
- (void)preloadAdView {

}

- (void)setAdView:(id)arg1 {

}

- (void)setCollectionView:(id)arg1 {

}
%end

%hook KSAdTKCardView
- (void)layoutSubviews {

}
%end

%hook KSSplashAdView
- (void)setupAdData {
	%orig;
}

- (void)loadAdData {

}

- (float)validTimeInterval {
	return 0;
}
%end

%hook TKVideoPlayerView
- (void)layoutSubviews {

}
%end



%end


%ctor {
	loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.icraze.notodayview13prefs.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
		if(diandian){
		%init(diandian);
		}


    	}