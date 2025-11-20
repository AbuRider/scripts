#!/bin/bash
# ok
rm -rf external/chromium-webview/prebuilt/arm 
rm -rf external/chromium-webview/prebuilt/arm64
rm -rf external/chromium-webview/prebuilt/x86
rm -rf external/chromium-webview/prebuilt/x86_64
rm -rf prebuilts/clang/host/linux-x86

# repo init
repo init -u https://github.com/Evolution-X/manifest -b udc --git-lfs 

# Sync repository
/opt/crave/resync.sh || repo sync

# cloning trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b EvolutionX-14 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_bumi.git -b 4.19.306 kernel/xiaomi/earth

# Other dependencies
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-21 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-21 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b evolusi vendor/evolution-priv/keys

# Export
export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=pangokceria
export TZ="Asia/Jakarta"
export ALLOW_MISSING_DEPENDENCIES=true
export RELAX_USES_LIBRARY_CHECK=true

# starts build setup !
. build/envsetup.sh
lunch lineage_earth-user
m evolution 
