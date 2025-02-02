################################################################################
#
# chromebook-ucm-conf
#
################################################################################

CHROMEBOOK_UCM_CONF_VERSION = 6025f91b71e4c527f885b6320186cbd21b70bb5f
CHROMEBOOK_UCM_CONF_SITE = $(call github,WeirdTreeThing,chromebook-ucm-conf,$(CHROMEBOOK_UCM_CONF_VERSION))
CHROMEBOOK_UCM_CONF_LICENSE = BSD-3-Clause
CHROMEBOOK_UCM_CONF_LICENSE_FILES = LICENSE

# we need the alsa-ucm dependencies first
CHROMEBOOK_UCM_CONF_DEPENDENCIES += alsa-ucm-conf alsa-utils
CHROMEBOOK_UCM_CONF_DEPENDENCIES += alllinuxfirmwares sound-open-firmware

define CHROMEBOOK_UCM_CONF_INSTALL_TARGET_CMDS
    # appollo lake
    rsync -arv $(@D)/apl/* $(TARGET_DIR)/usr/share/alsa/ucm2/conf.d/
    # gemini lake
    rsync -arv $(@D)/glk/* $(TARGET_DIR)/usr/share/alsa/ucm2/conf.d/
    # comet lake
    rsync -arv $(@D)/cml/* $(TARGET_DIR)/usr/share/alsa/ucm2/conf.d/
    # tigerlake
    rsync -arv $(@D)/tgl/* $(TARGET_DIR)/usr/share/alsa/ucm2/conf.d/
    # jasper lake
    rsync -arv $(@D)/jsl/* $(TARGET_DIR)/usr/share/alsa/ucm2/conf.d/
    # alder lake
    rsync -arv $(@D)/adl/* $(TARGET_DIR)/usr/share/alsa/ucm2/conf.d/
    # dmic-common
    rsync -arv $(@D)/dmic-common/* $(TARGET_DIR)/usr/share/alsa/ucm2/conf.d/dmic-common/
    # hdmi-common
    rsync -arv $(@D)/hdmi-common/* $(TARGET_DIR)/usr/share/alsa/ucm2/conf.d/hdmi-common/
endef

$(eval $(generic-package))
