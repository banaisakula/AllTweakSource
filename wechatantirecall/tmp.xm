#import "WCHLHeaders.h"

#import "WCHLSettingViewController.h"
//#define darkColor [UIColor colorWithRed:(17/255.0f) green:(17/255.0f)blue:(17/255.0f) alpha:1.0f]
//#define lightColor [UIColor colorWithRed:(237/255.0f) green:(237/255.0f)blue:(237/255.0f) alpha:1.0f]
//#define tweakVersion @"预览版0.0.6"

//#pragma mark 插件设置入口

%hook NewSettingViewController
//插件设置入口

- (void)reloadTableData
{
	%orig;
	MMTableViewInfo *tableViewMgr = MSHookIvar<id>(self, "m_tableViewMgr");

	WCTableViewSectionManager *sectionInfo = [%c(WCTableViewSectionManager) defaultSection];

	//NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
	//NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];

//	if([self versionCompareFirst:appVersion andVersionSecond:@"7.0.15"] != -1)
//	{
//		WCTableViewCellManager *settingCell = [%c(WCTableViewCellManager) normalCellForSel:@selector(setting) target:self title:@"WeChatHookLite" rightValue:tweakVersion canRightValueCopy:NO];
//		[sectionInfo addCell:settingCell];
//	}
		
//	else
//	{
		WCTableViewCellManager *settingCell = [%c(WCTableViewCellManager) normalCellForSel:@selector(setting) target:self title:@"bismih微信" ] ;//WithDisclosureIndicator:YES];
		[sectionInfo addCell:settingCell];
//	}

	[tableViewMgr insertSection:sectionInfo At:4];

	MMTableView *tableView = [tableViewMgr getTableView];
	[tableView reloadData];
}

%new
- (void)setting 
{
    WCHLSettingViewController *settingViewController = [[WCHLSettingViewController alloc] init];
    [settingViewController setHidesBottomBarWhenPushed:YES];
    [((UIViewController *)self).navigationController PushViewController:settingViewController animated:YES];
	//WCHLViewController *settingViewController = [[WCHLViewController alloc] init];
	//[settingViewController setHidesBottomBarWhenPushed:YES];
	//[((UIViewController *)self).navigationController PushViewController:settingViewController animated:YES];
}


//- (void)setting 
   // {
   //     WCHLViewController *settingViewController = [[WCHLViewController alloc] init];
  ///    [settingViewController setHidesBottomBarWhenPushed:YES];
  //      [((UIViewController *)self).navigationController PushViewController:settingViewController animated:YES];
   // }


%end






