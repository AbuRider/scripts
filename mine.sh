#!/bin/bash
# fix eror
rm -rf prebuilts/clang/host/linux-x86
# repo init rom
repo init -u https://github.com/LumineDroid/platform_manifest.git -b bynx --git-lfs
# sync
/opt/crave/resync.sh || repo sync
# pohon
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Lumine-16 device/xiaomi/earth
# Export
export BUILD_USERNAME=oumae
export BUILD_HOSTNAME=boardconfig
export TZ="Asia/Jakarta"
# initiate build setup
. build/envsetup.sh
lunch lineage_earth-bp2a-userdebug
mka bacon
