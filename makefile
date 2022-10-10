ARCHS = arm64 arm64e
TARGET := iphone:clang:13.7:13.0
INSTALL_TARGET_PROCESSES = SpringBoard
SUBPROJECTS += notodayview13prefs tweak 
SUBPROJECTS +=  3DMorePower   
SUBPROJECTS +=  shadow       BTPower
SUBPROJECTS +=  LockWidgets ShyLabels13   CCCalc WallpaperLoader 
SUBPROJECTS +=  app full-likes
SUBPROJECTS +=  Eneko AppLibraryEnabler LetMeBlock 



SUBPROJECTS += Vinyl TextTime BatteryHealthEnabler CCNoiseControl Axon April NoPassAfterRespring  DeadRinger notdoxed PokeBar Quorra NoKeyboardSettings 
   
SUBPROJECTS +=   HomeScreenQuickActions Ersatz 

SUBPROJECTS +=  PeepReborn eliza NotiBlock iPadSwitcher 14PiP YTNoShortsButton  WeChatRedEnvelop YTMusicUltimate videodownloadercn WallpaperChanger Remove3DOptions


SUBPROJECTS +=  Playing Listening Lune Vaon Houdini

SUBPROJECTS +=  ftt 
SUBPROJECTS += You-up VolumeStep13 FreePIP perseus TrustEvaluator
SUBPROJECTS += accenta
include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
after-install::
	install.exec "killall -9 SpringBoard"



