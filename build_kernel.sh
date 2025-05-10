#!/bin/bash

OUT_DIR=out
COMMON_ARGS="-j$(nproc --all) -C $(pwd) O=$(pwd)/${OUT_DIR} ARCH=arm CROSS_COMPILE=arm-linux-androideabi-"

export PATH=$(realpath ../android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9/bin/):$PATH

[ -d ${OUT_DIR} ] && rm -rf ${OUT_DIR}
mkdir ${OUT_DIR}

make ${COMMON_ARGS} msm8937_sec_defconfig VARIANT_DEFCONFIG=msm8937_sec_gta2slte_sea_open_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make ${COMMON_ARGS}

cp ${OUT_DIR}/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage

