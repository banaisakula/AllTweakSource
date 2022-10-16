ARCHS = arm64 arm64e
TARGET := iphone:clang:13.7:13.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = QQAntiRecall

QQAntiRecall_FILES = Tweak.x
QQAntiRecall_CFLAGS = -fobjc-arc
QQAntiRecall_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
