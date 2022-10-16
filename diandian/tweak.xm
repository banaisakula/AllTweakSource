#import <UIKit/UIKit.h>
%hook BUNativeExpressAdView
- (void)_initPlayer {
	%orig;
}

- (id)nativeAd {
	return NULL;
}

- (void)setNativeAd:(id)arg1 {
	%orig;
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

}

- (void)setAdLabel:(id)arg1 {

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