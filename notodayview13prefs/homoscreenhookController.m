#import <Foundation/Foundation.h>
#import "homoscreenhookController.h"
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListController.h>
#import <spawn.h>

@implementation homoscreenhookController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"HS" target:self];
	}

	return _specifiers;
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




@end






