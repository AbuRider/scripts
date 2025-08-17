#!/bin/bash

# fix eror
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/AbuRider/lmodroid_manifest.git -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# sync
/opt/crave/resync.sh || repo sync
echo "============="
echo "Sync success"
echo "============="

# trees
rm -rf device/xiaomi/earth
rm -rf kernel/xiaomi/earth
rm -rf vendor/xiaomi/earth
rm -rf hardware/mediatek
rm -rf hardware/xiaomi
rm -rf device/mediatek/sepolicy_vndr
rm -rf vendor/lmodroid-priv/keys

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b lmodroid device/xiaomi/earth

git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth

git clone https://github.com/LineageOS/android_kernel_xiaomi_earth.git -b lineage-21 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi

git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-21 hardware/mediatek

git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-21 device/mediatek/sepolicy_vndr

git clone https://github.com/AbuRider/sign_keys_priv.git -b lmaodroid vendor/lmodroid-priv/keys

# Export
export BUILD_USERNAME=yusup
export BUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

# initiate build setup
. build/envsetup.sh
breakfast earth userdebug
mka bacon -j$(nproc --all)
