
#!/bin/bash

export PATH=/mnt/ramdisk/gcc/bin:$PATH
# export SEC_BUILD_OPTION_HW_REVISION=02

mkdir out

make -C $(pwd) O=$(pwd)/out ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- KCFLAGS=-mno-android VARIANT_DEFCONFIG=sdm450_sec_j8y18lte_cis_ser_defconfig sdm450_sec_defconfig SELINUX_DEFCONFIG=selinux_defconfig SELINUX_LOG_DEFCONFIG=selinux_log_defconfig 

make -j8 -C $(pwd) O=$(pwd)/out ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- KCFLAGS=-mno-android
cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image

