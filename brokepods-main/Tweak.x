@interface AVSystemController : NSObject 
+(id)sharedAVSystemController;
-(id)attributeForKey:(id)arg0 ;
@end

@interface BrokePodsConnectionViewController : UIViewController {
	UIView *_container;
}
@end

static UIImage *UIKitImage(NSString *name)
{
    NSString *artworkPath = @"/System/Library/PrivateFrameworks/UIKitCore.framework/Artwork.bundle";
    NSBundle *artworkBundle = [NSBundle bundleWithPath:artworkPath];
    if (!artworkBundle)
    {
        artworkPath = @"/System/Library/Frameworks/UIKit.framework/Artwork.bundle";
        artworkBundle = [NSBundle bundleWithPath:artworkPath];
    }
    UIImage *img = [UIImage imageNamed:name inBundle:artworkBundle compatibleWithTraitCollection:nil];
    return [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

@implementation BrokePodsConnectionViewController
-(void)viewDidLoad {
	UILayoutGuide *margins = self.view.layoutMarginsGuide;
	[super viewDidLoad];
	_container = [[UIView alloc] init];
	_container.backgroundColor = [UIColor whiteColor];
	_container.translatesAutoresizingMaskIntoConstraints = NO;
	_container.layer.cornerRadius = 30;
	[self.view addSubview:_container];

	[_container.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor].active = YES;
	[_container.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor].active = YES;
	[_container.bottomAnchor constraintEqualToAnchor:margins.bottomAnchor].active = YES;
	[_container.heightAnchor constraintEqualToConstant:350].active = YES;

	UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[closeButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
	[closeButton setImage:UIKitImage(@"UITextFieldStarkClearButton") forState:UIControlStateNormal];
	closeButton.tintColor = [UIColor colorWithRed: 0.95 green: 0.95 blue: 0.98 alpha: 1.00];
	closeButton.translatesAutoresizingMaskIntoConstraints = NO;
	closeButton.backgroundColor = [UIColor colorWithRed: 0.58 green: 0.57 blue: 0.59 alpha: 1.00];
	closeButton.layer.cornerRadius = 20;
	[_container addSubview:closeButton];

	[_container addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[closeButton]-15-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(closeButton)]];
	[_container addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[closeButton]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(closeButton)]];
	[closeButton.heightAnchor constraintEqualToConstant:30].active = YES;
	

	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
	[button setTitle:@"Done" forState:UIControlStateNormal];
	[button.titleLabel setFont:[UIFont boldSystemFontOfSize:17]];
	[button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
	button.backgroundColor = [UIColor colorWithRed: 0.83 green: 0.82 blue: 0.87 alpha: 1.00];
	button.translatesAutoresizingMaskIntoConstraints = NO;
	button.layer.cornerRadius = 10;
	[_container addSubview:button];

	[_container addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_container attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
	[_container addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(button)]];
	[button.heightAnchor constraintEqualToConstant:50].active = YES;
	[button.widthAnchor constraintEqualToConstant:[UIScreen mainScreen].bounds.size.width - 75].active = YES;

	UILabel *label = [[UILabel alloc] init];
	label.text = @"BrokePods";
	label.textColor = [UIColor colorWithRed: 0.50 green: 0.50 blue: 0.50 alpha: 1.00];
	label.font = [UIFont systemFontOfSize:30];
	label.translatesAutoresizingMaskIntoConstraints = NO;
	[_container addSubview:label];

	[_container addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_container attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
	[_container addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(label)]];

	UIImage *image = [self imageWithImage:[UIImage imageWithContentsOfFile:@"/Library/Application Support/brokepods/brokepods.png"] convertToSize:CGSizeMake(225, 225)];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
	imageView.translatesAutoresizingMaskIntoConstraints = NO;
	[_container addSubview:imageView];

	[_container addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_container attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
	[imageView.bottomAnchor constraintEqualToAnchor:button.topAnchor].active = YES;
}
-(void)dismiss {
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();    
    UIGraphicsEndImageContext();
    return destImage;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[super touchesBegan:touches withEvent:event];
	UITouch* touch = [[touches allObjects] objectAtIndex:0];
	CGPoint location = [touch locationInView:self.view];
	if(!CGRectContainsPoint(_container.frame, location)) {
		[self dismiss];
	}
}
@end

// This is the most cursed code, please don't judge me
%hook SpringBoard
BrokePodsConnectionViewController *vc;
-(void)applicationDidFinishLaunching:(id)application {
	%orig;
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleRouteChange:) name:@"AVSystemController_HeadphoneJackIsConnectedDidChangeNotification" object:[AVSystemController sharedAVSystemController]];
}

%new
-(void)handleRouteChange:(NSNotification *)notif {
	bool connected = [[notif.object attributeForKey:@"AVSystemController_HeadphoneJackIsConnectedAttribute"] boolValue];
	if(connected) {
		vc = [[BrokePodsConnectionViewController alloc] init];
		[[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];
		connected = !connected;
		return;
	}
	[vc dismiss];
	connected = !connected;
}
%end