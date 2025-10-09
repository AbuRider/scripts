#!/bin/bash
# Remove Clang
rm -rf prebuilts/clang/host/linux-x86
# repo init
repo init -u https://github.com/RisingOS-Revived/android -b sixteen --git-lfs
# Sync 
/opt/crave/resync.sh || repo sync
# cloning trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b ngising device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-23.0 vendor/xiaomi/earth
git clone https://github.com/mt6768-dev/android_kernel_xiaomi_earth.git -b lineage-23.0 kernel/xiaomi/earth
# Other dependencies
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.0 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr
# Signing rom
git clone https://github.com/AbuRider/keys.git -b main vendor/lineage-priv/keys
# Export
export BUILD_USERNAME=dnr
export BUILD_HOSTNAME=pangokceria
export TZ="Asia/Jakarta"
# starts build setup !
. build/envsetup.sh
riseup earth userdebug
rise b
