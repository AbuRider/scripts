#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf device/xiaomi/earth kernel/xiaomi/earth vendor/xiaomi/earth
rm -rf hardware/xiaomi hardware/mediatek device/mediatek/sepolicy_vndr vendor/evolution-priv/keys

repo init -u https://github.com/LineageOS/android.git -b lineage-21.0 --git-lfs 
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b lineage-21 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_bumi.git -b 4.19.306 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21.0 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-21.0 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-21.0 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b keys vendor/lineage-priv/keys

# Export
export BUILD_USERNAME=ririsaa
export BUILD_HOSTNAME=wind_orchestra
export TZ="Asia/Jakarta"

# starts build setup !
. build/envsetup.sh
lunch lineage_earth-ap2a-userdebug
make installclean
m bacon
