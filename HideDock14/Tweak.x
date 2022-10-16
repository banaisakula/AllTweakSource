#import "Tweak.h"
%hook SBDockView
-(void)setBackgroundAlpha:(double)arg1 {
%orig(0);
}
%end
