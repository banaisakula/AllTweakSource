#import "Headers/Headers.h"

static HBPreferences *preferences = nil;
static NSString *previousTitle = @"";
extern dispatch_queue_t __BBServerQueue;
static BBServer *bbServer = nil;

BOOL enabled;
NSString *customText = @"";

void SendNotification(CFNotificationCenterRef center, void * observer, CFStringRef name, const void * object, CFDictionaryRef userInfo) {
	MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
        NSDictionary *dict = (__bridge NSDictionary *)information;
		NSString *songTitle = [dict objectForKey:(__bridge NSString *)kMRMediaRemoteNowPlayingInfoTitle];
        NSString *songArtist = [dict objectForKey:(__bridge NSString *)kMRMediaRemoteNowPlayingInfoArtist];

		if(!songTitle || !songArtist) {
			if([(__bridge NSString *)name isEqualToString:@"dev.hyper.playing/TestNotification"]) {
				songTitle = @"Title";
				songArtist = @"Artist";
			} else {
				return;
			}
		} else if ([songTitle isEqualToString:@""] || [songArtist isEqualToString:@""]) {
			if([(__bridge NSString *)name isEqualToString:@"dev.hyper.playing/TestNotification"]) {
				songTitle = @"Title";
				songArtist = @"Artist";
			} else {
				return;
			}
		}

        if (songTitle && songArtist) {
			if(![songTitle isEqualToString:previousTitle] || [(__bridge NSString *)name isEqualToString:@"dev.hyper.playing/TestNotification"]) {
				if(![previousTitle isEqualToString:@""]) {
					dispatch_sync(__BBServerQueue, ^{
						[bbServer _clearSection:@"dev.hyper.playing"];
					});
				}
				previousTitle = songTitle;
			} else if(![songTitle isEqualToString:@"Title"]) {
				return;
			}

            void *handle = dlopen("/usr/lib/libnotifications.dylib", RTLD_LAZY);
			if (handle != NULL) {    
				NSString *msg = [NSString stringWithFormat:@"%@ by %@", songTitle, songArtist];         
				if(![customText isEqualToString:@""]) {
					msg = [customText stringByReplacingOccurrencesOfString:@"@a" withString:songArtist];
					msg = [msg stringByReplacingOccurrencesOfString:@"@t" withString:songTitle];
				}
				#pragma clang diagnostic push
				#pragma clang diagnostic ignored "-Wnonnull"
				
				[objc_getClass("CPNotification") showAlertWithTitle:@"Now Playing"
								message:msg
								userInfo:@{@"" : @""}
								badgeCount:0
								soundName:nil
								delay:0.00
								repeats:NO
								bundleId:@"dev.hyper.playing"];   
				
				#pragma clang diagnostic pop                               
				dlclose(handle);
			}
        }
    });
}

%hook SBMediaController

-(void)setNowPlayingInfo:(id)arg1 {
	%orig;
	if(enabled) {
		SendNotification(CFNotificationCenterGetDarwinNotifyCenter(), NULL, NULL, NULL, NULL);
	}	
}

%end

%hook BBServer
-(id)initWithQueue:(id)arg1 {
    bbServer = %orig;
    return bbServer;
}

-(id)initWithQueue:(id)arg1 dataProviderManager:(id)arg2 syncService:(id)arg3 dismissalSyncCache:(id)arg4 observerListener:(id)arg5 utilitiesListener:(id)arg6 conduitListener:(id)arg7 systemStateListener:(id)arg8 settingsListener:(id)arg9 {
    bbServer = %orig;
    return bbServer;
}

- (void)dealloc {
  if (bbServer == self) {
    bbServer = nil;
  }

  %orig;
}
%end


static void UpdatePlayingPreferences() {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"dev.hyper.playing.prefs"];
    [preferences registerDefaults:@{
        @"enabled": @YES,
		@"customText": @""
    }];

    [preferences registerBool:&enabled default:NO forKey:@"enabled"];
	[preferences registerObject:&customText default:@"" forKey:@"customText"];
}

%ctor {
	UpdatePlayingPreferences();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)UpdatePlayingPreferences, CFSTR("dev.hyper.playing/ReloadPrefs"), NULL, kNilOptions);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)SendNotification, CFSTR("dev.hyper.playing/TestNotification"), NULL, kNilOptions);
}