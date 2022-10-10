@interface _UIStatusBarStringView : UIView
@property (nonatomic, retain) NSString *text;
- (void)updateTimer;
@end

static bool is24h;

%hook _UIStatusBarStringView
-(id)initWithFrame:(CGRect)arg1 {
    id o = %orig;
    NSTimer *textTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:textTimer forMode:NSDefaultRunLoopMode];
    return o;
}

%new
- (void)updateTimer {
    CATransition *transition = [CATransition animation];
    transition.duration = 0.7f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.layer addAnimation:transition forKey:nil];
    
    if ([self.text containsString:@":"]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        if (is24h) {
            [dateFormatter setDateFormat:@"dd/M"];
        } else {
            [dateFormatter setDateFormat:@"M/dd"];
        }
        self.text = [dateFormatter stringFromDate:[NSDate date]];
    } else if ([self.text containsString:@"/"]) {
        NSDateFormatter *origDateFormatter = [[NSDateFormatter alloc] init];
        if (is24h) {
            [origDateFormatter setDateFormat:@"H:mm"];
        } else {
            [origDateFormatter setDateFormat:@"h:mm"];
        }
        self.text = [origDateFormatter stringFromDate:[NSDate date]];
    }
}
%end
