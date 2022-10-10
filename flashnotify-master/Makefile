INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FlashNotify

FlashNotify_FILES = Tweak.x
FlashNotify_PRIVATE_FRAMEWORKS = BulletinBoard
FlashNotify_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += flashnotify
include $(THEOS_MAKE_PATH)/aggregate.mk
