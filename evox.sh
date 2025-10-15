#!/bin/bash
# Remove Clang
rm -rf prebuilts/clang/host/linux-x86
# repo init
repo init -u https://github.com/Evolution-X/manifest -b udc --git-lfs
# Sync 
/opt/crave/resync.sh || repo sync
# cloning trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b EvolutionX-14 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-21 vendor/xiaomi/earth
git clone https://github.com/mt6768-dev/android_kernel_xiaomi_earth.git -b lineage-23.0 kernel/xiaomi/earth
# Other dependencies
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-21 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-21 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-21 device/mediatek/sepolicy_vndr
# Signing rom
git clone https://github.com/AbuRider/priv_keys.git -b evox vendor/evolution-priv/keys
# Export
export BUILD_USERNAME=mugis
export BUILD_HOSTNAME=rumiaprjkt
export RELAX_USES_LIBRARY_CHECK=true
export TZ="Asia/Jakarta"
# starts build setup !
. build/envsetup.sh
lunch lineage_earth-userdebug
m evolution -j$(nproc --all)
