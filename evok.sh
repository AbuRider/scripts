#!/bin/bash

# Clean up directory
# rm -rf prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 # (Notes: it's has been depecrated on LineageOS 24.0, see: https://github.com/LineageOS/android/commit/de40b9789872d37f5bfd3ad703f801701c0e9ca6) 

# init rom source 
repo init --depth=1 -u https://github.com/Evolution-X/manifest.git -b cnb --git-lfs
/opt/crave/resync.sh # sync source

# git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b EvolutionX-17.0 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

# build start
. build/envsetup.sh
lunch lineage_earth-cp2a-userdebug
make installclean
m evolution

# Upload files to gofile
if [ -f out/target/product/earth/*202607*.zip ]; then
  wget https://raw.githubusercontent.com/lordgaruda/GoFile-Upload/refs/heads/master/upload.sh
  chmod +x upload.sh ; ./upload.sh out/target/product/earth/boot.img ; ./upload.sh out/target/product/earth/*202607*.zip
fi
