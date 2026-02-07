#!/bin/bash
rm -rf hardware/xiaomi
git clone https://github.com/AbuRider/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi

export BUILD_USERNAME=megumi
export BUILD_HOSTNAME=wind_orchestra
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

. build/envsetup.sh
lunch infinity_earth-userdebug
make installclean
m bacon
