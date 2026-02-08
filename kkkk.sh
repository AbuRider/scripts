#!/bin/bash
rm -rf vendor/lineage-priv/keys device/xiaomi/earth kernel/xiaomi/earth vendor/xiaomi/earth
rm -rf hardware/xiaomi hardware/mediatek device/mediatek/sepolicy_vndr

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b EvolutionX-16.2 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-23.2 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b 16.2-staging kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.2 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b evok vendor/evolution-priv/keys

export BUILD_USERNAME=megumi
export BUILD_HOSTNAME=wind_orchestra

. build/envsetup.sh
lunch lineage_earth-bp4a-userdebug
make installclean
m evolution
