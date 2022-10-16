#import "Tweak.h"

/**
 * Load Preferences
 */
BOOL noads;

static void reloadPrefs() {
  NSDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@PLIST_PATH] ?: [@{} mutableCopy];

  noads = [[settings objectForKey:@"noads"] ?: @(YES) boolValue];
}

%group NoAds
  %hook GBTMailListViewControllerImpl
    - (id)tableView:(id)arg1 cellForRowAtIndexPath:(id)arg2 {
      id cell = %orig;
      if ([cell isKindOfClass:NSClassFromString(@"AdsCell")] || [cell isKindOfClass:NSClassFromString(@"GBTAdsCellImpl")]) {
        [cell setHidden: YES];
      } else {
        [cell setHidden: NO];
      }
      return cell;
    }
  %end

  %hook AdsCell
    + (double)heightForObject:(id)arg1 width:(double)arg2 expansionState:(id)arg3 {
      return 0;
    }

    + (double)heightForObject:(id)arg1 width:(double)arg2 {
      return 0;
    }
  %end

  %hook GBTAdsCellImpl
    + (double)heightForObject:(id)arg1 width:(double)arg2 expansionState:(id)arg3 {
      return 0;
    }

    + (double)heightForObject:(id)arg1 width:(double)arg2 {
      return 0;
    }
  %end
%end

%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback) reloadPrefs, CFSTR(PREF_CHANGED_NOTIF), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
  reloadPrefs();

  if (noads) {
    %init(NoAds);
  }
}
