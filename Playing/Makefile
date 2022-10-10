INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64 arm64e
TARGET = iphone:clang:13.0:12.4
GO_EASY_ON_ME=1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Playing

Playing_FILES = Tweak.x
Playing_CFLAGS = -fobjc-arc
Playing_PRIVATE_FRAMEWORKS = MediaRemote BulletinBoard
Playing_EXTRA_FRAMEWORKS = Cephei
Playing_LIBRARIES = MobileGestalt

SUBPROJECTS += Preferences Application

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
