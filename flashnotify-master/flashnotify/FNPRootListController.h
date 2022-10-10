#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <FrontBoardServices/FBSSystemService.h>
#import <SpringBoardServices/SBSRestartRenderServerAction.h>


@interface FNPRootListController : PSListController

@end

@interface FBSSystemService (ForwardNotifier)
+(id)sharedService;
-(void)sendActions:(id)arg1 withResult:(/*^block*/id)arg2 ;
@end

@interface SBSRelaunchAction (ForwardNotifier)
@property (nonatomic,copy,readonly) NSString * reason;
@property (nonatomic,readonly) unsigned long long options;
@property (nonatomic,retain,readonly) NSURL * targetURL;
+(id)actionWithReason:(id)arg1 options:(unsigned long long)arg2 targetURL:(id)arg3 ;
-(unsigned long long)options;
-(NSString *)reason;
-(id)initWithReason:(id)arg1 options:(unsigned long long)arg2 targetURL:(id)arg3 ;
-(NSURL *)targetURL;
@end
