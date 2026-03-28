#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86 

repo init -u https://github.com/PixelOS-AOSP/android_manifest.git -b sixteen-qpr2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b PixelOS-16.2 device/xiaomi/earth
git clone https://github.com/AbuRider/sign.git -b keys2 vendor/lineage-priv/keys

export BUILD_USERNAME=makinohara
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
breakfast earth userdebug
m pixelos
