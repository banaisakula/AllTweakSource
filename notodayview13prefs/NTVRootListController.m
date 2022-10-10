#include "NTVRootListController.h"





@interface OBButtonTray : UIView
- (void)addButton:(id)arg1;
- (void)setStackViewTopConstraint:(NSLayoutConstraint *)arg1;
- (NSLayoutConstraint *)stackViewTopConstraint;
- (void)setEffectView:(UIVisualEffectView *)arg1;
@end

@interface OBBuddyContinueButton : UIButton
+ (id)buttonWithType:(long long)arg1;
@end

@interface OBWelcomeController : UIViewController
- (id)initWithTitle:(id)arg1 detailText:(id)arg2 icon:(id)arg3;
- (void)addBulletedListItemWithTitle:(id)arg1 description:(id)arg2 image:(id)arg3;
- (void)setButtonTray:(OBButtonTray *)arg1;
@property (nonatomic,retain) OBButtonTray *buttonTray;
@end

@interface UIImage (Private)
+ (id)_applicationIconImageForBundleIdentifier:(id)arg1 format:(int)arg2 scale:(double)arg3;
@end
OBButtonTray *btnTray;
OBWelcomeController *welcomeController;



@implementation NTVRootListController
-(id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];



    //For all the icons I'm just using app icons, but any image can be used.
		welcomeController = [[OBWelcomeController alloc] initWithTitle:@"title" detailText:@"detail text" icon:[UIImage _applicationIconImageForBundleIdentifier:@"com.apple.MobileSMS" format:10 scale:[UIScreen mainScreen].scale]];
		[welcomeController addBulletedListItemWithTitle:@"bullet list item" description:@"stuff blah stuff blah blah" image:[UIImage _applicationIconImageForBundleIdentifier:@"com.apple.MobileSMS" format:1 scale:[UIScreen mainScreen].scale]];
		[welcomeController addBulletedListItemWithTitle:@"another item" description:@"things blah stuff description information" image:[UIImage _applicationIconImageForBundleIdentifier:@"com.apple.mobilesafari" format:1 scale:[UIScreen mainScreen].scale]];
		[welcomeController addBulletedListItemWithTitle:@"last item" description:@"more stuff that matters" image:[UIImage _applicationIconImageForBundleIdentifier:@"com.apple.mobilephone" format:1 scale:[UIScreen mainScreen].scale]];

		btnTray = [[OBButtonTray alloc] initWithFrame:welcomeController.view.frame];
    //I removed the effect view because it covered the whole welcomeController with a blur view.
		[btnTray setEffectView:nil];
		
    //I honestly do not understand why this works. I change the constant of the topLayoutConstraint, and then I remove the constraint. I know that it is very hacky, but it works.
		NSLayoutConstraint *topLayoutConstraint = [btnTray stackViewTopConstraint];
		topLayoutConstraint.constant = (welcomeController.view.frame.size.height - (welcomeController.view.frame.size.height / 6)) * -1;
		[btnTray setStackViewTopConstraint:nil];

		OBBuddyContinueButton *continueButton = [OBBuddyContinueButton buttonWithType:UIButtonTypeSystem];
		[continueButton addTarget:self action:@selector(dismissVC) forControlEvents:UIControlEventTouchUpInside];
		[continueButton setTitle:@"Continue" forState:UIControlStateNormal];
		[btnTray addButton:continueButton];

		welcomeController.buttonTray = btnTray;
		welcomeController.modalPresentationStyle = UIModalPresentationPageSheet;
		[self presentViewController:welcomeController animated:YES completion:nil];



	}

	return _specifiers;
}





















-(void)dismissVC {
	[welcomeController dismissViewControllerAnimated:YES completion:nil];
}


-(void)loadView {
	[super loadView];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(respring:)];
}

- (void)respring:(id)sender {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"NoTodayView13" message:@"Applying Settings Will Respring Your Device. Are You Sure You Want To Respring Now?" preferredStyle:UIAlertControllerStyleAlert];

	UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"Not Now" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
	}];

	UIAlertAction *respring = [UIAlertAction actionWithTitle:@"Respring" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		pid_t pid;
		const char* args[] = {"sbreload", NULL, NULL};
		posix_spawn(&pid, "/usr/bin/sbreload", NULL, NULL, (char* const*)args, NULL);
	}];

	[alert addAction:dismiss];
	[alert addAction:respring];
	[self presentViewController:alert animated:YES completion:nil];
}

-(void)selectExcludeApps
{
    // Replace "com.spark.notchlessprefs" and "excludedApps" with your strings
    SparkAppListTableViewController* s = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.icraze.NoTodayView13Prefs" andKey:@"excludedApps"];

    [self.navigationController pushViewController:s animated:YES];
    self.navigationItem.hidesBackButton = FALSE;
}





- (void)respring
{
	pid_t pid;
	const char *args[] = {"sbreload", NULL, NULL, NULL};
	posix_spawn(&pid, "usr/bin/sbreload", NULL, NULL, (char *const *)args, NULL);
}

- (void)reset: (PSSpecifier*)specifier
{
    UIAlertController *reset = [UIAlertController
        alertControllerWithTitle: @"PerfectTime"
		message: @"Do you really want to Reset All Settings?"
		preferredStyle: UIAlertControllerStyleAlert];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle: @"Confirm" style: UIAlertActionStyleDestructive handler:
        ^(UIAlertAction * action)
        {
      //      [[[HBPreferences alloc] initWithIdentifier: @"com.icraze.notodayview13prefs"] removeAllObjects];

           NSFileManager *manager = [NSFileManager defaultManager];
       [manager removeItemAtPath:@"/var/mobile/Library/PreferenceLoader/Preferences/NoTodayView13Prefs.plist" error: nil];

    [self respring];
        }];

	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle: @"Cancel" style: UIAlertActionStyleCancel handler: nil];
	[reset addAction: confirmAction];
	[reset addAction: cancelAction];
	[self presentViewController: reset animated: YES completion: nil];
}



-(void)showLicenses:(id)sender {
  UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
  self.navigationItem.backBarButtonItem = backItem; 
  [self.navigationController pushViewController:[[AccLicenseViewController alloc] init] animated:TRUE];
}























-(void)paypal:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://paypal.me/iCrazeiOS"] options:@{} completionHandler:nil];
}

-(void)github:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/banaisakula/BBDown_Aliyunpan"] options:@{} completionHandler:nil];
}


-(void)test:(id)sender {
   //提示框添加文本输入框  
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Title"  
                                                                   message:@"This is an alert."  
                                                            preferredStyle:UIAlertControllerStyleAlert];  
      
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault  
                                                          handler:^(UIAlertAction * action) {  
                                                              //响应事件  
                                                              //得到文本信息  
                                                              for(UITextField *text in alert.textFields){  
                                                                  NSLog(@"text = %@", text.text);  
                                                              }  
                                                          }];  
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel  
                                                         handler:^(UIAlertAction * action) {  
                                                             //响应事件  
                                                             NSLog(@"action = %@", alert.textFields);  
                                                         }];  
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {  
        textField.placeholder = @"登录";  
    }];  
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {  
        textField.placeholder = @"密码";  
        textField.secureTextEntry = YES;  
    }];  
      
    [alert addAction:okAction];  
    [alert addAction:cancelAction];  
    [self presentViewController:alert animated:YES completion:nil];  }



-(void)testlist:(id)sender {

 //显示弹出框列表选择  
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Title"  
                                                                   message:@"This is an Sheet."  
                                                            preferredStyle:UIAlertControllerStyleActionSheet];  
      
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel  
                                                          handler:^(UIAlertAction * action) {  
                                                              //响应事件  
                                                              NSLog(@"action = %@", action);  
                                                          }];  
    UIAlertAction* deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive  
                                                         handler:^(UIAlertAction * action) {  
                                                             //响应事件  
                                                             NSLog(@"action = %@", action);  
                                                         }];  
    UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault  
                                                         handler:^(UIAlertAction * action) {  
                                                             //响应事件  
                                                             NSLog(@"action = %@", action);  
                                                         }];  
    [alert addAction:saveAction];  
    [alert addAction:cancelAction];  
    [alert addAction:deleteAction];  
    [self presentViewController:alert animated:YES completion:nil];  
}


@end
