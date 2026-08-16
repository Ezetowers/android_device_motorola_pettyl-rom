#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: 2026 elmendezz
# SPDX-License-Identifier: Apache-2.0
#

# API levels
PRODUCT_SHIPPING_API_LEVEL := 27

# Health & Symlinks
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service \
    pettyl_symlinks

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# ==========================================================
# ROOTDIR: fstab goes to boot ramdisk (required for init mount_all)
# The vendor .sh and .rc files are defined as Soong modules in
# rootdir/Android.bp (sh_binary -> /vendor/bin/, prebuilt_etc ->
# /vendor/etc/init/hw/) and must be added to PRODUCT_PACKAGES
# so they are actually built and installed. Forcing them into the
# boot ramdisk via PRODUCT_COPY_FILES displaces AOSP's standard
# modules (init.rc, sbin/charger, ueventd) causing fastboot fallback.
# ==========================================================
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# ===========================================================
# CRITICAL FIX: ueventd.rc for ramdisk root (/ueventd.rc)
# ----------------------------------------------------------
# On non-SAR legacy boot the AOSP-standard /ueventd.rc must exist in
# the boot.img ramdisk so that ueventd, during coldboot, can chmod
# /dev/binder, /dev/hwbinder and /dev/vndbinder to 0666.  The stock
# Motorola Oreo vendor provides its own /vendor/ueventd.rc but it does
# NOT set binder permissions; only this AOSP-standard file does.
#
# With the file absent (as in LOS builds 20260814 and 20260815), /dev/binder
# is created by the kernel misc-device layer with default restrictive
# permissions. When init reaches InitBinder at ~t=3.33s,
# ProcessState::self("/dev/binder") calls open_driver() which fails
# (mDriverFD < 0). The constructor then fires:
#     LOG_ALWAYS_FATAL_IF(mDriverFD < 0, "Binder driver could not be opened...")
# -> __android_log_assert() -> abort() -> REBOOT_BOOTLOADER_ON_PANIC ->
#   reboot into fastboot.
#
# See LOS backtrace in console-ramoops lines 1188-1209:
#     #06 libbinder.so ProcessState::ProcessState(...)
#     #05 liblog.so      __android_log_assert
# ===========================================================
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/ueventd.rc:$(TARGET_COPY_OUT_RAMDISK)/ueventd.rc

# Vendor .sh scripts (defined in rootdir/Android.bp as sh_binary vendor:true)
PRODUCT_PACKAGES += \
    apanic_annotate.sh \
    apanic_copy.sh \
    apanic_save.sh \
    hardware_revisions.sh \
    init.class_main.sh \
    init.crda.sh \
    init.gbmods.sh \
    init.mdm.sh \
    init.mmi.audio.sh \
    init.mmi.block_perm.sh \
    init.mmi.boot.sh \
    init.mmi.carrier.sh \
    init.mmi.mdlog-getlogs.sh \
    init.mmi.touch.sh \
    init.mmi.usb.sh \
    init.oem.hw.sh \
    init.qcom.class_core.sh \
    init.qcom.coex.sh \
    init.qcom.crashdata.sh \
    init.qcom.early_boot.sh \
    init.qcom.efs.sync.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.wifi.sh \
    init.qti.fm.sh \
    init.qti.ims.sh \
    modem_erase_modemst12.sh \
    pstore_annotate.sh \
    qca6234-service.sh \
    wlan_carrier_bin.sh

# Device .rc files (defined in rootdir/Android.bp as prebuilt_etc vendor:true, sub_dir: "init/hw")
PRODUCT_PACKAGES += \
    init.mmi.chipset.rc \
    init.mmi.common.rc \
    init.mmi.debug.rc \
    init.mmi.diag.rc \
    init.mmi.diag_mdlog.rc \
    init.mmi.nonab.rc \
    init.mmi.overlay.rc \
    init.mmi.rc \
    init.mmi.sensor.rc \
    init.mmi.usb.rc \
    init.mmi.volte.rc \
    init.oem.rc \
    init.qcom.factory.rc \
    init.qcom.rc \
    init.target.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/pettyl/pettyl-vendor.mk)

# =================================================================
# =================================================================
# =================================================================
# ======================    elmendezz    ==========================
# =================================================================
# =================================================================
# =================================================================
