THEOS_DEVICE_IP = iphone
ARCHS = arm64 arm64e
TARGET = iphone:clang:13.2:13.2

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AnimatedTableCells13
AnimatedTableCells13_FRAMEWORKS = UIKit
AnimatedTableCells13_FILES = AnimatedTableCells13.xm
AnimatedTableCells13_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
