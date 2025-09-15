#!/bin/bash

# fix eror
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/Evolution-X/manifest -b udc --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# sync
/opt/crave/resync.sh || repo sync
echo "============="
echo "Sync success"
echo "============="

# Remove
rm -rf device/xiaomi/earth
rm -rf kernel/xiaomi/earth
rm -rf vendor/xiaomi/earth
rm -rf hardware/xiaomi
rm -rf hardware/mediatek
rm -rf device/mediatek/sepolicy_vndr
rm -rf vendor/evolution-priv/keys

# trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b EvolutionX-14 device/xiaomi/earth

git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth

git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b cip-dt2w kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi

git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-21 hardware/mediatek

git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-21 device/mediatek/sepolicy_vndr

git clone https://github.com/AbuRider/signing_keys.git -b evox vendor/evolution-priv/keys

# Export
export BUILD_USERNAME=aisy
export BUILD_HOSTNAME=umbrella
export TZ=Asia/Jakarta

# initiate build setup
. build/envsetup.sh
lunch lineage_earth-userdebug
m evolution -j$(nproc --all)
