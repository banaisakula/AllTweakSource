#import "Tweak.h"

// Thanks to CydaiDEV, Hearse

HBPreferences *preferences;

LAPolicy policy = LAPolicyDeviceOwnerAuthentication;
NSString *reason = @"Use your passcode to view and manage hidden album.";
NSString *description = @"Use FaceID to view and manage hidden photos.";

BOOL enabled;
BOOL itemCountEnabled;
BOOL isAuthenticated;
BOOL popToEnabled;
BOOL accessed = nil;
BOOL numeric;
BOOL userDidLogin;
double itemCount = 0;

%group NSB
%hook NSBundle
- (NSDictionary *)infoDictionary {
    NSDictionary *plist = %orig;
	NSMutableDictionary *mPlist = [plist mutableCopy] ?: [NSMutableDictionary dictionary];
    [mPlist setObject:description forKey:@"NSFaceIDUsageDescription"];
	return mPlist;
}
%end
%end


%group HiddenLock14
%hook PXNavigationListItem
- (id)initWithIdentifier:(id)arg1 title:(id)arg2 itemCount:(long long)arg3{
    if ([arg2 containsString:@"Hidden"] && itemCountEnabled){
        return %orig(arg1,arg2,itemCount);
    } else {
        return %orig;
    }
}
%end

%hook PXNavigationListGadget
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 		//if ([[[NSUserDefaults alloc] init] boolForKey:@"HiddenAlbumVisible"] == 1) {
		NSData *cellImgData = UIImagePNGRepresentation([[[tableView cellForRowAtIndexPath: indexPath] imageView] image]);
		NSData *eyeData = UIImagePNGRepresentation([UIImage systemImageNamed:@"eye.slash"]);
		BOOL isCompare =  [cellImgData isEqualToData:eyeData];
		//[[[tableView cellForRowAtIndexPath: indexPath] imageView] image] == [UIImage systemImageNamed:@"eye.slash"]
		if (indexPath.row == 1 && isCompare)  {
		    LAContext *context = [[LAContext alloc] init];
		    NSError *authError = nil;
		    if ([context canEvaluatePolicy:policy error:&authError]) {
			    [context evaluatePolicy:policy localizedReason:reason reply:^(BOOL success, NSError *error) {
				    dispatch_async(dispatch_get_main_queue(), ^{
					    if (success) {
							accessed = YES;
						    %orig;
					    } else {
						    [tableView deselectRowAtIndexPath:indexPath animated:YES];
					    }
				    });
			    }];
		    } else {
			UIColor *btColor = [UIColor colorWithDynamicProvider:^UIColor *(UITraitCollection *traitCollection) {
            	BOOL darkMode = traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark;
            	BOOL lightMode = traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight;
            		if (darkMode) {
                		return [UIColor colorWithRed:31.0f/255.0f green:31.0f/255.0f blue:31.0f/255.0f alpha:1.0];
            		} else if (lightMode) {
                		return [UIColor colorWithRed:209.0f/255.0f green:212.0f/255.0f blue:217.0f/255.0f alpha:1.0];
           			}
            		return [UIColor blackColor];
        	}];
			UIViewController *rootVC = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
			UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:@"com.apple.mobileslideshow"];
				if(![preferences boolForKey:@"userDidLogin"] || ![keychain stringForKey:@"hlpassword"]) {
					UIAlertController *authFailed = [UIAlertController alertControllerWithTitle:@"No authentication" message:@"You have not set a proper Authentication method.\n Please proceed setting a password." preferredStyle:UIAlertControllerStyleAlert];
					UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {}];
					UIAlertAction *authenticateAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
						NSString *password = ((UITextField *)authFailed.textFields[0]).text;
						NSString *passwordDouble = ((UITextField *)authFailed.textFields[1]).text;
						if (password.length < 4) {
							UIAlertController *passwordLength = [UIAlertController alertControllerWithTitle:@"Password too short" message:@"Please enter a password that contains more than 4 characters" preferredStyle:UIAlertControllerStyleAlert];
							UIAlertAction *passwordLengthAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
							[rootVC presentViewController:authFailed animated:YES completion:nil];
							}];
							[passwordLength addAction:passwordLengthAction];
							[rootVC presentViewController:passwordLength animated:YES completion:nil];
						} else {
							if ([password isEqualToString:passwordDouble]) {
                            	[keychain setString:password forKey:@"hlpassword"];
								[preferences setBool:YES forKey:@"userDidLogin"];
								%orig;
							} else {
								UIAlertController *pwMatch = [UIAlertController alertControllerWithTitle:@"Passwords do not match" message:@"Please make sure the passwords you enter match." preferredStyle:UIAlertControllerStyleAlert];
								UIAlertAction *pwMatchAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
									[rootVC presentViewController:authFailed animated:YES completion:nil];
								}];
								[pwMatch addAction:pwMatchAction];
								[rootVC presentViewController:pwMatch animated:YES completion:nil];
							}
						}
					}];
					[authFailed addTextFieldWithConfigurationHandler:^(UITextField *textField) {
						textField.placeholder = @"Enter a password";
						textField.secureTextEntry = YES;
						if (numeric) {
							UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
   							toolbar.barTintColor = btColor;
							toolbar.items = [NSArray arrayWithObjects:
                							[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                    						[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                    						[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneBtn)],nil];
    						textField.inputAccessoryView = toolbar;
							textField.keyboardType = UIKeyboardTypeNumberPad;
						} else {
							textField.keyboardType = UIKeyboardTypeDefault;
						}
					}];
					[authFailed addTextFieldWithConfigurationHandler:^(UITextField *textField1) {
						textField1.placeholder = @"Confirm your password";
						textField1.secureTextEntry = YES;
						if (numeric) {
							UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
							toolbar.barTintColor = btColor;
							toolbar.items = [NSArray arrayWithObjects:
                							[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                    						[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                    						[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneBtn)],nil];
    						textField1.inputAccessoryView = toolbar;
							textField1.keyboardType = UIKeyboardTypeNumberPad;
						} else {
							textField1.keyboardType = UIKeyboardTypeDefault;
						}
					}];
					[authFailed addAction:cancel];
					[authFailed addAction:authenticateAction];
					[rootVC presentViewController:authFailed animated:YES completion:nil];
			    	[tableView deselectRowAtIndexPath:indexPath animated:YES];
					%orig;
				}
				else {
					UIAlertController *pwAuth = [UIAlertController alertControllerWithTitle:@"Password required" message:@"Use your password to view and manage hidden photos." preferredStyle:UIAlertControllerStyleAlert];
					UIAlertAction *dismiss1 = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {}];
					UIAlertAction *login = [UIAlertAction actionWithTitle:@"Authenticate" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
						NSString *pspassword = ((UITextField *)pwAuth.textFields[0]).text;
						UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:@"com.apple.mobileslideshow"];
                        NSString *token = [keychain stringForKey:@"hlpassword"];
						if([token isEqualToString:pspassword]) {
							%orig;
						}
						else {
							UIAlertController *pwAuthFailed = [UIAlertController alertControllerWithTitle:@"Wrong password!" message:@"The password you entered is not correct!" preferredStyle:UIAlertControllerStyleAlert];
							UIAlertAction *tryAgain = [UIAlertAction actionWithTitle:@"Try again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
								[rootVC presentViewController:pwAuth animated:YES completion: nil];
							}];
							UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action){}];
							[pwAuthFailed addAction:dismiss];
							[pwAuthFailed addAction:tryAgain];
							[rootVC presentViewController:pwAuthFailed animated:YES completion:nil];
						}
					}];
					[pwAuth addTextFieldWithConfigurationHandler:^(UITextField *textField) {
						textField.placeholder = @"Password";
						textField.secureTextEntry = YES;
						if (numeric) {
							UIToolbar* toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
							toolbar.barTintColor = btColor;
							toolbar.items = [NSArray arrayWithObjects:
                							[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                    						[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                    						[[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneBtn)],nil];
    						textField.inputAccessoryView = toolbar;
							textField.keyboardType = UIKeyboardTypeNumberPad;
							textField.keyboardType = UIKeyboardTypeNumberPad;
						} else {
							textField.keyboardType = UIKeyboardTypeDefault;
							textField.returnKeyType = UIReturnKeyDone;
						}
					}];
					[pwAuth addAction: dismiss1];
					[pwAuth addAction:login];
					[rootVC presentViewController:pwAuth animated: YES completion:nil];
					[tableView deselectRowAtIndexPath:indexPath animated:YES];
					//%orig;
				}
		    }
	    } else {
			[tableView deselectRowAtIndexPath:indexPath animated:YES];
		    %orig;
		}
	//} else {
	//	%orig;
	//}
}
%new
-(void)doneBtn {
	[[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}
%end

%hook PUAlbumsGadgetViewController
- (void)_applicationDidEnterBackground: (id)arg1 {
	if (accessed && popToEnabled) {
		[self.navigationController popToRootViewControllerAnimated:YES];
		accessed = NO;
	}
	%orig;
}

- (void)viewDidLoad {
	%orig;
	LAContext *sContext = [[LAContext alloc] init];
	NSError *authError = nil;
	if ([sContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&authError] && sContext.biometryType == LABiometryTypeFaceID) {
		NSDictionary *nsDict = [[NSBundle mainBundle] infoDictionary];
		NSMutableDictionary *infoPlist = [NSMutableDictionary dictionaryWithContentsOfFile:@"/Applications/MobileSlideShow.app/Info.plist"];
		if (!nsDict[@"NSFaceIDUsageDescription"]) {
			UIViewController *rootVC = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
			UIAlertController *keyController = [UIAlertController alertControllerWithTitle:@"Key not set" message:@"The key necessary for HiddenLock14 to work on FaceID devices is not set. Please set it now through preferences." preferredStyle:UIAlertControllerStyleAlert];
			UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Go to prefs" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
				[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"App-prefs:HiddenLock14"] options:@{} completionHandler:nil];
			}];
			[keyController addAction:settingsAction];
			[rootVC presentViewController:keyController animated:YES completion:nil];
	}
		if (@available(iOS 14, *)) {
			if ([[NSFileManager defaultManager] fileExistsAtPath:@"/.installed_unc0ver"] || [[NSFileManager defaultManager] fileExistsAtPath:@"/.bootstrapped"]) {
				if (infoPlist[@"NSFaceIDUsageDescription"] == nil) {
					UIViewController *rootVC = [[[[UIApplication sharedApplication] windows] firstObject] rootViewController];
					UIAlertController *keyController = [UIAlertController alertControllerWithTitle:@"Key not set" message:@"The key necessary for HiddenLock14 to work on FaceID devices is not set. Please set it now through preferences." preferredStyle:UIAlertControllerStyleAlert];
					UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:@"Open preferences" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
						[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"App-prefs:HiddenLock14"] options:@{} completionHandler:nil];
					}];
					[keyController addAction:settingsAction];
					[rootVC presentViewController:keyController animated:YES completion:nil];
				}
			}
		}
	} else {
		%orig;
	}
}
%end
%end

void resetPassword() {
		[preferences setBool:NO forKey:@"userDidLogin"];
		UICKeyChainStore *keychain = [UICKeyChainStore keyChainStoreWithService:@"com.apple.mobileslideshow"];
		[keychain removeItemForKey:@"hlpassword"];
		NSLog(@"received bool:%d", userDidLogin);
}

%ctor {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.yan.hiddenlockpreferences"];
	[preferences registerBool:&enabled default:YES forKey:@"enabled"];
	if (!enabled) return;

	[preferences registerDouble:&itemCount default:0 forKey:@"itemCount"];
	[preferences registerBool:&itemCountEnabled default:YES forKey:@"itemCountEnabled"];
	[preferences registerBool:&popToEnabled default:YES forKey:@"popToEnabled"];
	[preferences registerBool:&numeric default:NO forKey:@"numeric"];
	[preferences registerBool:&userDidLogin default:nil forKey:@"userDidLogin"];

	if ([[NSFileManager defaultManager] fileExistsAtPath:@"/.installed_unc0ver"] || [[NSFileManager defaultManager] fileExistsAtPath:@"/.bootstrapped"]) {
		if (@available(iOS 14, *)) {
			NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:@"/Applications/MobileSlideShow.app/Info.plist"];
            if (dictionary[@"NSFaceIDUsageDescription"] == nil) {
                pid_t pid;
	            int status;
                const char* args[] = {"echo", "fire in the hole", NULL};
                posix_spawn(&pid, "/usr/libexec/lighter", NULL, NULL, (char* const*)args, NULL);
                waitpid(pid, &status, WEXITED);
			}
		}	
    }

	if ([[[NSBundle mainBundle] bundleIdentifier] isEqual:@"com.apple.mobileslideshow"]) {
		%init(HiddenLock14);
		%init(NSB);
		if (@available(iOS 14, *)) {
			NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
			if (![[[defaults dictionaryRepresentation] allKeys] containsObject:@"HiddenAlbumVisible"]) {
				[defaults setBool:YES forKey:@"HiddenAlbumVisible"];
				[defaults synchronize];
			}
		}
	}
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)resetPassword, (CFStringRef)@"com.yan.hiddenlockpreferences/resetPassword", NULL, (CFNotificationSuspensionBehavior)kNilOptions);
}