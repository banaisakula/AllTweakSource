//  December 15, 2019
//
//  Spotlightizer
//
//  Copyright (C) 1di4r 2019-2020

#import "Tweak.h"       

NSDictionary *cPrefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/cf.1di4r.spotlightizer_pref.plist"];

//MARK: iOS 13
%group Spotlightizer13

%hook SBHomeScreenSpotlightViewController
   -(void)viewWillAppear:(BOOL)arg1{
        if(enabled){
            [self.viewIfLoaded setBackgroundColor:(LCPParseColorString([cPrefs objectForKey:@"Color"], @"#0F171E"))];
            return %orig;
        }else {
             return %orig;
        }
    }

%end 

//MARK: In ios 13 there are 2 other ways to change the background of Spotlight view
// They require Filtering 'com.apple.Spotlight' in spotlightizer.plist

/*%hook UINavigationTransitionView
    -(void)_cleanupTransition{
         if(enabled){
            %orig;
            self.backgroundColor = (LCPParseColorString([cPrefs objectForKey:@"Color"], @"#0F171E"));

         }else {
            return %orig;
        }
}

%end
*/

/*%hook SPUISecureWindow
    -(void)layoutSubviews{
         if(enabled){
            %orig;
            self.backgroundColor = (LCPParseColorString([cPrefs objectForKey:@"Color"], @"#0F171E"));

         }else {
            return %orig;
        }
}

%end*/

%hook _MTStaticVibrantColorMaterialView
     -(void)_updateContentVisualStylingIfNecessary{
        if(killBackgroundBlur){
            self.hidden = YES;
        }else{
            %orig;
        }
    }

 %end

%end

//MARK: iOS 11-12
%group Spotlightizer

%hook SBSpotlightNavigationController
      -(void)viewWillAppear:(BOOL)arg1{
        if(enabled){
            [self.view setBackgroundColor:(LCPParseColorString([cPrefs objectForKey:@"Color"], @"#0F171E"))];
            return %orig;
        }else {
             return %orig;
        }

    }

    %end
%hook UIGroupTableViewCellBackground        
    -(id)initWithFrame:(CGRect)frame{
         if(killBackgroundBlur){
            %orig;
            return nil;

            }else {
                return %orig;
            }
    }

    %end 

%end


//MARK: ctor
static void prefChanged() {

    HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"cf.1di4r.spotlightizer_pref"];
    enabled = [([prefs objectForKey:@"enabled"] ?: @(YES)) boolValue];
    killBackgroundBlur = [([prefs objectForKey:@"killBackgroundBlur"] ?: @(YES)) boolValue]; 

}  
%ctor{
    prefChanged();

    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version >= 13){
        %init(Spotlightizer13);

    }else if (version < 13) {
        %init(Spotlightizer);

     }else{
     // unsupported iOS versions
    }
}
