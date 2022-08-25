#
# Copyright (C) 2022 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# API
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_TARGET_VNDK_VERSION := 31

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

# Drm
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4

# Build MT-PL-Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# keystore2
PRODUCT_PACKAGES += \
    android.system.keystore2
    
# Gatekeeper
PRODUCT_PACKAGES += \
	android.hardware.gatekeeper@1.0-service \
	android.hardware.gatekeeper@1.0-impl
	
# keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret	

# Additional Target Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.1

RECOVERY_LIBRARY_SOURCE_FILES += \
	$(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
	
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.options=::v2	
    
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster@4.1.so
