@interface _UIBatteryView : UIView
- (BOOL)saverModeActive;
- (long long)chargingState;
@end

@interface CCUIRoundButton : UIControl
@end

@interface SCButtonView : UIView
@end

// Preferences Variables

extern BOOL enabled;
extern BOOL lowPowerModeBatteryTint;
extern BOOL chargingBatteryTint;
extern BOOL controlCenterTint;