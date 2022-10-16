#import <Foundation/Foundation.h>

#define PLIST_PATH "/var/mobile/Library/Preferences/com.haoict.weatherpluspref.plist"
#define PREF_CHANGED_NOTIF "com.haoict.weatherpluspref/PrefChanged"

@interface WADayForecast : NSObject
@property(assign, nonatomic) NSUInteger dayOfWeek;
@property(assign, nonatomic) NSUInteger dayNumber;
@property(assign, nonatomic) NSUInteger icon;
@end

@interface WADayForecastView : UIView
@property(retain, nonatomic) UILabel *dayNameLabel;
@end