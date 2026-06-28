#!/bin/bash
rm -rf device/xiaomi/earth
rm -rf hardware/mediatek

# init source
repo init --depth=1 -u https://github.com/LumineDroid/platform_manifest -b camellia --git-lfs
/opt/crave/resync.sh # crave repo sync

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Lumine-17 device/xiaomi/earth

rm -rf vendor/qcom/opensource/commonsys/wfd
git clone https://github.com/Evolution-X/vendor_qcom_opensource_wfd-commonsys.git -b cnb vendor/qcom/opensource/commonsys/wfd

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch earth-cp2a-userdebug
mka bacon
