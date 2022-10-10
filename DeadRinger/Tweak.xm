// 22 -3 ipx
#include <UIKit/UIKit.h>
// These headers aren't acurate, i'm lazy
@interface SBRingerPillView : UIView

@property (nonatomic,retain) UIView * materialView;                    //@synthesize materialView=_materialView - In the implementation block
@property (nonatomic,retain) UIView * silentModeLabel;                              //@synthesize silentModeLabel=_silentModeLabel - In the implementation block
@property (nonatomic,retain) UIView * ringerLabel;                                  //@synthesize ringerLabel=_ringerLabel - In the implementation block
@property (nonatomic,retain) UIView * onLabel;                                      //@synthesize onLabel=_onLabel - In the implementation block
@property (nonatomic,retain) UIView * offLabel;                                     //@synthesize offLabel=_offLabel - In the implementation block
@property (nonatomic,retain) UIView * slider;                      //@synthesize slider=_slider - In the implementation block
@property (nonatomic,retain) UIColor * glyphTintColor;                               //@synthesize glyphTintColor=_glyphTintColor - In the implementation block
@property (nonatomic,copy) NSArray * glyphTintBackgroundLayers;                      //@synthesize glyphTintBackgroundLayers=_glyphTintBackgroundLayers - In the implementation block
@property (nonatomic,copy) NSArray * glyphTintShapeLayers;                           //@synthesize glyphTintShapeLayers=_glyphTintShapeLayers - In the implementation block
@property (assign,nonatomic) unsigned long long state;  

@end

static bool isNotched()
{
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        switch ((int)[[UIScreen mainScreen] nativeBounds].size.height)
        {
            case 2436: 
            {
                return YES;
                break;
            }
            case 2688:
            {
                return YES;
                break;
            }
            case 1792:
            {
                return YES;
                break;
            }
            default:
            {
                return NO;
                break;
            }
        }
    }  
    return NO; 
}


%hook SBRingerPillView 

- (id)init 
{
	id x = %orig;
	[self setFrame:(CGRectMake(22,-3,self.frame.size.width,self.frame.size.height))];
	self.alpha = 0;
	self.hidden = YES;
	return x;
}
- (void)layoutSubviews
{
	self.alpha = 0;
	self.hidden = YES;
	[self setFrame:(CGRectMake(22,-3,self.frame.size.width,self.frame.size.height))];
	%orig;
	self.onLabel.alpha = 0;
	self.onLabel.hidden = YES;
	self.offLabel.alpha = 0;
	self.offLabel.hidden = YES;
	self.ringerLabel.alpha = 0;
	self.ringerLabel.hidden = YES;
	self.silentModeLabel.alpha = 0;
	self.silentModeLabel.hidden = YES;
	self.materialView.alpha = 0;
	self.materialView.hidden = YES;
	self.slider.alpha = 0;
	self.slider.hidden = YES;
}

- (void)setFrame:(CGRect)frame
{	
	if (isNotched())
	{
		%orig(CGRectMake(22, -3, frame.size.width, frame.size.height));
	}
	else 
	{
		%orig(CGRectMake(0, -10, frame.size.width, frame.size.height));
	}
	self.alpha = 1;
	self.hidden = NO;
}

- (CGRect)frame
{
	CGRect f  = %orig;
	if (isNotched())
	{
		return CGRectMake(22, -3, f.size.width, f.size.height);
	}
	else 
	{
		return CGRectMake(0, -10, f.size.width, f.size.height);
	}
}

- (void)setMaterialView:(UIView *)arg
{
	arg.alpha = 0;
	arg.hidden = YES;
	%orig(arg);
}

- (void)setTransform:(CGAffineTransform)transform 
{
	if (CGAffineTransformEqualToTransform(CGAffineTransformTranslate(CGAffineTransformIdentity, 0, -103), transform))
	{
		[[NSNotificationCenter defaultCenter] postNotificationName:@"DeadRingerStateZero" object:nil];
		self.hidden = YES;
	}
	%orig(CGAffineTransformIdentity);
}

- (CGAffineTransform)transform
{
	return CGAffineTransformIdentity;
}

- (void)setState:(NSUInteger)state
{
	%orig;
	if (state == 0)
		[[NSNotificationCenter defaultCenter] postNotificationName:@"DeadRingerStateZero" object:nil];
	else
		[[NSNotificationCenter defaultCenter] postNotificationName:@"DeadRingerStateOne" object:nil];
}

%end

@interface _UIStatusBarStringView : UIView 

@property (nonatomic, retain) NSString *text;

@end

%hook _UIStatusBarStringView

- (id)initWithFrame:(CGRect)frame 
{
	id x = %orig(frame);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveNotification:) name:@"DeadRingerStateZero" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recieveNotification:) name:@"DeadRingerStateOne" object:nil];
	return x;
}

%new 
- (void)recieveNotification:(NSNotification *)notification
{
	if (isNotched())
	{
		if (![self.text containsString:@":"]) return;
	}
	else 
	{
		if ([self.text containsString:@":"] || [self.text containsString:@"%%"]) return;
	}
	[UIView animateWithDuration:.1
	animations:
	^{
		self.alpha = ([[notification name] isEqualToString:@"DeadRingerStateOne"]) ? 0 : 1;
	}]; 
}

%end

%hook SBRingerHUDViewController

- (void)_layoutPillView
{
	//dont call super
	//NSLog(@"DeadRinger");
}

%end