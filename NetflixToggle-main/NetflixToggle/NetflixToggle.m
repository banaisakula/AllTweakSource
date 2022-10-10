#import "NetflixToggle.h"


@implementation NetflixToggle


- (UIImage *)iconGlyph {

	return [UIImage imageNamed:@"NetflixToggle" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];

}


- (UIColor *)selectedColor {

	return UIColor.clearColor;

}


- (BOOL)isSelected {
	
	return _selected;

}


- (void)setSelected:(BOOL)selected {

	_selected = selected;

	[super refreshState];

	if(_selected) {

		[[UIApplication sharedApplication] launchApplicationWithIdentifier:@"com.tencent.mqq" suspended:0];
		[self setSelected:NO];
		[NSNotificationCenter.defaultCenter postNotificationName:@"dismissCCNotificationReceived" object:nil];

	}

}


@end
