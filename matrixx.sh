#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/ProjectMatrixx/android -b 16.2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Matrixx-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=clarinet_quartet
export PRODUCT_NO_CAMERA=false

. build/envsetup.sh
lunch matrixx_earth-bp4a-userdebug
m matrixx
