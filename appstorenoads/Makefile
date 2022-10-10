TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = appstorenoads

appstorenoads_FILES = Tweak.x
appstorenoads_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
