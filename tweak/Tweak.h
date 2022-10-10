#import <UIKit/UIKit.h>
#include <RemoteLog.h>
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.icraze.notodayview13prefs.plist"
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


UIImageView* batteryIconView;
UIImageView* batteryChargerView;
UIImageView* LSBatteryIconView;
UIImageView* LSBatteryChargerView;
BOOL isCharging = NO;
BOOL isLowPowerModeActive = NO;

@interface _UIBatteryView : UIView
- (CGFloat)chargePercent;
- (long long)chargingState;
- (void)refreshIcon;
- (void)updateIconColor;
@end

@interface CSBatteryFillView : UIView
@end


@interface SBRootFolderView : UIView
@property(nonatomic, readwrite, assign, getter=isTodayViewPageHidden) BOOL todayViewPageHidden;
@end
@interface SBUIActionKeylineView: UIView
@end

@interface _UIInterfaceActionBlankSeparatorView: UIView
@end

@interface _UIInterfaceActionVibrantSeparatorView: UIView
@end

@interface _UIContextMenuActionsListSeparatorView: UIView
@end



@interface SpringBoard : UIApplication
- (void)_simulateLockButtonPress;
@end




//	if (shouldLoad) {
//		if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"12.0") && SYSTEM_VERSION_LESS_THAN(@"13.0")) {
//			%init(iOS12);
//		} else if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"13.0") && SYSTEM_VERSION_LESS_THAN(@"14.0")) {
//			%init(iOS13);
//		} else if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"14.0") && SYSTEM_VERSION_LESS_THAN(@"15.0")) {
//			%init(iOS14);
//		}
//	}
