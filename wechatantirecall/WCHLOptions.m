//
//  WCHLOptions.m
//  WCSettingUI
//
//  Created by 排骨 on 2020/8/4.
//  Copyright © 2020 排骨. All rights reserved.
//

#import "WCHLOptions.h"
#define WCDefaults [NSUserDefaults standardUserDefaults]

static NSString * const wcjbbypass = @"jbbypass";
static NSString * const wcads = @"ads";
static NSString * const wcrevoke = @"revoke";
static NSString * const wcblurEffect = @"blurEffect";
static NSString * const wcshowStory = @"showStory";
static NSString * const wccallKitEnable = @"callKitEnable";
static NSString * const wctest = @"test";

@implementation WCHLOptions

+ (instancetype)sharedConfig
{
    static WCHLOptions *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[WCHLOptions alloc] init];
    });
    return config;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _ads = [WCDefaults boolForKey:wcads];
        _revoke = [WCDefaults boolForKey:wcrevoke];
        _callKitEnable = [WCDefaults boolForKey:wccallKitEnable];
    }
    return self;
}

- (void)setAds:(BOOL)ads
{
    _ads = ads;
    [WCDefaults setBool:ads forKey:wcads];
    [WCDefaults synchronize];
}

- (void)setRevoke:(BOOL)revoke
{
    _revoke = revoke;
    [WCDefaults setBool:revoke forKey:wcrevoke];
    [WCDefaults synchronize];
}


- (void)setCallKitEnable:(BOOL)callKitEnable
{
    _callKitEnable = callKitEnable;
    [WCDefaults setBool:callKitEnable forKey:wccallKitEnable];
    [WCDefaults synchronize];
}

- (void)settest:(BOOL)test
{
  //	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title of Example Alert" message:@"This is message of example Alert feel free to ignore what is written here, more words to make it a litle bit longer. \n \n All glory Hypnotoad." preferredStyle:UIAlertControllerStyleAlert];
//	[alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
//	[alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
	//[self presentViewController:alert animated:YES completion:nil];  //_callKitEnable = callKitEnable;
   _test = test;
   NSLog (@"bismih 日志%@", wctest);
    [WCDefaults setBool:test forKey:wctest];
   [WCDefaults synchronize];
}








@end
