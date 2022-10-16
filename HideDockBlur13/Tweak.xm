@interface SBDockView : UIView
@end

@interface SBWallpaperEffectView : UIView
@end

%hook SBDockView
-(void)layoutSubviews
{
    %orig;
    MSHookIvar<SBWallpaperEffectView *>(self,"_backgroundView").hidden = YES;
}
%end