#
# Copyright (C) 2016 The CyanogenMod Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

ifneq ($(filter griffin,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)

include device/motorola/griffin/expat.mk
include device/motorola/griffin/tftp.mk


# Create links for audcal data files
$(shell mkdir -p $(TARGET_OUT)/etc/firmware/wcd9320; \
	ln -sf /data/misc/audio/wcd9320_anc.bin \
		$(TARGET_OUT)/etc/firmware/wcd9320/wcd9320_anc.bin;\
	ln -sf /data/misc/audio/mbhc.bin \
		$(TARGET_OUT)/etc/firmware/wcd9320/wcd9320_mbhc.bin; \
	ln -sf /data/misc/audio/wcd9320_mad_audio.bin \
		$(TARGET_OUT)/etc/firmware/wcd9320/wcd9320_mad_audio.bin)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
