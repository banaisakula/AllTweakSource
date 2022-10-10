THEOS_DEVICE_IP = iphone-de-greg.local
GO_EASY_ON_ME = 1
FINALPACKAGE = 1
TARGET = iphone::13.0
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = MobileSMS

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MessageUnread

MessageUnread_FILES = Tweak.xm
MessageUnread_FRAMEWORKS = UIKit
MessageUnread_PRIVATE_FRAMEWORKS = ChatKit IMCore
MessageUnread_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
