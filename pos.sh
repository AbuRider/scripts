#!/bin/bash
# rm -rf prebuilts/clang/host/linux-x86
# rm -rf device/xiaomi/earth
rm -rf device/lineage/sepolicy

# repo init -u https://github.com/Kitauji-High-School/pixelos_manifest.git -b sixteen-qpr2 --git-lfs
# /opt/crave/resync.sh || repo sync

# git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b PixelOS-16.2 device/xiaomi/earth
git clone https://github.com/Kitauji-High-School/android_device_lineage_sepolicy.git -b lineage-23.2 device/lineage/sepolicy

export BUILD_USERNAME=uzuki
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
breakfast earth userdebug
make installclean
m pixelos
