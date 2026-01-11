#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf device/xiaomi/earth kernel/xiaomi/earth vendor/xiaomi/earth
rm -rf hardware/mediatek hardware/xiaomi device/mediatek/sepolicy_vndr vendor/mica-priv/keys

repo init -u https://github.com/Evolution-X/manifest.git -b bq2 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b EvolutionX-16.2 device/xiaomi/earth
git clone https://github.com/AbuRider/proprietary_vendor_xiaomi_earth.git -b lineage-23.1 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b 16 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi
git clone https://github.com/AbuRider/android_hardware_mediatek.git -b lineage-23.2 hardware/mediatek
git clone https://github.com/SilverEuphonium/android_device_mediatek_sepolicy_vndr.git -b lineage-23.2 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b evok vendor/evolution-priv/keys
git clone https://github.com/techyminati/android_vendor_mediatek_ims.git vendor/mediatek/ims

export BUILD_USERNAME=ririsaa
export BUILD_HOSTNAME=wind_orchestra

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
make installclean
m evolution
