#!/bin/bash
# rm -rf prebuilts/clang/host/linux-x86

# repo init -u https://github.com/GenesisOS/manifest.git -b yume --git-lfs
# /opt/crave/resync.sh # sync source 

rm -rf device/xiaomi/earth
git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Genesis-16.2 device/xiaomi/earth

# Edited source
rm -rf hardware/lineage/interfaces
git clone https://github.com/AbuRider/android_hardware_lineage_interfaces.git -b lineage-23.2 hardware/genesis/interfaces
# git clone https://github.com/LineageOS/android_packages_apps_EuiccPolicy.git -b lineage-23.2 packages/apps/EuiccPolicy

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch genesis_earth-bp4a-userdebug
make installclean
mka genesis

# Upload files to gofile
echo "Upload to gofile will be started..."
if [ -f out/target/product/earth/*.zip ]; then
    wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
    chmod +x upload.sh ; ./upload.sh out/target/product/earth/*.zip
fi
echo "hame"
