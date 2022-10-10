#line 1 "/Users/lovez/Desktop/AA/AA/BTPower/Tweak.xm"
#import <notify.h>

@interface BluetoothDevice
-(id)name;
-(int)batteryLevel;
-(BOOL)supportsBatteryLevel;
@end


BluetoothDevice *BTDevice;
int percentage;
bool supportsBT;



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class BluetoothDevice; @class SBStatusBarStateAggregator; @class BCBatteryDeviceController; 
static int (*_logos_orig$_ungrouped$BCBatteryDeviceController$_displayChargePercentForCurrentCapacity$andMaxCapacity$updateZeroValue$)(_LOGOS_SELF_TYPE_NORMAL BCBatteryDeviceController* _LOGOS_SELF_CONST, SEL, id, id, BOOL); static int _logos_method$_ungrouped$BCBatteryDeviceController$_displayChargePercentForCurrentCapacity$andMaxCapacity$updateZeroValue$(_LOGOS_SELF_TYPE_NORMAL BCBatteryDeviceController* _LOGOS_SELF_CONST, SEL, id, id, BOOL); static BluetoothDevice* (*_logos_orig$_ungrouped$BluetoothDevice$initWithDevice$address$)(_LOGOS_SELF_TYPE_INIT BluetoothDevice*, SEL, id, id) _LOGOS_RETURN_RETAINED; static BluetoothDevice* _logos_method$_ungrouped$BluetoothDevice$initWithDevice$address$(_LOGOS_SELF_TYPE_INIT BluetoothDevice*, SEL, id, id) _LOGOS_RETURN_RETAINED; static BOOL (*_logos_orig$_ungrouped$BluetoothDevice$supportsBatteryLevel)(_LOGOS_SELF_TYPE_NORMAL BluetoothDevice* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$BluetoothDevice$supportsBatteryLevel(_LOGOS_SELF_TYPE_NORMAL BluetoothDevice* _LOGOS_SELF_CONST, SEL); static int (*_logos_orig$_ungrouped$BluetoothDevice$batteryLevel)(_LOGOS_SELF_TYPE_NORMAL BluetoothDevice* _LOGOS_SELF_CONST, SEL); static int _logos_method$_ungrouped$BluetoothDevice$batteryLevel(_LOGOS_SELF_TYPE_NORMAL BluetoothDevice* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBStatusBarStateAggregator$_updateBluetoothBatteryItem)(_LOGOS_SELF_TYPE_NORMAL SBStatusBarStateAggregator* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBStatusBarStateAggregator$_updateBluetoothBatteryItem(_LOGOS_SELF_TYPE_NORMAL SBStatusBarStateAggregator* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBStatusBarStateAggregator$setShouldShowBluetoothHeadphoneGlyph$andShouldShowBluetoothHeadphoneBatteryPercent$)(_LOGOS_SELF_TYPE_NORMAL SBStatusBarStateAggregator* _LOGOS_SELF_CONST, SEL, BOOL, BOOL); static void _logos_method$_ungrouped$SBStatusBarStateAggregator$setShouldShowBluetoothHeadphoneGlyph$andShouldShowBluetoothHeadphoneBatteryPercent$(_LOGOS_SELF_TYPE_NORMAL SBStatusBarStateAggregator* _LOGOS_SELF_CONST, SEL, BOOL, BOOL); 

#line 15 "/Users/lovez/Desktop/AA/AA/BTPower/Tweak.xm"

  static int _logos_method$_ungrouped$BCBatteryDeviceController$_displayChargePercentForCurrentCapacity$andMaxCapacity$updateZeroValue$(_LOGOS_SELF_TYPE_NORMAL BCBatteryDeviceController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, BOOL arg3) {
    if(!arg3) {
      percentage = [arg1 intValue];
      supportsBT = YES;
      [BTDevice batteryLevel];
      [BTDevice supportsBatteryLevel];
       notify_post("btpercent");
    }
    return _logos_orig$_ungrouped$BCBatteryDeviceController$_displayChargePercentForCurrentCapacity$andMaxCapacity$updateZeroValue$(self, _cmd, arg1, arg2, arg3);
  }



static BluetoothDevice* _logos_method$_ungrouped$BluetoothDevice$initWithDevice$address$(_LOGOS_SELF_TYPE_INIT BluetoothDevice* __unused self, SEL __unused _cmd, id arg1, id arg2) _LOGOS_RETURN_RETAINED {
  BTDevice = _logos_orig$_ungrouped$BluetoothDevice$initWithDevice$address$(self, _cmd, arg1, arg2);
  return BTDevice;
}

static BOOL _logos_method$_ungrouped$BluetoothDevice$supportsBatteryLevel(_LOGOS_SELF_TYPE_NORMAL BluetoothDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  return supportsBT;
}

static int _logos_method$_ungrouped$BluetoothDevice$batteryLevel(_LOGOS_SELF_TYPE_NORMAL BluetoothDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  return percentage;
}



static void _logos_method$_ungrouped$SBStatusBarStateAggregator$_updateBluetoothBatteryItem(_LOGOS_SELF_TYPE_NORMAL SBStatusBarStateAggregator* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  int regToken;
  notify_register_dispatch("btpercent", &regToken, dispatch_get_main_queue(), ^(int token) {
    _logos_orig$_ungrouped$SBStatusBarStateAggregator$_updateBluetoothBatteryItem(self, _cmd);
  });
  _logos_orig$_ungrouped$SBStatusBarStateAggregator$_updateBluetoothBatteryItem(self, _cmd);
}

static void _logos_method$_ungrouped$SBStatusBarStateAggregator$setShouldShowBluetoothHeadphoneGlyph$andShouldShowBluetoothHeadphoneBatteryPercent$(_LOGOS_SELF_TYPE_NORMAL SBStatusBarStateAggregator* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1, BOOL arg2) {
  arg2 = YES;
  _logos_orig$_ungrouped$SBStatusBarStateAggregator$setShouldShowBluetoothHeadphoneGlyph$andShouldShowBluetoothHeadphoneBatteryPercent$(self, _cmd, arg1, arg2);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$BCBatteryDeviceController = objc_getClass("BCBatteryDeviceController"); { MSHookMessageEx(_logos_class$_ungrouped$BCBatteryDeviceController, @selector(_displayChargePercentForCurrentCapacity:andMaxCapacity:updateZeroValue:), (IMP)&_logos_method$_ungrouped$BCBatteryDeviceController$_displayChargePercentForCurrentCapacity$andMaxCapacity$updateZeroValue$, (IMP*)&_logos_orig$_ungrouped$BCBatteryDeviceController$_displayChargePercentForCurrentCapacity$andMaxCapacity$updateZeroValue$);}Class _logos_class$_ungrouped$BluetoothDevice = objc_getClass("BluetoothDevice"); { MSHookMessageEx(_logos_class$_ungrouped$BluetoothDevice, @selector(initWithDevice:address:), (IMP)&_logos_method$_ungrouped$BluetoothDevice$initWithDevice$address$, (IMP*)&_logos_orig$_ungrouped$BluetoothDevice$initWithDevice$address$);}{ MSHookMessageEx(_logos_class$_ungrouped$BluetoothDevice, @selector(supportsBatteryLevel), (IMP)&_logos_method$_ungrouped$BluetoothDevice$supportsBatteryLevel, (IMP*)&_logos_orig$_ungrouped$BluetoothDevice$supportsBatteryLevel);}{ MSHookMessageEx(_logos_class$_ungrouped$BluetoothDevice, @selector(batteryLevel), (IMP)&_logos_method$_ungrouped$BluetoothDevice$batteryLevel, (IMP*)&_logos_orig$_ungrouped$BluetoothDevice$batteryLevel);}Class _logos_class$_ungrouped$SBStatusBarStateAggregator = objc_getClass("SBStatusBarStateAggregator"); { MSHookMessageEx(_logos_class$_ungrouped$SBStatusBarStateAggregator, @selector(_updateBluetoothBatteryItem), (IMP)&_logos_method$_ungrouped$SBStatusBarStateAggregator$_updateBluetoothBatteryItem, (IMP*)&_logos_orig$_ungrouped$SBStatusBarStateAggregator$_updateBluetoothBatteryItem);}{ MSHookMessageEx(_logos_class$_ungrouped$SBStatusBarStateAggregator, @selector(setShouldShowBluetoothHeadphoneGlyph:andShouldShowBluetoothHeadphoneBatteryPercent:), (IMP)&_logos_method$_ungrouped$SBStatusBarStateAggregator$setShouldShowBluetoothHeadphoneGlyph$andShouldShowBluetoothHeadphoneBatteryPercent$, (IMP*)&_logos_orig$_ungrouped$SBStatusBarStateAggregator$setShouldShowBluetoothHeadphoneGlyph$andShouldShowBluetoothHeadphoneBatteryPercent$);}} }
#line 57 "/Users/lovez/Desktop/AA/AA/BTPower/Tweak.xm"
