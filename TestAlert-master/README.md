# TestAlert
TestAlert | SCLAlertView For Theos !


# Screenshot

![image](https://github.com/iis4if/TestAlert/blob/master/ScreenShot.jpg)

طريقة اضافة مكتبة الرسائل SCLAlertView الى بيئة العمل Theos .. 
 - https://github.com/iis4if/SCLAlertView أولاً قم بتحميل المكتبة من 
 - ثانياً قم بنسخ مجلد SCLAlertView الى هذا المسار الخاص بـ theos والدخول اليه ومن ثم لصقه في مجلد include 
 - ثالثاً بعد انشاء مشروعك قم باضافة الاستدعاء للمكتبة في ملف Tweak.xm مثل المشروع   ثم قم باضافة 
  ```#import <UIKit/UIKit.h>
#import <SCLAlertView/SCLAlertView.h>
#import <CoreGraphics/CoreGraphics.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import <AVFoundation/AVFoundation.h>
```
 في اعلى ملف التنفيذ makefile
 ```
 ARCHS = armv7 arm64 
CFLAGS = -fobjc-arc # ARC is needed for SCLAlertView
```
 - رابعاً اضف ايضاً  مع تغير TestAlert باسم المشروع الخاص بك
```
$(shell find $(THEOS)/include/SCLAlertView -name '*.m')
TestAlert_FRAMEWORKS = UIKit MessageUI Social QuartzCore CoreGraphics Foundation AVFoundation Accelerate GLKit AudioToolbox
YOURTWEAKNAMEHERE_LDFLAGS += -Wl,-segalign,4000

```
  - خامساً اضف اكواد الرسائل المناسبة لك في مشروع SCLAlertView 

الاكواد والمشروع اللي قمت بانشاءه تجده هنا ..  وشكراً  اذا افدتك 💙 .. 





# Donation with PayPal :/
If this Tweak I loved, you can give me a cup of coffee :)
[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=D9WFYB2EEB8Y4)
