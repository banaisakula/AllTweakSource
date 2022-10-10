#import <Cephei/HBPreferences.h>
#import <objc/runtime.h>

#define TWEAK_NAME @"ShutupShortcuts"
#define BUNDLE [NSString stringWithFormat:@"com.wrp1002.%@", [TWEAK_NAME lowercaseString]]


//	=========================== Preference vars ===========================

bool enabled;
bool disableAll;
HBPreferences *preferences;

//	=========================== Debugging stuff ===========================

@interface Debug : NSObject
	+(UIWindow*)GetKeyWindow;
	+(void)ShowAlert:(NSString *)msg;
	+(void)Log:(NSString *)msg;
	+(void)LogException:(NSException *)e;
	+(void)SpringBoardReady;
@end

@implementation Debug
	static bool springboardReady = false;

	+(UIWindow*)GetKeyWindow {
		UIWindow        *foundWindow = nil;
		NSArray         *windows = [[UIApplication sharedApplication]windows];
		for (UIWindow   *window in windows) {
			if (window.isKeyWindow) {
				foundWindow = window;
				break;
			}
		}
		return foundWindow;
	}

	//	Shows an alert box. Used for debugging 
	+(void)ShowAlert:(NSString *)msg {
		if (!springboardReady) return;

		UIAlertController * alert = [UIAlertController
									alertControllerWithTitle:@"Alert"
									message:msg
									preferredStyle:UIAlertControllerStyleAlert];

		//Add Buttons
		UIAlertAction* dismissButton = [UIAlertAction
									actionWithTitle:@"Cool!"
									style:UIAlertActionStyleDefault
									handler:^(UIAlertAction * action) {
										//Handle dismiss button action here
										
									}];

		//Add your buttons to alert controller
		[alert addAction:dismissButton];

		[[self GetKeyWindow].rootViewController presentViewController:alert animated:YES completion:nil];
	}

	//	Show log with tweak name as prefix for easy grep
	+(void)Log:(NSString *)msg {
		NSLog(@"%@: %@", TWEAK_NAME, msg);
	}

	//	Log exception info
	+(void)LogException:(NSException *)e {
		NSLog(@"%@: NSException caught", TWEAK_NAME);
		NSLog(@"%@: Name:%@", TWEAK_NAME, e.name);
		NSLog(@"%@: Reason:%@", TWEAK_NAME, e.reason);
	}

	+(void)SpringBoardReady {
		springboardReady = true;
	}
@end


//	=========================== Classes / Functions ===========================


@interface BBBulletin : NSObject
@property (nonatomic,readonly) NSString * sectionDisplayName; 
@property (nonatomic,copy) NSString * sectionID;
@property (nonatomic,copy) NSString * title; 
@property (nonatomic,copy) NSString * subtitle; 
@property (nonatomic,copy) NSString * message; 
@end


//	=========================== Hooks ===========================

%hook SpringBoard

	//	Called when springboard is finished launching
	-(void)applicationDidFinishLaunching:(id)application {
		%orig;
		[Debug SpringBoardReady];
	}

%end

%hook NCBulletinNotificationSource
	// Not sure if this is needed. Doesn't seem to get called
	/*- (void)observer:(id)arg1 addBulletin:(id)arg2 forFeed:(NSUInteger)arg3 {
		%orig;
		//[Debug Log:@"- (void)observer:(id)arg1 addBulletin:(id)arg2 forFeed:(NSUInteger)arg3;"];
		[Debug Log:[NSString stringWithFormat:@"bulletin:%@", arg2]];
	}*/

	- (void)observer:(id)arg1 addBulletin:(id)arg2 forFeed:(NSUInteger)arg3 playLightsAndSirens:(BOOL)arg4 withReply:(id /* CDUnknownBlockType */)arg5 {
		//[Debug Log:@"- (void)observer:(id)arg1 addBulletin:(id)arg2 forFeed:(NSUInteger)arg3;"];
		//[Debug Log:[NSString stringWithFormat:@"bundleID: %@  title: %@  subtitle: %@  message: %@", [arg2 sectionID], [arg2 title], [arg2 subtitle], [arg2 message]]];

		NSString *automationStr = @"Running your automation";

		if (!enabled || ![[arg2 sectionID] isEqualToString:@"com.apple.shortcuts"])
			return %orig;

		if ([[arg2 message] isEqualToString:automationStr] || disableAll)
			return;

		%orig;
	}
%end


//	=========================== Constructor stuff ===========================

%ctor {
	[Debug Log:[NSString stringWithFormat:@"============== %@ started ==============", TWEAK_NAME]];

	preferences = [[HBPreferences alloc] initWithIdentifier:BUNDLE];
	[preferences registerBool:&enabled default:true forKey:@"kEnabled"];
	[preferences registerBool:&disableAll default:false forKey:@"kDisableAll"];

}
