#import <UIKit/UIKit.h>

//https://stackoverflow.com/a/5337804
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface UIView (Private)
-(UIViewController *)_viewControllerForAncestor;
@end

@interface SBUILegibilityLabel : UILabel{
	UILabel *_lookasideLabel;
}
-(void)setString:(NSString *)arg1 ;
@property (nonatomic,copy) NSString * string;       
@end

@interface SBFLockScreenDateSubtitleView : UIView
@property (nonatomic,retain) NSString * string; 
@property (nonatomic,retain) UIFont * font; 
@end

@interface SBFLockScreenDateSubtitleDateView : SBFLockScreenDateSubtitleView
@property (assign,nonatomic) double alignmentPercent;    
@property (nonatomic,retain) SBUILegibilityLabel * alternateDateLabel;              
@end

@interface SBFLockScreenDateView : UIView {
	SBFLockScreenDateSubtitleDateView* _dateSubtitleView;
	SBUILegibilityLabel* _timeLabel;
	SBFLockScreenDateSubtitleView* _customSubtitleView;
}
@property (assign,nonatomic) double alignmentPercent;         
-(void)updateFormat;
@end

@interface CSCombinedListViewController : UIViewController //iOS 13
-(void)_updateListViewContentInset;
-(void)layoutListView;
-(UIEdgeInsets)_listViewDefaultContentInsets;
@end

@interface SBDashBoardCombinedListViewController : UIViewController //iOS 12
-(void)_updateListViewContentInset;
-(void)layoutListView;
-(UIEdgeInsets)_listViewDefaultContentInsets;
@end

@interface CSCoverSheetView : UIView  //iOS 13
@property(assign,nonatomic) BOOL dateViewIsVibrant;                                                       
-(void)setDateViewIsVibrant:(BOOL)arg1 ;
@end

@interface SBDashBoardView : UIView  //iOS 12
@property(assign,nonatomic) BOOL dateViewIsVibrant;                                                       
-(void)setDateViewIsVibrant:(BOOL)arg1 ;
@end

@interface BSUICAPackageView : UIView
@end

@interface SBUIProudLockIconView : UIView{
	BSUICAPackageView* _lockView;
}
@end

@interface SBUIFaceIDCoachingView : UIView
@end

@interface SpringBoard : UIApplication
+(UIApplication *)sharedApplication;
-(NSInteger)activeInterfaceOrientation;
@end

#define kHeight [UIScreen mainScreen].bounds.size.height 
#define kWidth [UIScreen mainScreen].bounds.size.width 

static int orientation;
static SBUILegibilityLabel *timeLabel;
static SBFLockScreenDateSubtitleDateView *dateView;
static SBUILegibilityLabel *dateLabel;

//local
NSString *lockscreenDateVC;
CGFloat dateHeight;
CGFloat timeHeight;
CGFloat containerHeight;

//prefs
static BOOL isEnabled;

static int customAlignment;

static int fontStyle;

static CGFloat fontSize;

static CGFloat tfontWeight;
static CGFloat dfontWeight;

static BOOL dateAsText;
static BOOL compactDate;
static BOOL hideDate;
static BOOL hideLock;
static BOOL vibrancy;
