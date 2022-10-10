include $(THEOS)/makefiles/common.mk

export ARCHS = arm64

BUNDLE_NAME = CallHiderCC
CallHiderCC_BUNDLE_EXTENSION = bundle
CallHiderCC_FILES = CallHiderCC.m
CallHiderCC_PRIVATE_FRAMEWORKS = ControlCenterUIKit
CallHiderCC_INSTALL_PATH = /Library/ControlCenter/Bundles/

after-install::
	install.exec "killall -9 SpringBoard"

include $(THEOS_MAKE_PATH)/bundle.mk
