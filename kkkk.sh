#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf device/xiaomi/earth vendor/lineage-priv/keys

repo init -u https://github.com/Lunaris-AOSP/android -b 16.2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Lunaris-16.2 device/xiaomi/earth
git clone https://github.com/AbuRider/sign.git -b keys2 vendor/lineage-priv/keys

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=wind_orchestra

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
make installclean
m bacon
