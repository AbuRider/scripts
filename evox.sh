#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/Evolution-X/manifest -b bq2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b EvolutionX-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=clarinet_quartet
export TARGET_SUPPORTS_GOOGLE_RECORDER=false
export TARGET_INCLUDE_STOCK_ARCORE=false

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
m evolution
