@interface NCNotificationShortLookViewController
-(id)_presentedLongLookViewController;
-(void)addGestureRecognizer:(id)arg1;
@property (assign, nonatomic) UIView *view;
@end

@interface NCNotificationListCell
-(void)_executeDefaultActionIfCompleted;
-(void)setExecutingDefaultAction:(BOOL)arg1;
-(void)setSupportsSwipeToDefaultAction:(BOOL)arg1 ;
-(BOOL)isActionButtonsFullyRevealed;
-(NCNotificationShortLookViewController *)contentViewController;

@end

@interface SBLockScreenManager
+(SBLockScreenManager *)sharedInstance;
-(BOOL)isUILocked;
@end

%hook NCNotificationListCell
bool changeThreshold = false;
-(CGFloat)_defaultActionExecuteThreshold{
	if(changeThreshold == false){
		return %orig;
	}else{
		return -1;
	}
}

-(CGFloat)_defaultActionOvershootContentOffset{return 0;}

-(void)layoutSubviews{
	%orig;
	bool isLocked = [[%c(SBLockScreenManager) sharedInstance] isUILocked];
	if(isLocked == true){
		if(MSHookIvar<NSMutableArray *>([self contentViewController].view, "_gestureRecognizers") == nil)
		{
			UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dood:)];
			[[self contentViewController].view addGestureRecognizer:singleFingerTap];
			[self setSupportsSwipeToDefaultAction:false];
		}
	}
}
%new
-(void)dood:(UITapGestureRecognizer *)recognizer{
	bool isLocked = [[%c(SBLockScreenManager) sharedInstance] isUILocked];
	if((isLocked == true) && ([self isActionButtonsFullyRevealed] == false) && ([[self contentViewController] _presentedLongLookViewController] == nil))
	{		
		changeThreshold = true;
		[self setSupportsSwipeToDefaultAction:true];
		[self _executeDefaultActionIfCompleted];
		[self setSupportsSwipeToDefaultAction:false];
		changeThreshold = false;
	}
}
%end
