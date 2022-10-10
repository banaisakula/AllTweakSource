ARCHS = arm64 arm64e
TARGET := iphone:clang:13.7:13.0
INSTALL_TARGET_PROCESSES = SpringBoard

SUBPROJECTS += diandian DismissProgress QQAntiRecall
SUBPROJECTS += twitter-no-ads  NoYTAds Sharecuts Truecuts Tweakio

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
after-install::
	install.exec "killall -9 SpringBoard"



