#!/bin/bash

repo init -u https://github.com/Lunaris-AOSP/android -b 16.2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Lunaris-16.2 device/xiaomi/earth

# Edited source 
rm -rf packages/apps/Launcher3
git clone https://github.com/AbuRider/packages_apps_Launcher3.git -b 16.2 packages/apps/Launcher3

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
mka bacon
