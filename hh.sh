#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/xdroid-oss/manifest.git -b z0 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b xd device/xiaomi/earth
git clone https://github.com/AbuRider/sign.git -b keys2 vendor/lineage-priv/keys
git clone https://github.com/LineageOS/android_packages_apps_FMRadio.git -b lineage-23.2 packages/apps/FMRadio

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=clarinet_quartet

. build/envsetup.sh
brunch earth
