#import <notify.h>

@interface BluetoothDevice
-(id)name;
-(int)batteryLevel;
-(BOOL)supportsBatteryLevel;
@end


BluetoothDevice *BTDevice;
int percentage;
bool supportsBT;


%hook BCBatteryDeviceController
  -(int)_displayChargePercentForCurrentCapacity:(id)arg1 andMaxCapacity:(id)arg2 updateZeroValue:(BOOL)arg3 {
    if(!arg3) {
      percentage = [arg1 intValue];
      supportsBT = YES;
      [BTDevice batteryLevel];
      [BTDevice supportsBatteryLevel];
       notify_post("btpercent");
    }
    return %orig;
  }
%end

%hook BluetoothDevice
-(id)initWithDevice:(id)arg1 address:(id)arg2 {
  BTDevice = %orig;
  return BTDevice;
}

-(BOOL)supportsBatteryLevel {
  return supportsBT;
}

-(int)batteryLevel {
  return percentage;
}
%end

%hook SBStatusBarStateAggregator
-(void)_updateBluetoothBatteryItem {
  int regToken;
  notify_register_dispatch("btpercent", &regToken, dispatch_get_main_queue(), ^(int token) {
    %orig;
  });
  %orig;
}

-(void)setShouldShowBluetoothHeadphoneGlyph:(BOOL)arg1 andShouldShowBluetoothHeadphoneBatteryPercent:(BOOL)arg2 {
  arg2 = YES;
  %orig;
}
%end
