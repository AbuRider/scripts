#!/bin/bash

# fix eror
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Remove
rm -rf hardware/mediatek

# trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b EvolutionX-16 device/xiaomi/earth

git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-23 vendor/xiaomi/earth

git clone https://github.com/LineageOS/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi

git clone https://github.com/AbuRider/hardware_mediatek.git -b sixteen hardware/mediatek

git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr

git clone https://github.com/techyminati/android_vendor_mediatek_ims vendor/mediatek/ims

git clone https://github.com/AbuRider/signing_keys.git -b evox vendor/evolution-priv/keys

# Export
export BUILD_USERNAME=dnryd
export BUILD_HOSTNAME=pangokceria
export TZ=Asia/Jakarta

# initiate build setup
. build/envsetup.sh
lunch lineage_earth-bp2a-userdebug
make installclean
m evolution -j$(nproc --all)
