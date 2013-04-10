#
# Copyright (C) 2007 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

TARGET_PLATFORM := shark0
TARGET_BOARD := shark0ea
BOARDDIR := device/sprd/$(TARGET_BOARD)

DEVICE_PACKAGE_OVERLAYS := $(BOARDDIR)/overlay

PRODUCT_PROPERTY_OVERRIDES := \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.adb.qemud=1

PRODUCT_COPY_FILES := \
    device/generic/goldfish/data/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/generic/goldfish/data/etc/vold.conf:system/etc/vold.conf \
    $(call add-to-product-copy-files-if-exists,development/tools/emulator/system/camera/media_profiles.xml:system/etc/media_profiles.xml) \
    $(call add-to-product-copy-files-if-exists,development/tools/emulator/system/camera/media_codecs.xml:system/etc/media_codecs.xml) \
    hardware/libhardware_legacy/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_PACKAGES := \
    audio.primary.goldfish \
    power.goldfish

PRODUCT_PACKAGES += \
	sqlite3 \
	jsilver \
	ApiDemos \
	GestureBuilder \
	SmokeTest \
	SmokeTestApp \
	ConnectivityTest \
	CubeLiveWallpapers \
	CustomLocale \
	Development \
	Fallback \
	GpsLocationTest \
	LegacyCamera \
	SdkSetup \
	SoftKeyboard

-include sdk/build/product_sdk.mk
-include development/build/product_sdk.mk

# audio libraries.
PRODUCT_PACKAGES += \
	audio.primary.goldfish \
	audio_policy.default \
	local_time.default

#PRODUCT_PACKAGE_OVERLAYS := development/sdk_overlay
PRODUCT_PACKAGE_OVERLAYS := $(BOARDDIR)/sdk_overlay

PRODUCT_COPY_FILES += \
	device/generic/goldfish/data/etc/apns-conf.xml:system/etc/apns-conf.xml \
	system/core/rootdir/etc/vold.fstab:system/etc/vold.fstab \
	frameworks/base/data/sounds/effects/camera_click.ogg:system/media/audio/ui/camera_click.ogg \
	frameworks/base/data/sounds/effects/VideoRecord.ogg:system/media/audio/ui/VideoRecord.ogg \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	development/tools/emulator/system/camera/media_profiles.xml:system/etc/media_profiles.xml \
	development/tools/emulator/system/camera/media_codecs.xml:system/etc/media_codecs.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	hardware/libhardware_legacy/audio/audio_policy.conf:system/etc/audio_policy.conf

$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, frameworks/base/data/keyboards/keyboards.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/sdk.mk)
$(call inherit-product, $(BOARDDIR)/prod_shark0base.mk)

# Overrides
PRODUCT_BRAND := Spreadtrum
PRODUCT_NAME := shark0easdk
PRODUCT_DEVICE := $(TARGET_BOARD)
PRODUCT_MODEL := Android SDK built for shark0ea

PRODUCT_LOCALES := zh_CN zh_TW en_US