#import <substrate.h>

@interface UIInputSwitcherView
@end
@interface UIInputSwitcherItem : NSObject 
@property (nonatomic,copy) NSString * identifier;  
@end
%hook UIInputSwitcherView
-(void)_reloadInputSwitcherItems{
    %orig;
    NSArray* m_inputSwitcherItems=MSHookIvar<NSArray*>(self,"m_inputSwitcherItems");
    NSMutableArray*myItems=[m_inputSwitcherItems mutableCopy];
    for(int i=[m_inputSwitcherItems count]-1;i+1;i--){
        if([[m_inputSwitcherItems[i] identifier] isEqualToString:@"launchdictationsettings"]){
            [myItems removeObjectAtIndex:i];
        }
        if([[m_inputSwitcherItems[i] identifier] isEqualToString:@"launchkeyboardsettings"]){
            [myItems removeObjectAtIndex:i];
        }
        if([[m_inputSwitcherItems[i] identifier] isEqualToString:@"handbiasswitch"]){
            [myItems removeObjectAtIndex:i];
        }
    }
    NSLog(@"%@",myItems);
    MSHookIvar<NSArray*>(self,"m_inputSwitcherItems")=myItems;
}
%end

%ctor{
	NSLog(@"ctor: NoKeyboardSettings");
}
