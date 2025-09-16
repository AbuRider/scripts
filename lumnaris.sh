#!/bin/bash

# fix eror
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# sync
/opt/crave/resync.sh || repo sync
echo "==========================="
echo " sync repository success..."
echo "==========================="

# dontol kucai
rm -rf device/xiaomi/earth
rm -rf vendor/lineage-priv/keys

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Lunaris-16 device/xiaomi/earth

git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-23 vendor/xiaomi/earth

git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b cip-dt2w kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi

git clone https://github.com/Aeron-Aeron/hardware_mediatek.git -b lineage-23.0 hardware/mediatek

git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr

git clone https://github.com/techyminati/android_vendor_mediatek_ims vendor/mediatek/ims

git clone https://github.com/AbuRider/signing_keys.git -b luna vendor/lunaris-priv/keys

# Remove Error
rm -rf bionic
git clone --depth=1 https://github.com/AbuRider/bionic_lunaris.git bionic

# Export
export BUILD_USERNAME=aisy
export BUILD_HOSTNAME=umbrella
export TZ=Asia/Jakarta
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

# initiate build setup
. build/envsetup.sh
lunch lineage_earth-bp2a-userdebug
m lunaris -j$(nproc --all)
