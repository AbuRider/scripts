#!/bin/bash
# Remove Clang
rm -rf prebuilts/clang/host/linux-x86

repo init -u https://github.com/ProjectMatrixx/android.git -b 15.0 --git-lfs
/opt/crave/resync.sh || repo sync

git clone https://github.com/AbuRider/device_xiaomi_earth.git -b Matrixx device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-22.2 vendor/xiaomi/earth
git clone https://github.com/mt6768-dev/android_kernel_xiaomi_earth.git -b lineage-22.2 kernel/xiaomi/earth

git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-22.2 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-22.2 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-22.2 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b matrixx vendor/lineage-priv/keys

# Edited source
rm -rf vendor/lineage vendor/addons frameworks/base hardware/lineage/interfaces system/core build/release
git clone --depth=1 https://github.com/AbuRider/android_vendor_matrixx.git -b 15.0 vendor/lineage
git clone --depth=1 https://github.com/AbuRider/android_vendor_addons.git -b 15.0 vendor/addons
git clone --depth=1 https://github.com/AbuRider/android_frameworks_base_A15_metrik.git -b 15.0 frameworks/base
git clone --depth=1 https://github.com/LineageOS/android_hardware_lineage_interfaces.git -b lineage-22.2 hardware/lineage/interfaces
git clone --depth=1 https://github.com/AbuRider/android_system_core.git -b 15.0 system/core
git clone --depth=1 https://github.com/AbuRider/build_release.git -b 15.0 build/release

# Export
export BUILD_USERNAME=oumae
export BUILD_HOSTNAME=pangokceria
export TZ="Asia/Jakarta"

# starts build setup !
. build/envsetup.sh
lunch lineage_earth-bp1a-userdebug
mka bacon
