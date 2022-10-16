#import <Preferences/PSListController.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBRespringController.h>
#import <Cephei/HBPreferences.h>
#include <spawn.h>


@interface HLPRootListController : HBRootListController
@property(nonatomic, retain) UIBarButtonItem *applyButton;
@property(nonatomic, retain) UIView *headerView;
@property(nonatomic, retain) HBPreferences *preferences;
@property(nonatomic, retain) UIImageView *headerImageView;
@property(nonatomic, retain) UIImageView *iconView;
@property(nonatomic, retain) UILabel *titleLabel;
- (void)resetPassword:(id)sender;
- (void)changesApplied;
//- (void)applySettings;
@end

@interface OBButtonTray : UIView
@property (nonatomic,retain) UIVisualEffectView * effectView;
- (void)addButton:(id)arg1;
- (void)addCaptionText:(id)arg1;;
@end

@interface OBBoldTrayButton : UIButton
-(void)setTitle:(id)arg1 forState:(unsigned long long)arg2;
+(id)buttonWithType:(long long)arg1;
@end

@interface OBWelcomeController : UIViewController
- (OBButtonTray *)buttonTray;
- (id)initWithTitle:(id)arg1 detailText:(id)arg2 icon:(id)arg3;
- (void)addBulletedListItemWithTitle:(id)arg1 description:(id)arg2 image:(id)arg3;
@end