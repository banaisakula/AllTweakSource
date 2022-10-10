INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BanAvoider

BanAvoider_FILES = Tweak.x
BanAvoider_FRAMEWORKS = UIKit
BanAvoider_PrivateFrameworks = FrontBoardServices
BanAvoider_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += banavoider
include $(THEOS_MAKE_PATH)/aggregate.mk
