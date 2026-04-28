#!/bin/bash
# rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/crdroidandroid/android.git -b 16.0 --git-lfs --no-clone-bundle
/opt/crave/resync.sh || repo sync

# rm -rf device/xiaomi/earth
# git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b lineage-23.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet
export TARGET_SUPPORTS_BLUR=false
export TARGET_DISABLE_MATLOG=true

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
make installclean
mka bacon
