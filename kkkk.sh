#!/bin/bash
rm -rf device/xiaomi/earth vendor/xiaomi/earth kernel/xiaomi/earth vendor/mediatek/ims
rm -rf hardware/mediatek hardware/xiaomi device/mediatek/sepolicy_vndr vendor/evolution-priv/keys

# init source
repo init --depth=1 -u https://github.com/LumineDroid/platform_manifest -b camellia --git-lfs
/opt/crave/resync.sh # crave repo sync

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Lumine-17.0 device/xiaomi/earth
git clone https://github.com/LineageOS/android_packages_apps_FMRadio.git packages/apps/FMRadio

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch earth-cp2a-userdebug
make installclean
mka bacon
