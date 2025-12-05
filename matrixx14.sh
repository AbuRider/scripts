#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/AbuRider/android_manifest_matrixx.git -b 14.0 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Matrixx-14 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_bumi.git -b 4.19.306 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-21 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-21 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b main vendor/lineage-priv/keys

rm -rf frameworks/base 
git clone --depth=1 https://github.com/AbuRider/android_frameworks_base_old.git -b 14.0 frameworks/base

export BUILD_USERNAME=oumae
export BUILD_HOSTNAME=silvereuphonium

. build/envsetup.sh
lunch lineage_earth-ap2a-userdebug
mka bacon
