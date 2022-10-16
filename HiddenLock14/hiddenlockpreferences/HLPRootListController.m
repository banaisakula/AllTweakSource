#import <Foundation/Foundation.h>
#include "HLPRootListController.h"
#import "spawn.h"

OBWelcomeController *welcomeController;

@implementation HLPRootListController

- (instancetype)init {
	self = [super init];

	if (self) {
		HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];

		self.preferences = [[HBPreferences alloc] initWithIdentifier:@"com.yan.hiddenlockpreferences"];

		self.applyButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style: UIBarButtonItemStylePlain target:self action: @selector(changesApplied)];
		self.applyButton.tintColor = [UIColor whiteColor];
		self.navigationItem.rightBarButtonItem= self.applyButton;
		self.navigationItem.titleView = [UIView new];

		self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.titleLabel.textColor = [UIColor whiteColor];
		self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO,
		self.titleLabel.text = @"HiddenLock14";
		self.titleLabel.textAlignment = NSTextAlignmentCenter;
		[self.navigationItem.titleView addSubview:self.titleLabel];

		appearanceSettings.tintColor = [UIColor colorWithRed:0.22f green:0.85f blue:0.98f alpha:1.0];
		appearanceSettings.navigationBarTitleColor = [UIColor whiteColor];
		appearanceSettings.navigationBarBackgroundColor = [UIColor colorWithRed:0.34 green:0.83 blue:0.96 alpha:1.0];
		appearanceSettings.navigationBarTintColor = [UIColor whiteColor];
		appearanceSettings.translucentNavigationBar = YES;
		self.hb_appearanceSettings = appearanceSettings;

		self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
		self.iconView.contentMode = UIViewContentModeScaleAspectFit;
		self.iconView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/HiddenLockPreferences.bundle/icon.png"];
		self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
		self.iconView.alpha = 0.0;
		[self.navigationItem.titleView addSubview:self.iconView];

		self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,200,200)];
		UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,200,200)];
		headerImageView.contentMode = UIViewContentModeScaleAspectFill;
		self.headerView.clipsToBounds = YES;
		headerImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/HiddenLockPreferences.bundle/Banner.png"];
		headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
		[self.headerView addSubview:headerImageView];

		[NSLayoutConstraint activateConstraints:@[
			[self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
        	[self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
        	[self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
        	[self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
			[self.iconView.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
            [self.iconView.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
            [self.iconView.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
            [self.iconView.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
			[headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
            [headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
            [headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
            [headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
		]];
	}
	return self;
}

- (void)viewDidLoad {
		if ([[NSFileManager defaultManager] fileExistsAtPath:@"/.installed_unc0ver"] || [[NSFileManager defaultManager] fileExistsAtPath:@"/.bootstrapped"]) {
			NSLog(@"fileexists");
			NSMutableDictionary *infoPlist = [NSMutableDictionary dictionaryWithContentsOfFile:@"/Applications/MobileSlideShow.app/Info.plist"];
			if (infoPlist[@"NSFaceIDUsageDescription"] == nil) {
				NSLog(@"infoPlist NSFACE Nil");
				UIAlertController *keyController = [UIAlertController alertControllerWithTitle:@"Key not set" message:@"A key that's necessary for HiddenLock14 to work has failed to set. Please set it now." preferredStyle:UIAlertControllerStyleAlert];
				UIAlertAction *keyAction = [UIAlertAction actionWithTitle:@"Set now" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
					pid_t pid;
	            	int status;
                	const char* args[] = {"echo", "fire in the hole", NULL};
                	posix_spawn(&pid, "/usr/libexec/lighter", NULL, NULL, (char* const*)args, NULL);
                	waitpid(pid, &status, WEXITED);
					[self completed];
				}];
				UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {}];
				[keyController addAction:keyAction];
				[keyController addAction:cancelAction];
				[self presentViewController:keyController animated:YES completion:nil];
			} 
		}

	[super viewDidLoad];

	if (![[self preferences] objectForKey:@"didPresentWVC"]) {
		[self setupWelcomeController];
	}
}

- (void)completed {
	UIAlertController *keyController = [UIAlertController alertControllerWithTitle:@"Success!" message:@"The key was set successfully!" preferredStyle:UIAlertControllerStyleAlert];
	[self presentViewController:keyController animated:YES completion:nil];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        	[keyController dismissViewControllerAnimated:YES completion:nil];
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"photos-redirect://"] options:@{} completionHandler:nil];
	});
}

- (void)setupWelcomeController {
	welcomeController = [[OBWelcomeController alloc] initWithTitle:@"Welcome to HiddenLock14" detailText:@"Add biometric authentication to hidden album in Photos." icon:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/HiddenLockPreferences.bundle/welcome/icon.png"]];

	[welcomeController addBulletedListItemWithTitle:@"Authentication" description:@"Lock the hidden album with an additional layer of security." image:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/HiddenLockPreferences.bundle/welcome/faceid.png"]];
	[welcomeController addBulletedListItemWithTitle:@"Item Count" description:@"Set the photos item count to any number you want!" image:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/HiddenLockPreferences.bundle/welcome/photo_on_rectangle.png"]];
	[welcomeController.buttonTray addCaptionText:@"developed with ❤️ by yan"];

	OBBoldTrayButton* continueButton = [OBBoldTrayButton buttonWithType:1];
    [continueButton addTarget:self action:@selector(dismissWelcomeController) forControlEvents:UIControlEventTouchUpInside];
    [continueButton setTitle:@"Experience it yourself!" forState:UIControlStateNormal];
    [continueButton setClipsToBounds:YES];
    [continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [continueButton.layer setCornerRadius:15];
	continueButton.tintColor = [UIColor colorWithRed:0.34 green:0.83 blue:0.96 alpha:1.0];
    [welcomeController.buttonTray addButton:continueButton];

    welcomeController.modalPresentationStyle = UIModalPresentationPageSheet;
	welcomeController.modalInPresentation = YES;
    welcomeController.view.tintColor = [UIColor blackColor];
    [self presentViewController:welcomeController animated:YES completion:nil];
}

- (void)dismissWelcomeController {
	[[self preferences] setBool:YES forKey:@"didPresentWVC"];
	[welcomeController dismissViewControllerAnimated:YES completion:nil];
}


- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY > 113) {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 1.0;
			self.titleLabel.alpha = 0.0;
        }];
    } else if (offsetY > -100 && offsetY < 113){	
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 0.0;
			self.titleLabel.alpha = 1.0;
        }];
    }
	else {
		[UIView animateWithDuration:0.2 animations:^{
			self.iconView.alpha = 0.0;
			self.titleLabel.alpha = 0.0;
		}];
	}
}

-(void)changesApplied {
	applySettings();
	UIAlertController *cAController = [UIAlertController alertControllerWithTitle:@"HiddenLock14" message:@"Changes applied successfully!" preferredStyle:UIAlertControllerStyleAlert];
	[self presentViewController:cAController animated:YES completion:nil];

	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [cAController dismissViewControllerAnimated:YES completion:^{
        }];
	});
}

static void applySettings() {
	NSLog(@"Applying changes...");
	pid_t pid;
    int status;
    const char* args[] = {"killall", "-9", "MobileSlideShow", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    tableView.tableHeaderView = self.headerView;
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];

}

- (void)resetPassword:(id)sender {
	UIAlertController *rstPwAlert = [UIAlertController alertControllerWithTitle:@"Reset password" message:@"Are you sure you want to reset your password?" preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style: UIAlertActionStyleCancel handler:^(UIAlertAction * action) {}];
	UIAlertAction *rstPwAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
			[[self preferences] setBool:NO forKey:@"userDidLogin"];
			CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.yan.hiddenlockpreferences/resetPassword", nil, nil, true);
	}];
	[rstPwAlert addAction:rstPwAction];
	[rstPwAlert addAction:cancel];
    [self presentViewController:rstPwAlert animated:YES completion:nil];
}
@end