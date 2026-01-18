#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf device/xiaomi/earth kernel/xiaomi/earth vendor/xiaomi/earth
rm -rf hardware/xiaomi hardware/mediatek device/mediatek/sepolicy_vndr vendor/evolution-priv/keys

repo init --depth=1 -u https://github.com/EunoiaOS/eunoia.git -b eunoia-1.0 --git-lfs 
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b EuOS-14 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_bumi.git -b 4.19.306 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-21 hardware/mediatek
git clone https://github.com/AbuRider/android_device_mediatek_sepolicy_vndr.git -b eunoia device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/sign.git -b evok vendor/os-priv/keys

# Export
export BUILD_USERNAME=ririsaa
export BUILD_HOSTNAME=wind_orchestra
export EUNOIA_BUILDTYPE=Unofficial
export EUNOIA_VERSION_APPEND_TIME_OF_DAY=true

# starts build setup !
. build/envsetup.sh
bloom earth 
