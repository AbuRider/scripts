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

# trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Evox-14 device/xiaomi/earth

git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth

git clone https://github.com/LineageOS/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi

git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-21 hardware/mediatek

git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-21 device/mediatek/sepolicy_vndr

git clone https://github.com/AbuRider/sign_keys_priv.git -b main vendor/evolution-priv/keys

# Export
export BUILD_USERNAME=dnryd
export BUILD_HOSTNAME=pangokceria
export TZ=Asia/Jakarta

# initiate build setup
. build/envsetup.sh
lunch lineage_earth-userdebug
m evolution -j$(nproc --all)
