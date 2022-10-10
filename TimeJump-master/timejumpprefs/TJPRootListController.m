#include "TJPRootListController.h"

@implementation TJPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)openGithub {
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://github.com/WilsontheWolf/TimeJump"]
	options:@{}
	completionHandler:nil];
}
@end
