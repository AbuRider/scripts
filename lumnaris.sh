#!/bin/bash
# fix eror
rm -rf prebuilts/clang/host/linux-x86
# repo init rom
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs
# sync
/opt/crave/resync.sh || repo sync
# pohon
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b Lunaris-16 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-23.0 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b upstream kernel/xiaomi/earth
# other dependencis
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.0 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b main vendor/lineage-priv/keys
# radio lol
git clone https://github.com/LineageOS/android_packages_apps_FMRadio.git -b lineage-23.0 packages/apps/FMRadio
# Export
export BUILD_USERNAME=mona
export BUILD_HOSTNAME=bookworm
export TZ="Asia/Jakarta"
# initiate build setup
. build/envsetup.sh
lunch lineage_earth-bp2a-userdebug
m lunaris
