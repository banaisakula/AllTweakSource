#import <dlfcn.h>
#import "Imports.h"

#define YT_BUNDLE_ID @"com.google.ios.youtubemusic"
#define YT_NAME @"YouTube Music"

%group SettingsPage
%hook YTMAvatarAccountView
%property(nonatomic,strong) YTMUltimateSettingsController *YTMUltimateController;

- (void)setAccountMenuUpperButtons:(id)arg1 lowerButtons:(id)arg2 {
    
    UIImage *icon;
    if (@available(iOS 13, *)) {
        icon = [UIImage systemImageNamed:@"flame"];
    } else {
        icon = nil;
    }
    
    //Create the YTMusicUltimate button
    YTMAccountButton *button = [[%c(YTMAccountButton) alloc] initWithTitle:@"YTMusicUltimate" identifier:@"ytmult" icon:icon actionBlock:^(BOOL arg4){
        //Push YTMusicUltimate view controller.

        self.YTMUltimateController = [[YTMUltimateSettingsController alloc] init];
        [self._viewControllerForAncestor presentViewController:self.YTMUltimateController animated:YES completion:nil];
    }];

    button.tintColor = [UIColor redColor];

    //Add our custom button to the list.
    NSMutableArray *arrDown = [[NSMutableArray alloc] init];
    [arrDown addObjectsFromArray:arg2];
    [arrDown addObject:button];

    //Remove the subscribe to premium button.
    NSMutableArray *arrUp = [[NSMutableArray alloc] init];
    for (YTMAccountButton *yt_button in arg1) {
        if (![[yt_button.titleLabel text] containsString:@"Premium"]) {
            [arrUp addObject:yt_button];
        }
    }

    //Continue the function with our own parameters.
    %orig(arrUp, arrDown);
}
%end
%end

#pragma mark - Fix sideloading issues
%group SideloadingFixes
//Fix login (2) - Ginsu & AhmedBakfir
%hook SSOSafariSignIn
- (void)signInWithURL:(id)arg1 presentationAnchor:(id)arg2 completionHandler:(id)arg3 {
    NSURL *origURL = arg1;

    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithURL:origURL resolvingAgainstBaseURL:NO];
    NSMutableArray *newQueryItems = [urlComponents.queryItems mutableCopy];
    for (NSURLQueryItem *queryItem in urlComponents.queryItems) {
        if ([queryItem.name isEqualToString:@"system_version"]
            || [queryItem.name isEqualToString:@"app_version"]
            || [queryItem.name isEqualToString:@"kdlc"]
            || [queryItem.name isEqualToString:@"kss"]
            || [queryItem.name isEqualToString:@"lib_ver"]
            || [queryItem.name isEqualToString:@"device_model"]) {
            [newQueryItems removeObject:queryItem];
        }
    }
    urlComponents.queryItems = [newQueryItems copy];
    %orig(urlComponents.URL, arg2, arg3);
}
%end

//Force enable safari sign-in
%hook SSOConfiguration
- (BOOL)shouldEnableSafariSignIn {
    return YES;
}
%end

%hook SSOKeychainCore
//Thanks to jawshoeadan for this hook.
+ (id)accessGroup {
    NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge NSString *)kSecClassGenericPassword, (__bridge NSString *)kSecClass,
                           @"bundleSeedID", kSecAttrAccount,
                           @"", kSecAttrService,
                           (id)kCFBooleanTrue, kSecReturnAttributes,
                           nil];
    CFDictionaryRef result = nil;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
    if (status == errSecItemNotFound)
        status = SecItemAdd((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
    if (status != errSecSuccess)
        return nil;
    NSString *accessGroup = [(__bridge NSDictionary *)result objectForKey:(__bridge NSString *)kSecAttrAccessGroup];

    return accessGroup;
}

+ (id)sharedAccessGroup {
    NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge NSString *)kSecClassGenericPassword, (__bridge NSString *)kSecClass,
                           @"bundleSeedID", kSecAttrAccount,
                           @"", kSecAttrService,
                           (id)kCFBooleanTrue, kSecReturnAttributes,
                           nil];
    CFDictionaryRef result = nil;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
    if (status == errSecItemNotFound)
        status = SecItemAdd((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
    if (status != errSecSuccess)
        return nil;
    NSString *accessGroup = [(__bridge NSDictionary *)result objectForKey:(__bridge NSString *)kSecAttrAccessGroup];

    return accessGroup;
}
%end

%hook NSFileManager
- (NSURL *)containerURLForSecurityApplicationGroupIdentifier:(NSString *)groupIdentifier {
    if (groupIdentifier != nil) {
        NSArray *paths = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
        NSURL *documentsURL = [paths lastObject];
        return [documentsURL URLByAppendingPathComponent:@"AppGroup"];
    }
    return %orig(groupIdentifier);
}
%end

#pragma mark - Thanks PoomSmart for the following hooks
//IAmYouTube start
%hook YTVersionUtils
+ (NSString *)appName 
{
    return YT_NAME;
}

+ (NSString *)appID 
{
    return YT_BUNDLE_ID;
}
%end

%hook GCKBUtils
+ (NSString *)appIdentifier 
{
    return YT_BUNDLE_ID;
}
%end

%hook GPCDeviceInfo
+ (NSString *)bundleId 
{
    return YT_BUNDLE_ID;
}
%end

%hook OGLBundle
+ (NSString *)shortAppName 
{
    return YT_NAME;
}
%end

%hook GVROverlayView
+ (NSString *)appName 
{
    return YT_NAME;
}
%end

%hook OGLPhenotypeFlagServiceImpl
- (NSString *)bundleId 
{
    return YT_BUNDLE_ID;
}
%end

%hook APMAEU
+ (BOOL)isFAS 
{
    return YES;
}
%end

%hook GULAppEnvironmentUtil
+ (BOOL)isFromAppStore 
{
    return YES;
}
%end

%hook SSOConfiguration
- (id)initWithClientID:(id)clientID supportedAccountServices:(id)supportedAccountServices 
{
    self = %orig;
    [self setValue:YT_NAME forKey:@"_shortAppName"];
    [self setValue:YT_BUNDLE_ID forKey:@"_applicationIdentifier"];
    return self;
}
%end

%hook NSBundle
- (NSString *)bundleIdentifier 
{
    NSArray *address = [NSThread callStackReturnAddresses];
    Dl_info info = {0};
    if (dladdr((void *)[address[2] longLongValue], &info) == 0)
        return %orig;
    NSString *path = [NSString stringWithUTF8String:info.dli_fname];
    if ([path hasPrefix:NSBundle.mainBundle.bundlePath])
        return YT_BUNDLE_ID;
    return %orig;
}

- (id)objectForInfoDictionaryKey:(NSString *)key 
{
    if ([key isEqualToString:@"CFBundleIdentifier"])
        return YT_BUNDLE_ID;
    if ([key isEqualToString:@"CFBundleDisplayName"] || [key isEqualToString:@"CFBundleName"])
        return YT_NAME;
    return %orig;
}
%end
//IAmYouTube end
%end

#pragma mark - Enabling cast
%group Cast
%hook MDXFeatureFlags
- (BOOL)isCastCloudDiscoveryEnabled {
    return YES;
}

- (void)setIsCastCloudDiscoveryEnabled:(BOOL)enabled {
    %orig(YES);
}

- (BOOL)isCastToNativeEnabled {
    return YES;
}

- (void)setIsCastToNativeEnabled:(BOOL)enabled {
    %orig(YES);
}

- (BOOL)isCastEnabled {
    return YES;
}

- (void)setIsCastEnabled:(BOOL)enabled {
    %orig(YES);
}
%end

%hook YTColdConfig
- (BOOL)isCastToNativeEnabled {
    return YES;
}

- (void)setIsCastToNativeEnabled:(BOOL)enabled {
    %orig(YES);
}

- (BOOL)isPersistentCastIconEnabled {
    return YES;
}

- (void)setIsPersistentCastIconEnabled:(BOOL)enabled {
    %orig(YES);
}

- (BOOL)musicEnableSuggestedCastDevices {
    return YES;
}

- (void)setMusicEnableSuggestedCastDevices:(BOOL)suggest {
    %orig(YES);
}

- (BOOL)musicClientConfigEnableCastButtonOnPlayerHeader {
    return YES;
}

- (void)setMusicClientConfigEnableCastButtonOnPlayerHeader:(BOOL)enabled {
    %orig(YES);
}

- (BOOL)musicClientConfigEnableAudioOnlyCastingForNonMusicAudio {
    return YES;
}

- (void)setMusicClientConfigEnableAudioOnlyCastingForNonMusicAudio:(BOOL)enabled {
    %orig(YES);
}
%end

%hook YTMCastSessionController
- (id)premiumUpgradeAction {
    return nil;
}

- (void)showAudioCastUpsellDialog {
    return;
}

- (BOOL)isFreeTierAudioCastEnabled {
    return YES;
}

- (void)setIsFreeTierAudioCastEnabled:(BOOL)enabled {
    %orig(YES);
}

- (void)openMusicPremiumLandingPage {
    return;
}
%end

%hook YTMMusicAppMetadata
- (BOOL)isAudioCastEnabled {
    return YES;
}

- (void)setIsAudioCastEnabled:(BOOL)enabled {
    %orig(YES);
}
%end
%end

#pragma mark - Removing premium promos
%group EnsurePremiumStatus
%hook MDXFeatureFlags
- (BOOL)areMementoPromotionsEnabled {
    return NO;
}

- (void)setAreMementoPromotionsEnabled:(BOOL)enabled {
    %orig(NO);
}
%end

%hook YTColdConfig
- (BOOL)isPassiveSignInUniquePremiumValuePropEnabled {
    return YES;
}

- (void)setIsPassiveSignInUniquePremiumValuePropEnabled:(BOOL)enabled {
    %orig(YES);
}
%end

%hook YTIPlayabilityStatus
- (id)backgroundUpsell {
    return nil;
}

- (id)offlineUpsell {
    return nil;
}
%end

%hook YTMAppDelegate
- (void)showUpsellAlertWithTitle:(id)arg1 subtitle:(id)arg2 upgradeButtonTitle:(id)arg3 upsellURLString:(id)arg4 sourceApplication:(id)arg5 {
    return;
}
%end

%hook MDXPromotionManager
- (void)presentMementoPromotionIfTriggerConditionsAreSatisfied {
    return;
}

- (void)presentMementoPromotion:(long long)arg1 {
    return;
}
%end

%hook YTPlayerPromoController
- (void)showBackgroundabilityUpsell {
    return;
}

- (void)showBackgroundOnboardingHint {
    return;
}

- (void)showPipOnboardingHint {
    return;
}
%end

%hook YTMMusicAppMetadata
- (BOOL)isPremiumSubscriber{
    return YES;
}

- (void)setIsPremiumSubscriber:(BOOL)premium {
    %orig(YES);
}

- (id)sidePanelPromo{
    return nil;
}

-(id)unlimitedSettingsButton {
    return nil;
}

- (BOOL)isAudioOnlyButtonVisible {
    return YES;
}

%end

%hook YTPivotBarView
- (void)setRenderer:(YTIPivotBarRenderer *)renderer {
    NSMutableArray <YTIPivotBarSupportedRenderers *> *items = [renderer itemsArray];

    NSUInteger index = [items indexOfObjectPassingTest:^BOOL(YTIPivotBarSupportedRenderers *renderers, NSUInteger idx, BOOL *stop) {
        return [[[renderers pivotBarItemRenderer] pivotIdentifier] isEqualToString:@"SPunlimited"];
    }];
    if (index != NSNotFound) [items removeObjectAtIndex:index];
    %orig;
}
%end

%hook YTIShowFullscreenInterstitialCommand
-(BOOL)shouldThrottleInterstitial{
    return YES;
}

- (void)setShouldThrottleInterstitial:(BOOL)throttle {
    %orig(YES);
}
%end

%hook YTMAppResponder
- (void)presentInterstitialPromoForEvent:(id)event{
    return;
}

- (void)presentFullscreenPromoForEvent:(id)event{
    return;
}

- (void)presentInterstitialGridPromoForEvent:(id)event{
    return;
}
%end

%hook YTPromosheetController
- (void)presentPromosheetWithEvent:(id)event{
    return;
}
%end

%hook YTMCarPlayController
- (BOOL)isPremiumSubscriber{
    return YES;
}

- (void)setIsPremiumSubscriber:(BOOL)premium {
    %orig(YES);
}
%end

%hook YTMYPCGetOfflineUpsellEndpointCommandHandler
- (BOOL)isPremiumSubscriber{
    return YES;
}

- (void)setIsPremiumSubscriber:(BOOL)premium {
    %orig(YES);
}
%end
%end

#pragma mark - Background playback
%group BackgroundPlayback
%hook YTMBackgroundUpsellNotificationController
- (id)upsellNotificationTriggerOnBackground {
    return nil;
}

- (void)appDidEnterBackground:(id)arg1 {
    return;
}

- (void)maybeScheduleBackgroundUpsellNotification {
    %orig;
    [self removePendingBackgroundNotifications];
}
%end

%hook YTColdConfig
- (BOOL)disablePlaybackLockScreenController {
    return NO;
}

- (void)setDisablePlaybackLockScreenController:(BOOL)enabled {
    %orig(NO);
}

- (BOOL)enableIMPBackgroundableAudio {
    return YES;
}

- (void)setEnableIMPBackgroundableAudio:(BOOL)enabled {
    %orig(YES);
}
%end

%hook YTMMusicAppMetadata
- (BOOL)canPlayBackgroundableContent {
    return YES;
}

- (void)setCanPlayBackgroundableContent:(BOOL)playable {
    %orig(YES);
}
%end

%hook HAMPlayer
- (BOOL)allowsBackgroundPlayback {
    return YES;
}

- (void)setAllowsBackgroundPlayback:(BOOL)allow {
    %orig(YES);
}
%end

%hook YTPlayerStatus
- (id)initWithExternalPlayback:(_Bool)arg1 backgroundPlayback:(_Bool)arg2 inlinePlaybackActive:(_Bool)arg3 cardboardModeActive:(_Bool)arg4 layout:(int)arg5 userAudioOnlyModeActive:(_Bool)arg6 blackoutActive:(_Bool)arg7 clipID:(id)arg8 accountLinkState:(id)arg9 muted:(_Bool)arg10 pictureInPicture:(_Bool)arg11 {
    return %orig(YES, YES, YES, YES, arg5, NO, YES, arg8, arg9, arg10, arg11);
}

- (BOOL)backgroundPlayback {
    return YES;
}

- (void)setBackgroundPlayback:(BOOL)backgroundable {
    %orig(YES);
}
%end

%hook YTPlaybackData
- (BOOL)isPlayable {
    return YES;
}

- (BOOL)isPlayableInBackground {
    return YES;
}

- (void)setIsPlayableInBackground:(BOOL)playable {
    %orig(YES);
}
%end

%hook YTPlaybackBackgroundTaskController
- (BOOL)isContentPlayableInBackground {
    return YES;
}

- (void)setIsContentPlayableInBackground:(BOOL)playable {
    %orig(YES);
}
%end

%hook YTLocalPlaybackController
- (void)stopBackgroundPlayback {
    return;
}

- (void)updateForceDisableBackgroundingForVideo:(id)arg1 {
    return;
}

- (void)maybeStopBackgroundPlayback {
    return;
}

- (BOOL)isPlaybackBackgroundable {
    return YES;
}

- (void)setIsPlaybackBackgroundable:(BOOL)playable {
    %orig(YES);
}
%end

%hook YTIPlayabilityStatus
- (BOOL)isPlayable {
    return YES;
}

- (BOOL)isPlayableInBackground{
    return YES;
}

- (void)setIsPlayableInBackground:(BOOL)backgroundable {
    %orig(YES);
}
%end

%hook YTSingleVideo
- (BOOL)isPlayableInBackground{
    return YES;
}

- (void)setIsPlayableInBackground:(BOOL)backgroundable {
    %orig(YES);
}
%end

%hook YTIBackgroundabilityRenderer
- (id)backgroundUpsell {
    return nil;
}

- (BOOL)backgroundable {
    return YES;
}

- (BOOL)hasBackgroundable {
    return YES;
}

- (BOOL)hasBackgroundPlaybackControls {
    return YES;
}
%end

%hook YTIPlayerResponse
- (BOOL)hasBackgroundability {
    return YES;
}

- (BOOL)hasPlayableInBackground {
    return YES;
}

- (BOOL)isDAIEnabledPlayback {
    return YES;
}

- (BOOL)isPlayableInBackground{
    return YES;
}

- (void)setIsPlayableInBackground:(BOOL)backgroundable {
    %orig(YES);
}
%end

%hook YTMIntentHandler
- (BOOL)isBackgroundPlaybackEnabled {
    return YES;
}

- (void)setIsBackgroundPlaybackEnabled:(BOOL)backgroundable {
    %orig(YES);
}
%end

%hook YTMSettings
- (BOOL)backgroundPlaybackModeModified {
    return NO;
}

- (void)setBackgroundPlaybackModeModified:(BOOL)modified {
    %orig(NO);
}

- (void)setBackgroundPlaybackMode:(long long)mode {
    %orig(1);
}

- (long long)backgroundPlaybackMode {
    return 1;
}
%end

%hook YTIMainAppColdConfig
- (BOOL)iosEnableImpBackgroundableAudio {
    return YES;
}

- (BOOL)hasIosEnableImpBackgroundableAudio {
    return YES;
}
%end
%end

#pragma mark - Removing ads
%group RemoveAds
%hook YTAdsInnerTubeContextDecorator
- (void)decorateContext:(id)arg1{
    return;
}
%end
%end

#pragma mark - Video/Audio switching
%group VideoAndAudioModePatches
%hook YTIPlayerResponse
- (id)ytm_audioOnlyPlayabilityRenderer {
    return nil;
}

- (id)ytm_audioOnlyUpsell {
    return nil;
}

- (BOOL)ytm_isAudioOnlyPlayable {
    return YES;
}

- (BOOL)isAudioOnlyAvailabilityBlocked {
    return NO;
}

- (void)setIsAudioOnlyAvailabilityBlocked:(BOOL)blocked{
    %orig(NO);
}

- (void)setYtm_isAudioOnlyPlayable:(BOOL)playable{
    %orig(YES);
}
%end

%hook YTMSettings
- (BOOL)noVideoModeEnabled{
    return NO;
}

- (void)setNoVideoModeEnabled:(BOOL)enabled {
    %orig(NO);
}
%end

%hook YTUserDefaults
- (BOOL)noVideoModeEnabled{
    return NO;
}

- (void)setNoVideoModeEnabled:(BOOL)enabled {
    %orig(NO);
}
%end

%hook YTMAudioVideoModeController
- (BOOL)isAudioOnlyBlocked {
    return NO;
}

- (void)setIsAudioOnlyBlocked:(BOOL)blocked {
    %orig(NO);
}

- (void)setSwitchAvailability:(long long)arg1 {
    %orig(1);
}
%end

%hook YTMQueueConfig
- (BOOL)isAudioVideoModeSupported {
    return YES;
}

- (void)setIsAudioVideoModeSupported:(BOOL)supported {
    %orig(YES);
}
%end

%hook YTDefaultQueueConfig
- (BOOL)isAudioVideoModeSupported {
    return YES;
}

- (void)setIsAudioVideoModeSupported:(BOOL)supported {
    %orig(YES);
}
%end
%end

#pragma mark - OLED Theme
%group oledTheme
%hook YTCommonColorPalette
- (UIColor *)brandBackgroundSolid { return [UIColor blackColor]; }
- (UIColor *)brandBackgroundPrimary { return [UIColor blackColor]; }
%end

%hook YTPivotBarView
- (void)didMoveToWindow {
    self.subviews[0].backgroundColor = [UIColor blackColor];
    %orig;
}
%end

%hook YTMMusicMenuTitleView
- (void)didMoveToWindow {
    self.backgroundColor = [UIColor blackColor];
    %orig;
}
%end

%hook MDCSnackbarMessageView
- (void)didMoveToWindow {
    self.backgroundColor = [UIColor blackColor];
    %orig;
}
%end
%end

#pragma mark - OLED Keyboard
%group oledKB
%hook UIPredictionViewController // support prediction bar - @ichitaso: http://gist.github.com/ichitaso/935100fd53a26f18a9060f7195a1be0e
- (void)loadView {
    %orig;
    [self.view setBackgroundColor:[UIColor blackColor]];
}
%end

%hook UICandidateViewController // support prediction bar - @ichitaso:http://gist.github.com/ichitaso/935100fd53a26f18a9060f7195a1be0e
- (void)loadView {
    %orig;
    [self.view setBackgroundColor:[UIColor blackColor]];
}
%end

%hook UIKBRenderConfig // Prediction text color
- (void)setLightKeyboard:(BOOL)arg1 { %orig(NO); }
%end

%hook UIKeyboardDockView
- (void)didMoveToWindow {
    self.backgroundColor = [UIColor blackColor];
    %orig;
}
%end

%hook UIKeyboardLayoutStar 
- (void)didMoveToWindow {
    self.backgroundColor = [UIColor blackColor];
    %orig;
}
%end
%end

#pragma mark - Playback rate
%group RateController
%hook YTMModularNowPlayingViewController
- (BOOL)playbackRateButtonEnabled {
    return YES;
}

- (void)setPlaybackRateButtonEnabled:(BOOL)enabled {
    %orig(YES);
}
%end

%hook YTMPlayerControlsView
- (BOOL)playbackRateButtonEnabled {
    return YES;
}

- (void)setPlaybackRateButtonEnabled:(BOOL)enabled {
    %orig(YES);
}
%end
%end

#pragma mark - Selectable lyrics
%group SelectableLyrics
%hook YTFormattedStringLabel
%property (nonatomic, strong) UITextView *lyricsTextView;

%new
- (BOOL)isLyricsView
{
    if ([[[self superview] superview] superview] == nil)
    {
        return false;
    }

    if ([self.superview.superview.superview isKindOfClass:objc_getClass("YTMLightweightMusicDescriptionShelfCell")])
    {
        YTFormattedStringLabel *label = MSHookIvar<YTFormattedStringLabel *>([[[self superview] superview] superview], "_descriptionLabel");
        return [self isEqual:label];
    }

    return false;
}

- (void)layoutSubviews
{
    %orig;
    if (![self isLyricsView]) { return; }

    if (self.lyricsTextView != nil) {
        self.lyricsTextView.frame = self.bounds;
    }
}

- (void)setFont:(UIFont *)font
{
    %orig(font);
    if (![self isLyricsView]) { return; }

    [self.lyricsTextView setFont:[UIFont systemFontOfSize:14]];
}

- (void)setAttributedText:(NSAttributedString *)text
{
    %orig(text);
    if (![self isLyricsView]) { return; }

    [self setTextColor:[UIColor clearColor]];
    [self.lyricsTextView setAttributedText:text];
}

- (void)didAddSubview:(UIView *)view
{
    %orig;
    if (![self isLyricsView]) { return; }

    if ([view isKindOfClass:objc_getClass("MDCInkView")])
    {
        self.lyricsTextView = [[UITextView alloc] init];
        [self.lyricsTextView setBackgroundColor:[UIColor clearColor]];
        [self.lyricsTextView setTextColor:[UIColor whiteColor]];
        [self.lyricsTextView setEditable:NO];
        
        [self addSubview:self.lyricsTextView];
        self.userInteractionEnabled = YES;
        [view removeFromSuperview];
    }
}
%end
%end

%ctor{
    %init;

    //Get / read values
    BOOL isEnabled = ([[NSUserDefaults standardUserDefaults] objectForKey:@"YTMUltimateIsEnabled"] != nil) ? [[NSUserDefaults standardUserDefaults] boolForKey:@"YTMUltimateIsEnabled"] : YES;
    BOOL oledDarkTheme = ([[NSUserDefaults standardUserDefaults] objectForKey:@"oledDarkTheme_enabled"] != nil) ? [[NSUserDefaults standardUserDefaults] boolForKey:@"oledDarkTheme_enabled"] : NO;
    BOOL oledDarkKeyboard = ([[NSUserDefaults standardUserDefaults] objectForKey:@"oledDarkKeyboard_enabled"] != nil) ? [[NSUserDefaults standardUserDefaults] boolForKey:@"oledDarkKeyboard_enabled"] : NO;
    BOOL playbackRateButton = ([[NSUserDefaults standardUserDefaults] objectForKey:@"playbackRateButton_enabled"] != nil) ? [[NSUserDefaults standardUserDefaults] boolForKey:@"playbackRateButton_enabled"] : NO;
    BOOL selectableLyrics = ([[NSUserDefaults standardUserDefaults] objectForKey:@"selectableLyrics_enabled"] != nil) ? [[NSUserDefaults standardUserDefaults] boolForKey:@"selectableLyrics_enabled"] : NO;

    //Apply patches
    %init(SideloadingFixes);
    %init(SettingsPage);
    
    if (isEnabled){
        %init(Cast);
        %init(BackgroundPlayback);
        %init(EnsurePremiumStatus);
        %init(RemoveAds);
        %init(VideoAndAudioModePatches);

        if (oledDarkTheme) {
            %init(oledTheme);
        }

        if (oledDarkKeyboard) {
            %init(oledKB);
        }

        if (playbackRateButton) {
            %init(RateController);
        }

        if (selectableLyrics) {
            %init(SelectableLyrics);
        }
    }
}
