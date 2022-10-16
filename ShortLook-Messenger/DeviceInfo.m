// Thanks! - https://github.com/guillermo-moran/Packix-DRM-Middleman/blob/master/DRMUtils.m
#import "DeviceInfo.h"

@implementation DeviceInfo

// Will return device's model identifier
// i.e : @"iPhone1,1" for iPhone 2G
+(NSString*)deviceModelIdentifier {
	struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

// Return Device UDID
// Computed with formula: UDID = SHA1(SerialNumber + IMEI + WiFiAddress + BluetoothAddress)
// But link to MobileGestalt instead.
+(NSString*)deviceUDID {
	CFStringRef UDNumber = MGCopyAnswer(CFSTR("UniqueDeviceID"));
	NSString* UDID = (__bridge NSString*)UDNumber;
	return UDID;
}

@end