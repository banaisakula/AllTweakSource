#import <UIKit/UIKit.h>


#define prefs @"/var/mobile/Library/Preferences/com.eliofegh.date-bar.plist"









NSMutableDictionary *MutDiction;   
static NSString *prefsAnswer;
//定义俩变量






void loadprefs(){

 MutDiction = [[NSMutableDictionary alloc] initWithContentsOfFile: prefs];

//to get the user input
prefsAnswer = [MutDiction objectForKey: @ "answer"];



}




%hook _UIStatusBarStringView


-(void)setText:(id)arg1{



//so it just changes the time and not anything else written on the status bar
 if([arg1 containsString:@":"]){

 NSDate* currentDate = [NSDate date];

 NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
formatter.dateFormat = prefsAnswer;
NSString *string = [formatter stringFromDate:currentDate];

//if there isn't anything written by the user, it'll automatically choose the normal time
 if(!prefsAnswer){

  return %orig;

}

//returns custom answer
  return %orig(string);

}

	//normal code from apple
	%orig(arg1);

}
%end






%ctor{

loadprefs();


CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadprefs, CFSTR("com.eliofegh.date-bar.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}

