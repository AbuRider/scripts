#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/Evolution-X/manifest -b bq2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b EvolutionX-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
m evolution
