#import "WCHLSettingViewController.h"

@interface WCHLSettingViewController ()

@property (nonatomic, strong) MMTableViewInfo *m_tableViewInfo;


@end

@implementation WCHLSettingViewController
- (MMTableViewInfo *)m_tableViewInfo 
{
    if (!_m_tableViewInfo) 
    {
        _m_tableViewInfo = [[objc_getClass("MMTableViewInfo") alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    }
    return _m_tableViewInfo;
}

- (void)viewDidLoad 
{
    [super viewDidLoad];
 [self initTitle];
 [self reloadTableData];
    MMTableView *tableView = [self.m_tableViewInfo getTableView];
    if (@available(iOS 11, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
    }
    [self.view addSubview:tableView];
  //  [self.m_tableViewInfo addTableViewToSuperView:self.view];
}


- (void)initTitle {
    self.title = @"微信小小小助手";
}



- (void)reloadTableData
{
    [self.m_tableViewInfo clearAllSection];

    WCTableViewSectionManager *sectionInfo1 = [objc_getClass("WCTableViewSectionManager") sectionInfoFooter:@"去除公众号推送的文章内部的贴片广告、底部横幅广告等，但不是对所有文章都有效果；去除朋友圈广告"];

    WCTableViewSectionManager *sectionInfo2 = [objc_getClass("WCTableViewSectionManager") sectionInfoFooter:@"文本消息将以撤回提示的方式拦截保留，非文本消息将被正常保留并提示被撤回。不会拦截自己撤回的消息"];

    WCTableViewSectionManager *sectionInfo3 = [objc_getClass("WCTableViewSectionManager") sectionInfoDefaut];
    
    [sectionInfo2 addCell:[self createAntiRevokeCell]];
    [sectionInfo2 addCell:[self createCallKitCell]];
    [sectionInfo2 addCell:[self createTestCell]];
    [sectionInfo2 addCell:[self createMyRepoCell]];


    [self.m_tableViewInfo addSection:sectionInfo1];
    [self.m_tableViewInfo addSection:sectionInfo2];
    [self.m_tableViewInfo addSection:sectionInfo3];

    MMTableView *tableView = [self.m_tableViewInfo getTableView];
    [tableView reloadData];
}












- (WCTableViewCellManager *)createAntiRevokeCell 
{
    return [objc_getClass("WCTableViewCellManager") switchCellForSel:@selector(wc_revoke:) target:self title:@"防止消息撤回" on:[WCHLOptions sharedConfig].revoke];
}
- (void)wc_revoke:(UISwitch *)switchView
{
    [[WCHLOptions sharedConfig] setRevoke:switchView.isOn];
}




//创建开启callKitcell
- (WCTableViewCellManager *)createCallKitCell 
{
    return [objc_getClass("WCTableViewCellManager") switchCellForSel:@selector(wc_callKitEnable:) target:self title:@"CallKit功能" on:[WCHLOptions sharedConfig].callKitEnable];
}
- (void)wc_callKitEnable:(UISwitch *)switchView
{
    [[WCHLOptions sharedConfig] setCallKitEnable:switchView.isOn];
}


- (WCTableViewCellManager *)createTestCell 
{
    return [objc_getClass("WCTableViewCellManager") switchCellForSel:@selector(wc_test:) target:self title:@"test" on:[WCHLOptions sharedConfig].test];
}
- (void)wc_test:(UISwitch *)switchView
{
   // [[WCHLOptions sharedConfig] setCallKitEnable:switchView.isOn];
}


- (WCTableViewCellManager *)createMyRepoCell 
{
    return [objc_getClass("WCTableViewCellManager") centerCellForSel:@selector(openMyRepo) target:self title:@"源地址"];
}
- (void)openMyRepo
{
    [[UIApplication sharedApplication] openURL:
        [NSURL URLWithString:@"https://banaisakula.github.io/"]
        options:@{}
        completionHandler:nil];
}



-(void)loadView {
	[super loadView];
    
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(exitApp)];
}
- (void)exitApp 
{
    //来 加个动画，给用户一个友好的退出界面
    [UIView beginAnimations:@"exitApp" context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view.window cache:NO];
    [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
    self.view.window.bounds = CGRectMake(0, 0, 0, 0);
    [UIView commitAnimations];
}
- (void)animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if ([animationID compare:@"exitApp"] == 0) 
        exit(0);
}


@end