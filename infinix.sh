#!/bin/bash
# Remove Clang
rm -rf prebuilts/clang/host/linux-x86
# repo init
repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
# Sync 
/opt/crave/resync.sh || repo sync
# cloning trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b infinity device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-23.0 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b upstream kernel/xiaomi/earth
# Other dependencies
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.0 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr
# Signing rom
git clone https://github.com/AbuRider/priv_keys.git -b infinity vendor/infinity-priv/keys
# Export
export BUILD_USERNAME=mona
export BUILD_HOSTNAME=rionenomoto 
export KBUILD_BUILD_USER=mona
export KBUILD_BUILD_HOST=crave
export TZ="Asia/Jakarta"
# starts build setup !
. build/envsetup.sh
lunch infinity_earth-userdebug
mka bacon
