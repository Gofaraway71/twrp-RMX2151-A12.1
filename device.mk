#
# Copyright (C) 2022 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/realme/RMX2151

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Fastbootd
PRODUCT_PACKAGES += \
	android.hardware.fastboot@1.0-impl-mock

# MT6762 Init
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/root/init.recovery.mt6785.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6785.rc

# Gatekeeper
PRODUCT_PACKAGES += \
	android.hardware.gatekeeper@1.0-service \
	android.hardware.gatekeeper@1.0-impl

PRODUCT_COPY_FILES += \
	$(OUT_DIR)/target/product/RMX2151/vendor/bin/hw/android.hardware.gatekeeper@1.0-service:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/android.hardware.gatekeeper@1.0-service \
	$(OUT_DIR)/target/product/RMX2151/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so

# Additional Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
	libkeymaster4 \
	libpuresoftkeymasterdevice

RECOVERY_LIBRARY_SOURCE_FILES += \
	$(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
	$(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

TARGET_RECOVERY_DEVICE_MODULES += \
    libion

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so

# Decryption
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.dm_default_key.options_format.version=1 \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.volume.options=::v1
