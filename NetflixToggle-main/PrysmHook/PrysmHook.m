@import UIKit;
#import <substrate.h>


@interface PrysmMainPageViewController : UIViewController
@end


void(*origVDL)(PrysmMainPageViewController *self, SEL _cmd);

void overrideVDL(PrysmMainPageViewController *self, SEL _cmd) {

	origVDL(self, _cmd);

	/*--- dismissControlCenter is a function from the Prysm class,
	so no need to make the implementation ourselves :fr: ---*/

	[NSNotificationCenter.defaultCenter removeObserver:self];
	[NSNotificationCenter.defaultCenter addObserver:self selector:@selector(dismissControlCenter) name:@"dismissCCNotificationReceived" object:nil];

}


__attribute__((constructor)) static void init() {

	MSHookMessageEx(NSClassFromString(@"PrysmMainPageViewController"), @selector(viewDidLoad), (IMP) &overrideVDL, (IMP*) &origVDL);

}
