#!/bin/bash

# clone kernel source
git clone https://github.com/Kitauji-High-School/android_kernel_xiaomi_earth.git -b ksu-testing kernel --depth=1
cd kernel

# Setup KernelSU
curl -LSs "https://raw.githubusercontent.com/backslashxx/KernelSU/refs/heads/master/kernel/setup.sh" | bash -s master

# Export
export TZ="Asia/Jakarta"
export KBUILD_BUILD_USER="kumiko" 
export KBUILD_BUILD_HOST="kitauji_quartet"	

# setup clang path
mkdir -p clang
wget https://github.com/AbuRider/scripts/releases/download/20260502/clang-r596125.tar.gz | tar -xz -C clang
export PATH=$PWD/clang/bin:$PATH

make O=out ARCH=arm64 earth_defconfig
make -j$(nproc --all) ARCH=arm64 SUBARCH=arm64 O=out LLVM=1 LLVM_IAS=1
	CC="clang" \
	AR="llvm-ar" \
	NM="llvm-nm" \
	LD="ld.lld -S" \
	OBJCOPY="llvm-objcopy" \
	OBJDUMP="llvm-objdump" \
	STRIP="llvm-strip" \
	CLANG_TRIPLE="aarch64-linux-gnu-" \
	CROSS_COMPILE="aarch64-linux-gnu-" \
	CROSS_COMPILE_ARM32="arm-linux-gnueabi-" \
	CROSS_COMPILE_COMPAT="arm-linux-gnueabi-" \
	CONFIG_DEBUG_SECTION_MISMATCH=y
