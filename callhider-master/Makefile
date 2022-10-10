TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CallHider

CallHider_FILES = Tweak.x
CallHider_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += callhider
SUBPROJECTS += callhidercc
include $(THEOS_MAKE_PATH)/aggregate.mk
