#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/Lunaris-AOSP/android.git -b 16.2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Lunaris-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=clarinet_quartet

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
m bacon
