#!/bin/bash
rm -rf device/xiaomi/earth
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Clover-16.2 device/xiaomi/earth

export BUILD_USERNAME=megumi
export BUILD_HOSTNAME=wind_orchestra
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

. build/envsetup.sh
lunch clover_earth-bp4a-userdebug
make installclean
mka clover
