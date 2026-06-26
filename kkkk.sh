#!/bin/bash
rm -rf device/xiaomi/earth vendor/xiaomi/earth

# init source
repo init --depth=1 -u https://github.com/Evolution-X/manifest.git -b cnb --git-lfs
/opt/crave/resync.sh # crave repo sync

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b lineage-24.0 device/xiaomi/earth
git clone https://github.com/Kitauji-High-School/vendor_xiaomi_earth.git -b 17.0 vendor/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch lineage_earth-cp2a-userdebug
m evolution
