ARCHS = arm64 arm64e
TARGET := iphone:clang:13.7:13.0
INSTALL_TARGET_PROCESSES = SpringBoard
PREFIX = "$(THEOS)/toolchain/XcodeDefault.xctoolchain/usr/bin/"
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoTodayView13


NoTodayView13_FRAMEWORKS = UIKit
NoTodayView13_FILES = Tweak.xm 3developer.x dndDNDMyRecording.xm
NoTodayView13_CFLAGS = -fobjc-arc
NoTodayView13_PRIVATE_FRAMEWORKS = SpringBoardServices
NoTodayView13_LIBRARIES = sparkcolourpicker sparkapplist 
include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"