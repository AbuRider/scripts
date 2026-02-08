#!/bin/bash
rm -rf device/xiaomi/earth system/sepolicy
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Clover-16.2 device/xiaomi/earth
git clone --depth=1 https://github.com/AbuRider/system_sepolicy.git -b 16-qpr2 system/sepolicy

export BUILD_USERNAME=megumi
export BUILD_HOSTNAME=wind_orchestra
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

. build/envsetup.sh
lunch clover_earth-bp4a-userdebug
make installclean
mka clover
