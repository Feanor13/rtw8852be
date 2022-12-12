ifeq ($(CONFIG_PLATFORM_ARM_RK3399), y)
EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ANDROID -DCONFIG_PLATFORM_ROCKCHIPS
EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
EXTRA_CFLAGS += -DCONFIG_RADIO_WORK

# CONFIG_RTW_ANDROID - 0: no Android, 4/5/6/7/8/9/10/11 : Android version
CONFIG_RTW_ANDROID = 0

ifeq ($(shell test $(CONFIG_RTW_ANDROID) -gt 0; echo $$?), 0)
EXTRA_CFLAGS += -DCONFIG_RTW_ANDROID=$(CONFIG_RTW_ANDROID)
endif

ifeq ($(shell test $(CONFIG_RTW_ANDROID) -ge 11; echo $$?), 0)
EXTRA_CFLAGS += -DCONFIG_IFACE_NUMBER=3
EXTRA_CFLAGS += -DCONFIG_SEL_P2P_IFACE=1
endif

# default setting for Android
# config CONFIG_RTW_ANDROID in main Makefile

ifeq ($(CONFIG_PCI_HCI), y)
EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
_PLATFORM_FILES := platform/platform_linux_pc_pci.o
OBJS += $(_PLATFORM_FILES)
# Core Config
EXTRA_CFLAGS += -DCONFIG_RXBUF_NUM_1024
EXTRA_CFLAGS += -DCONFIG_TX_SKB_ORPHAN
EXTRA_CFLAGS += -DCONFIG_SWCAP_SYNC_WIN
# PHL Config
#EXTRA_CFLAGS += -DPHL_RX_BATCH_IND
EXTRA_CFLAGS += -DRTW_WKARD_98D_RXTAG
endif

endif
