#import "Tweak.h"

/**
 * Load Preferences
 */
BOOL enable;
NSDictionary *dateFormat;
NSDictionary *dateRowStyle;
NSDictionary *dayOfWeekStyle;

static void reloadPrefs() {
  NSDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@PLIST_PATH] ?: [@{} mutableCopy];

  enable = [[settings objectForKey:@"enable"] ?: @(YES) boolValue];
  dateFormat = [settings objectForKey:@"dateFormat"] ?: [@{} mutableCopy];
  dateRowStyle = [settings objectForKey:@"dateRowStyle"] ?: [@{} mutableCopy];
  dayOfWeekStyle = [settings objectForKey:@"dayOfWeekStyle"] ?: [@{} mutableCopy];
}

static NSArray *dayOfWeekStrings = @[
  @[@"Sunday", @"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday"],
  @[@"Sun.", @"Mon.", @"Tue.", @"Wed.", @"Thu.", @"Fri.", @"Sat."],
  @[@"Su", @"Mo", @"Tu", @"We", @"Th", @"Fr", @"Sa"],
];

%group Enable
  %hook WADayForecastView
    - (void)setForecast:(WADayForecast *)arg1 temperatureUnit:(int)arg2 {
      %orig;

      NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
      dayComponent.day = arg1.dayNumber;
      NSDate *nextDate = [[NSCalendar currentCalendar] dateByAddingComponents:dayComponent toDate:[NSDate date] options:0];
      NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
      [dateFormatter setDateFormat:dateFormat[@"format"] ?: @"MM/dd"];
      NSString *stringFromDate = [dateFormatter stringFromDate:nextDate];

      int dayOfWeekStyleInt = [dayOfWeekStyle[@"style"] intValue];
      NSString *dayOfWeekText = self.dayNameLabel.text;
      if (dayOfWeekStyleInt != 0) {
        dayOfWeekText = dayOfWeekStrings[dayOfWeekStyleInt][arg1.dayOfWeek - 1];
      }

      switch ([dateRowStyle[@"style"] intValue]) {
        case 0: {
          dayOfWeekText = [NSString stringWithFormat:@"%@ %@", dayOfWeekText, stringFromDate];
          break;
        }
        case 1: {
          dayOfWeekText = [NSString stringWithFormat:@"%@ - %@", dayOfWeekText, stringFromDate];
          break;
        }
        case 2: {
          dayOfWeekText = [NSString stringWithFormat:@"%@ (%@)", dayOfWeekText, stringFromDate];
          break;
        }
        case 3: {
          dayOfWeekText = [NSString stringWithFormat:@"%@ %@", stringFromDate, dayOfWeekText];
          break;
        }
        case 4: {
          dayOfWeekText = [NSString stringWithFormat:@"%@ - %@", stringFromDate, dayOfWeekText];
          break;
        }
        case 5: {
          dayOfWeekText = [NSString stringWithFormat:@"(%@) %@", stringFromDate, dayOfWeekText];
          break;
        }
        default: {
          dayOfWeekText = [NSString stringWithFormat:@"%@ %@", dayOfWeekText, stringFromDate];
          break;
        }
      }

      self.dayNameLabel.text = dayOfWeekText;
    }
  %end
%end

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) reloadPrefs, CFSTR(PREF_CHANGED_NOTIF), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
  reloadPrefs();

  if (enable) {
    %init(Enable);
  }
}

