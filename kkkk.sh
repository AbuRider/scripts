#!/bin/bash

# init source
repo init --depth=1 -u https://github.com/AbuRider/luminedruid_manifest.git -b bellflower --git-lfs
/opt/crave/resync.sh # crave repo sync

git clone https://github.com/Kitauji-High-School/android_device_xiaomi_earth.git -b Lumine-16.2 device/xiaomi/earth

export BUILD_USERNAME=kumiko
export BUILD_HOSTNAME=kitauji_quartet

. build/envsetup.sh
lunch earth-bp4a-userdebug
mka bacon
