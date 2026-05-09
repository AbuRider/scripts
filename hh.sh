#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/halcyonproject/manifest -b 16.2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b halcyon-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch halcyon_earth-bp4a-userdebug
mka carthage
