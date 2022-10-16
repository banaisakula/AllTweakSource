#import <UIKit/UIKit.h>
//为了编译通过
#import <spawn.h>
#define HKDefaults [NSUserDefaults standardUserDefaults]
#define HKSWITCHKEY @"HKSWITCHKEY"
#define HKTIMEKEY @"HKTIMEKEY"
@interface WCTableViewManager:NSObject
- (long long)numberOfSectionsInTableView:(UITableView *)tableView;
@end

@interface MMUIViewController : UIViewController
- (void)setTitle:(id)arg1;
- (double)getVisibleHeight;
- (void)initNavHeaderIfNeed;
@end

@interface NewSettingViewController : MMUIViewController
{
    WCTableViewManager *m_tableViewMgr;
}
- (int)compareArray1:(NSMutableArray *)array1 andArray2:(NSMutableArray *)array2;
- (int)versionCompareFirst:(NSString *)first andVersionSecond: (NSString *)second;

@end



%hook WCTableViewManager




- (double)tableView:(UITableView *)tableView heightForRowAtIndexPath:(id)indexPath{
    //定位设置页面
    if([tableView.nextResponder.nextResponder isKindOfClass:%c(NewSettingViewController)] && [indexPath section] ==
       [self numberOfSectionsInTableView:tableView] - 1){
        return 44;
    }
    return %orig;
}
//cell
- (id)tableView:(UITableView *)tableView cellForRowAtIndexPath:(id)indexPath{
    //定位设置页面
    if([tableView.nextResponder.nextResponder isKindOfClass:%c(NewSettingViewController)] && [indexPath section] ==
       [self numberOfSectionsInTableView:tableView] - 1){



        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        if([indexPath row] == 0){

                cell.textLabel.text = @"测试1";
            
            
            }else if([indexPath row] == 1){

                cell.textLabel.text = @"测试2";
            
            }
        else if([indexPath row] == 2){


     static NSString * swCell = @"SWCELL";
        cell = [tableView dequeueReusableCellWithIdentifier:swCell];
            if(!cell){
                cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];	


            }
cell.textLabel.text = @"关闭xxx";
            UISwitch * switchView = [[UISwitch alloc] init];
            switchView.on = [HKDefaults boolForKey:HKSWITCHKEY];
            [switchView addTarget:self action:@selector(switchChang:) forControlEvents:(UIControlEventValueChanged)];
            cell.accessoryView = switchView;
            cell.imageView.image = [UIImage imageNamed:([HKDefaults boolForKey:HKSWITCHKEY] == 1) ? @"unlocked" : @"locked"];
    
	 }

cell.backgroundColor = [UIColor whiteColor];
 return cell;
		
    }
    return %orig;
}
//每一组有多少行
- (long long)tableView:(UITableView *)tableView numberOfRowsInSection:(long long)section{
    //定位设置页面
    if([tableView.nextResponder.nextResponder isKindOfClass:%c(NewSettingViewController)] && section ==
       [self numberOfSectionsInTableView:tableView] - 1){
        return 1;
    }
    return %orig;
}
//有多少组
- (long long)numberOfSectionsInTableView:(UITableView *)tableView{
    //定位设置页面
    if([tableView.nextResponder.nextResponder isKindOfClass:%c(NewSettingViewController)]){
        NSLog(@"-------设置页面-------");
        //在原来的基础上多搞一组
        return %orig+1;
    }
    return %orig;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(id)indexPath
{
%orig;
 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Title of Example Alert" message:@"This is message of example Alert feel free to ignore what is written here, more words to make it a litle bit longer. \n \n All glory Hypnotoad." preferredStyle:UIAlertControllerStyleAlert];
	[alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
	[alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];

   //	[self presentViewController:alert animated:YES completion:nil];
    //NewSettingViewController *WCHLAboutMeViewController = [[NewSettingViewController alloc] init];
   // WCHLAboutMeViewController.hidesBottomBarWhenPushed = YES;
   // [self presentViewController:WCHLAboutMeViewController animated:YES completion:nil];



	//	if ([indexPath section] != [self numberOfSectionsInTableView:tableView] - 1)
	//	{
	//		%orig;
	//		return;
	//	}
		
	//	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	//	if ([indexPath row] == 0)
	//	{

 //    NewSettingViewController* WCHLAboutMeViewController = [[NewSettingViewController alloc]init];

  //  [self.navigationController pushViewController:WCHLAboutMeViewController animated:YES];

//}




 //  SecondViewController* second=[[SecondViewController alloc]init];
 //   
  //  [appDelegate.navController pushViewController:second animated:YES];


           /// NewSettingViewController *WCHLAboutMeViewController = [NewSettingViewController new];
	//		ViewController *WCHLAboutMeViewController = [[ViewController alloc] init];  //我自己用xcode写了一个ViewController，点击的时候进入这个页面
		//	[self.navigationController pushViewController:WCHLAboutMeViewController animated:YES];
		//}
	}

%end

%hook VoipCXMgr
//开启callkit功能
+ (BOOL)isCallkitAvailable
{
    return [WCHLOptions sharedConfig].callKitEnable;
}
+ (BOOL)isDeviceCallkitAvailable
{
    return [WCHLOptions sharedConfig].callKitEnable;
}

%end


%hook MMImagePickerController
-(bool) isOriginalImage
    return [WCHLOptions sharedConfig].test;
%end





%hook MicroMessengerAppDelegate
//后台高斯模糊
- (void)applicationDidEnterBackground:(UIApplication*)application 
{
	%orig;
	if (![WCHLOptions sharedConfig].blurEffect)
		return;

	if(!_blurView) 
	{
		if (@available(iOS 13.0, *)) 
		{
			UIUserInterfaceStyle mode = UITraitCollection.currentTraitCollection.userInterfaceStyle;
			if (mode == UIUserInterfaceStyleDark)
			{
				//深色模式
				UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
				_blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
			}
			else
			{
				//浅色模式
				UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
				_blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
			}
				
		}
		else
		{
			//非iOS13，无深色模式，给予浅色模糊效果
			UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
			_blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
		}
		_blurView.frame = self.window.bounds;
	}
	//进入后台实现模糊效果
	[self.window addSubview:_blurView];

	_footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
	_footer.backgroundColor = [UIColor whiteColor];
	UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
	lab.text = @"WeChatHookLite全力保护你的信息安全";
	lab.font = [UIFont systemFontOfSize:15];
	lab.textColor = [UIColor grayColor];
	lab.textAlignment = NSTextAlignmentCenter;
	_footer.autoresizingMask = UIViewAutoresizingNone;
	[_footer addSubview:lab];

	[self.window addSubview:_footer];
}

- (void)applicationWillEnterForeground:(UIApplication*)application
{
	//进入前台
	%orig;
	if (![WCHLOptions sharedConfig].blurEffect)
		return;

	[_footer removeFromSuperview];
	[_blurView removeFromSuperview];

	//设置为nil将导致杀后台
	// [self setFooter:nil];
	// [self setBlurView:nil];
}

%end


