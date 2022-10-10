#include "XXXRootListController.h"

@implementation XXXRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	    }

	return _specifiers;
    }

- (void)respring {
	/*pid_t pid;
    const char* args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    }*/
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Spotlightizer"]];
}

-(void)twitter {
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://twitter.com/1DI4R"]
	options:@{}
	completionHandler:nil];
    }

-(void)github {
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://github.com/1di4r"]
	options:@{}
	completionHandler:nil];
	}



@end
