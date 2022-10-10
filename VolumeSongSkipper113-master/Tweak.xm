#import "MediaRemote.h"
#import <AudioToolbox/AudioServices.h>

@interface SBApplication
-(NSString *)bundleIdentifier;
@end

@interface SpringBoard : NSObject
-(BOOL)_handlePhysicalButtonEvent:(id)arg1 ;
-(void)_simulateHomeButtonPress;
-(void)_simulateLockButtonPress;
-(void)takeScreenshot;
-(SBApplication *)_accessibilityFrontMostApplication;
@end
 
@interface SBMediaController : NSObject
+ (instancetype)sharedInstance;
-(BOOL)_sendMediaCommand:(unsigned)command;
-(float)volume;
@end

@interface AVSystemController

+ (id)sharedAVSystemController;

- (BOOL)getActiveCategoryVolume:(float*)volume andName:(id*)name;
- (BOOL)setActiveCategoryVolumeTo:(float)to;

@end


typedef NS_ENUM(uint32_t, MRMediaRemoteCommand) {
    MRMediaRemoteCommandPlay,
    MRMediaRemoteCommandPause,
    MRMediaRemoteCommandTogglePlayPause,
    MRMediaRemoteCommandStop,
    MRMediaRemoteCommandNextTrack,
    MRMediaRemoteCommandPreviousTrack,
    MRMediaRemoteCommandAdvanceShuffleMode,
    MRMediaRemoteCommandAdvanceRepeatMode,
    MRMediaRemoteCommandBeginFastForward,
    MRMediaRemoteCommandEndFastForward,
    MRMediaRemoteCommandBeginRewind,
    MRMediaRemoteCommandEndRewind,
    MRMediaRemoteCommandRewind15Seconds,
    MRMediaRemoteCommandFastForward15Seconds,
    MRMediaRemoteCommandRewind30Seconds,
    MRMediaRemoteCommandFastForward30Seconds,
    MRMediaRemoteCommandToggleRecord,
    MRMediaRemoteCommandSkipForward,
    MRMediaRemoteCommandSkipBackward,
    MRMediaRemoteCommandChangePlaybackRate,
    MRMediaRemoteCommandRateTrack,
    MRMediaRemoteCommandLikeTrack,
    MRMediaRemoteCommandDislikeTrack,
    MRMediaRemoteCommandBookmarkTrack,
    MRMediaRemoteCommandSeekToPlaybackPosition,
    MRMediaRemoteCommandChangeRepeatMode,
    MRMediaRemoteCommandChangeShuffleMode,
    MRMediaRemoteCommandEnableLanguageOption,
    MRMediaRemoteCommandDisableLanguageOption
};

BOOL upPressed = NO;
BOOL downPressed = NO;
BOOL upRecentlyPressed = NO;
BOOL downRecentlyPressed = NO;
BOOL shouldScreenshot = NO;


NSTimer *upRecentTimer;
NSTimer *downRecentTimer;
NSTimer *forwardTimer;
NSTimer *backTimer;

%hook SpringBoard 
	-(_Bool)_handlePhysicalButtonEvent:(UIPressesEvent *)arg1 
	{
		if([[[self _accessibilityFrontMostApplication] bundleIdentifier] isEqualToString:@"com.apple.camera"]){
			return %orig;
		}
        BOOL passEvent = NO;
        BOOL hasUp = NO;
        BOOL hasDown = NO;
		BOOL hasLock = NO;


        for(UIPress* press in arg1.allPresses.allObjects) {
            if (press.type == 102 && press.force == 1) {
                hasUp = YES;
            }
            if (press.type == 103 && press.force == 1) {
                hasDown = YES;
            }
	        if (press.type == 104 && press.force == 1) {
		        hasLock = YES;
			}
        }


        if (hasUp && hasDown) {
            MRMediaRemoteSendCommand(kMRTogglePlayPause, nil);
            AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(1520), ^{
                AudioServicesDisposeSystemSoundID(SystemSoundID(1520));
            });
            return false;
        }
		if(hasUp && hasLock){
	        shouldScreenshot = true;
			return false;
		}


		int type = arg1.allPresses.allObjects[0].type; 
		int force = arg1.allPresses.allObjects[0].force;

        // type = 101 -> Home button
        // type = 104 -> Power button
        // if I remember well, 102 and 103 are volume buttons

        // force = 0 -> button released
        // force = 1 -> button pressed
		
		if(type == 102 && force == 1) //VOLUME UP PRESSED
		{
            upPressed = YES;
            forwardTimer = [[NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(goForward) userInfo:nil repeats:NO] retain];
            if (backTimer != nil) {
                [backTimer invalidate];
                backTimer = nil;
            }
		}

        if (type == 103 && force == 1) //VOLUME DOWN PRESSED
        {
            downPressed = YES;
            backTimer = [[NSTimer scheduledTimerWithTimeInterval:.5 target:self selector:@selector(goBackward) userInfo:nil repeats:NO] retain];
            if (forwardTimer != nil) {
                [forwardTimer invalidate];
                forwardTimer = nil;
            }
        }

        if(type == 102 && force == 0) //VOLUME UP RELEASED
        {	
            if (upPressed) {
				if (shouldScreenshot){
					[self takeScreenshot];
					shouldScreenshot = false;
				}else{
					//Do volume up
					float volume;
					[[objc_getClass("AVSystemController") sharedAVSystemController] getActiveCategoryVolume:&volume andName:nil];
					volume = volume + 1.0/16;
					if (volume > 1) volume = 1;
					[[objc_getClass("AVSystemController") sharedAVSystemController] setActiveCategoryVolumeTo:volume];
				}
            }
            upPressed = NO;
            if (forwardTimer != nil) {
                [forwardTimer invalidate];
                forwardTimer = nil;
            }
        }

        if (type == 103 && force == 0) //VOLUME DOWN RELEASED
        {
            if (downPressed) {
                //Do volume down
                float volume;
                [[objc_getClass("AVSystemController") sharedAVSystemController] getActiveCategoryVolume:&volume andName:nil];
                volume = volume - 1.0/16.0;
                if (volume < 0) volume = 0;
                [[objc_getClass("AVSystemController") sharedAVSystemController] setActiveCategoryVolumeTo:volume];
            }
            downPressed = NO;
            if (backTimer != nil) {
                [backTimer invalidate];
                backTimer = nil;
            }
        }

        if ((type == 102 || type == 103) && !passEvent) return false;
		return %orig;
		
	}

    %new
    - (void)goForward
    {
        if (upPressed) {
            MRMediaRemoteSendCommand(kMRNextTrack, nil);
            AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(1520), ^{
                AudioServicesDisposeSystemSoundID(SystemSoundID(1520));
            });
            upPressed = NO;
        }
    }

    %new
    - (void)goBackward
    {
        if (downPressed) {
            MRMediaRemoteSendCommand(kMRPreviousTrack, nil);
            AudioServicesPlaySystemSoundWithCompletion(SystemSoundID(1520), ^{
                AudioServicesDisposeSystemSoundID(SystemSoundID(1520));
            });
            downPressed = NO;
        }
    }
%end



	

