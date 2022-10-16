ARCHS = armv7 arm64

CFLAGS = -fobjc-arc # ARC is needed for SCLAlertView

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TestAlert

TestAlert_FILES = Tweak.xm $(shell find $(THEOS)/include/SCLAlertView -name '*.m')
TestAlert_FRAMEWORKS = UIKit MessageUI Social QuartzCore CoreGraphics Foundation AVFoundation Accelerate GLKit AudioToolbox
YOURTWEAKNAMEHERE_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
