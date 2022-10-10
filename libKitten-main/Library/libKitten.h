//
//  libKitten.h
//  libKitten
//
//  Created by Alexandra (@Traurige)
//

#import <UIKit/UIKit.h>

static const int kBackgroundColorCalculation = 0;
static const int kPrimaryColorCalculation = 1;
static const int kSecondaryColorCalculation = 2;

@interface libKitten : NSObject
+ (UIColor *)backgroundColor:(UIImage *)image;
+ (UIColor *)primaryColor:(UIImage *)image;
+ (UIColor *)secondaryColor:(UIImage *)image;
+ (BOOL)isDarkImage:(UIImage *)image;
+ (BOOL)isDarkColor:(UIColor *)color;
@end
