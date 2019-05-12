ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BlockPowerDown
BlockPowerDown_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += blockpowerdownprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
