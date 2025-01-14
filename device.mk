#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    init.insmod.sh \
    setwlansarlow.sh \
    setsarcal.sh \
    setwlansarhigh.sh \
    getwlansar.sh \

PRODUCT_PACKAGES += \
    fstab.enableswap \
    init.mt6833.usb.rc \
    init.sensor_2_0.rc \
    meta_init.connectivity.common.rc \
    meta_init.modem.rc \
    multi_init.rc \
    init.modem.rc \
    init.project.rc \
    init_connectivity.rc \
    meta_init.project.rc \
    factory_init.rc \
    factory_init.connectivity.rc \
    init.ago.rc \
    init.stnfc.rc \
    init.aee.rc \
    factory_init.project.rc \
    init.mt6833.rc \
    init.connectivity.rc \
    meta_init.connectivity.rc \
    factory_init.connectivity.common.rc \
    init.connectivity.common.rc \
    meta_init.rc \
    miui.factoryreset.rc \
    init.recovery.mt6833.rc \
    init.recovery.hardware.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.enableswap:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.enableswap

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/camellia/camellia-vendor.mk)
