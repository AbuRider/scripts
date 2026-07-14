#!/bin/bash
rm -rf .repo/local_manifests

# init source
repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 16 -g default,-mips,-darwin,-notdefault
# Clone local manifests
git clone https://github.com/aosp-pablo/device_manifest.git -b infinity .repo/local_manifests
/opt/crave/resync.sh # crave repo sync

export BUILD_USERNAME=Hhh
export BUILD_HOSTNAME=Hhh

. build/envsetup.sh
lunch infinity_marble-user
mka bacon
