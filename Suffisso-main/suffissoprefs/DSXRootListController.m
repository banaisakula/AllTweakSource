#include "DSXRootListController.h"
#include <CepheiPrefs/HBAppearanceSettings.h>
#include <Cephei/HBPreferences.h>
#include <CepheiPrefs/HBRootListController.h>
#include <spawn.h>

@implementation DSXRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed: 0.64 green: 0.75 blue: 0.91 alpha: 1.00];
        self.hb_appearanceSettings = appearanceSettings;
		self.applyButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" 
                                    style:UIBarButtonItemStylePlain
                                    target:self 
                                    action:@selector(apply)];
        self.applyButton.tintColor = [UIColor colorWithRed: 0.64 green: 0.75 blue: 0.91 alpha: 1.00];
		self.navigationItem.rightBarButtonItem = self.applyButton;
    }
    return self;
}
-(void)apply {
	pid_t pid;
	const char *args[] = {"sh", "-c", "killall Discord", NULL};
	posix_spawn(&pid, "/bin/sh", NULL, NULL, (char *const *)args, NULL);
}
@end
