#!/bin/bash
# Remove Clang
rm -rf prebuilts/clang/host/linux-x86

# repo init
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs 

# Sync repository
/opt/crave/resync.sh || repo sync

# Remove old stuff's
rm -rf device/xiaomi/earth vendor/xiaomi/earth kernel/xiaomi/earth
rm -rf hardware/mediatek hardware/xiaomi device/mediatek/sepolicy_vndr
rm -rf vendor/evolution-priv/keys

# cloning trees
git clone https://github.com/AbuRider/android_device_xiaomi_earth.git -b EvolutionX-16 device/xiaomi/earth
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git -b lineage-23.0 vendor/xiaomi/earth
git clone https://github.com/AbuRider/android_kernel_xiaomi_earth.git -b upstream kernel/xiaomi/earth

# Other dependencies
git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi
git clone https://github.com/LineageOS/android_hardware_mediatek.git -b lineage-23.0 hardware/mediatek
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr.git -b lineage-23.0 device/mediatek/sepolicy_vndr
git clone https://github.com/AbuRider/priv_keys.git -b evox vendor/evolution-priv/keys

# Export
export BUILD_USERNAME=mona
export BUILD_HOSTNAME=pangokceria
export TZ="Asia/Jakarta"

# starts build setup !
. build/envsetup.sh
lunch lineage_earth-bp2a-userdebug
m evolution 
