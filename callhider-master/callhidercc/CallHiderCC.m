#import "CallHiderCC.h"

@implementation CallHiderCC

//Return the icon of your module here
- (UIImage *)iconGlyph
{
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

//Return the color selection color of your module here
- (UIColor *)selectedColor
{
	return [UIColor redColor];
}

- (BOOL)isSelected
{
  return [[[NSUserDefaults standardUserDefaults] valueForKey:@"CallHider-Status"] boolValue];
}

- (void)setSelected:(BOOL)selected
{
	_selected = selected;

  [super refreshState];

  if(_selected)
  {
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"CallHider-Status"];
  }
  else
  {
    [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"CallHider-Status"];
  }
}

@end
