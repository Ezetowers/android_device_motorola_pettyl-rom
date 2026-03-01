#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/motorola/pettyl

# Architecture
#TARGET_ARCH := arm
#TARGET_ARCH_VARIANT := armv7-a-neon
#TARGET_CPU_ABI := armeabi-v7a
#TARGET_CPU_ABI2 := armeabi
#TARGET_CPU_VARIANT := generic
#TARGET_CPU_VARIANT_RUNTIME := generic
#
#TARGET_USES_64_BIT_BINDER := true

# Architecture Configuration for a pure 32-bit build
TARGET_ARCH := arm
# TARGET_ARCH_VARIANT := armv8-a
# Usamos armv7-a-neon para asegurar compatibilidad total con 32-bit y evitar error de app_process32
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
# TARGET_CPU_VARIANT := cortex-a53
# Usamos generic para evitar que el sistema fuerce armv8-a y pida 64 bits
TARGET_CPU_VARIANT := generic

# Esto es crucial para forzar la compatibilidad
#TARGET_2ND_ARCH := 
#TARGET_2ND_ARCH_VARIANT := 
#TARGET_2ND_CPU_ABI := 
#TARGET_2ND_CPU_VARIANT := 
# --- FORZAR 32 BITS ---
# Esto desactiva la detección automática de 64 bits del A53
#TARGET_IS_64_BIT := false
# This is a pure 32-bit build. No 2nd arch, and use a 32-bit binder.
TARGET_2ND_ARCH :=
TARGET_USES_64_BIT_BINDER := false

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Display
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 960

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8937
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlycon=msm_hsl_uart,0x78B0000 vmalloc=400M buildvariant=user
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_DT_SIZE := 219136

# Comentamos esto porque vamos a usar el kernel extraído (prebuilt), no a compilarlo desde cero
# TARGET_KERNEL_CONFIG := pettyl_defconfig
# TARGET_KERNEL_SOURCE := kernel/motorola/pettyl

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
endif

# Partitions - Tamaños reales calculados
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216         # (32768 * 512)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824     # (49152 * 512)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1811939328     # (3538944 * 512)
BOARD_VENDORIMAGE_PARTITION_SIZE := 318767104      # (622592 * 512)
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456       # (524288 * 512)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12715015680  # (24834015 * 512)

# Forzar esquema No-SAR (Legacy) - Arreglar Bootloop
# --- ESTO ES PARA DESACTIVAR SAR ---
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
# ------------------------------------------------------------
BOARD_USES_RECOVERY_AS_BOOT := false
TARGET_NO_KERNEL := false
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
# Esto ayuda al script de flasheo a encontrar las particiones
AB_OTA_UPDATER := false

# Platform
TARGET_BOARD_PLATFORM := msm8937

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2020-07-01

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Inherit the proprietary files
include vendor/motorola/pettyl/BoardConfigVendor.mk
