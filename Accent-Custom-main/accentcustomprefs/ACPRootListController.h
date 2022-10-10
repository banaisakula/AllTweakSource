#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#include <spawn.h>

@interface ACPRootListController : PSListController

- (void)respring;
- (void)reset;
- (void)selectExcludeApps;

@end
