ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = BlockPowerDownPrefs
BlockPowerDownPrefs_FILES = BPDRootListController.m
BlockPowerDownPrefs_INSTALL_PATH = /Library/PreferenceBundles
BlockPowerDownPrefs_FRAMEWORKS = UIKit
BlockPowerDownPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BlockPowerDownPrefs.plist$(ECHO_END)
