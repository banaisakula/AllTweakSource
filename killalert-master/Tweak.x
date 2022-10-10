

@interface SBFluidSwitcherViewController
-(void)scrollViewKillingProgressUpdated:(double)arg1 ofContainer:(id)arg2 ;
-(void)killContainer:(id)arg1 forReason:(long long)arg2 ;
@end

@interface SBApplication : NSObject
+(id)sharedInstance;
-(NSString *)displayName;
@end

@interface SBApplicationController : NSObject
-(id)applicationWithBundleIdentifier:(id)arg1 ;
@end

static NSString *getAppName(NSString *container) {
	NSArray *appLayout = [container componentsSeparatedByString:@"primary: "];
	NSString *bundleIdentifierWithStuff = appLayout[1];
	NSArray *isolateBundle = [bundleIdentifierWithStuff componentsSeparatedByString:@";"];
	NSString *bundleIdentifier = isolateBundle[0];
	SBApplication *app = [[%c(SBApplicationController) sharedInstance] applicationWithBundleIdentifier:bundleIdentifier];
  	NSString *appName = app.displayName;
	return appName;
}

%hook SBFluidSwitcherViewController
-(void)scrollViewKillingProgressUpdated:(double)arg1 ofContainer:(id)arg2 {
	if (arg1 > 0.010) {
		NSString *title = [NSString stringWithFormat:@"About to kill %@", getAppName([NSString stringWithFormat:@"%@", arg2])];
		UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
			[self killContainer:arg2 forReason:0];
		}];
		[alert addAction:defaultAction];
		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
		[alert addAction:cancelAction];
		[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alert animated:YES completion:^{}];
	} else {
		%orig;
	}
}
%end