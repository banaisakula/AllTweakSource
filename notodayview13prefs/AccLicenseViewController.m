#import "AccLicenseViewController.h"
#define kBundlePath @"/Library/PreferenceBundles/NoTodayView13Prefs.bundle"


@implementation AccLicenseViewController
-(void)loadView{
	[super loadView];
    self.navigationItem.title = @"Licenses";
    UITextView*textView=[UITextView new];
    [textView setFrame:[self.view frame]];

    NSString*licenses=[NSString stringWithContentsOfFile:[NSString stringWithFormat:@"%@/licenses.txt",kBundlePath] encoding:NSUTF8StringEncoding error:nil];
    [textView setText:licenses];

    [self.view addSubview:textView];
    
}





-(void)showLicenses{
  UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
  self.navigationItem.backBarButtonItem = backItem; 
  [self.navigationController pushViewController:[[AccLicenseViewController alloc] init] animated:TRUE];
}
@end