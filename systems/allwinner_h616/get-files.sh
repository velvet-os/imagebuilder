# this file is supposed to be sourced by the get-files shell script  

allwinner_h616_release_version="6.18.34-stb-616%2B"
allwinner_h616_uboot_version="260420-04"

rm -f ${DOWNLOAD_DIR}/kernel-allwinner_h616-${2}.tar.gz
wget -v https://github.com/hexdump0815/linux-mainline-and-mali-allwinner-h6-kernel/releases/download/${allwinner_h616_release_version}/${allwinner_h616_release_version}.tar.gz -O ${DOWNLOAD_DIR}/kernel-allwinner_h616-${2}.tar.gz

rm -f ${DOWNLOAD_DIR}/boot-allwinner_h616-${2}.dd
wget -v https://github.com/hexdump0815/u-boot-misc/releases/download/${allwinner_h616_uboot_version}/boot-allwinner_h616-transpeed-8k618-t-aarch64.dd.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-allwinner_h616-${2}.dd

# get different u-boot versions for different h616 systems to have them around
rm -rf ${DOWNLOAD_DIR}/boot-extra-${1}
mkdir -p ${DOWNLOAD_DIR}/boot-extra-${1}
cp ${DOWNLOAD_DIR}/boot-allwinner_h616-${2}.dd ${DOWNLOAD_DIR}/boot-extra-${1}/boot-allwinner_h616-transpeed-8k618-t-aarch64.dd
wget -v https://github.com/hexdump0815/u-boot-misc/releases/download/${allwinner_h616_uboot_version}/boot-allwinner_h616-x96_mate-aarch64.dd.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/boot-allwinner_h616-x96_mate.dd
wget -v https://github.com/hexdump0815/u-boot-misc/releases/download/${allwinner_h616_uboot_version}/boot-allwinner_h616-x96q-aarch64.dd.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/boot-allwinner_h616-x96q.dd
wget -v https://github.com/hexdump0815/u-boot-misc/releases/download/${allwinner_h616_uboot_version}/boot-allwinner_h616-tanix_tx1-aarch64.dd.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/boot-allwinner_h616-tanix_tx1.dd
wget -v https://github.com/hexdump0815/u-boot-misc/releases/download/${allwinner_h616_uboot_version}/boot-allwinner_h616-orangepi_zero2-aarch64.dd.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/boot-allwinner_h616-opizero2.dd
wget -v https://github.com/hexdump0815/u-boot-misc/releases/download/${allwinner_h616_uboot_version}/boot-allwinner_h616-orangepi_zero2w-aarch64.dd.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/boot-allwinner_h616-opizero2w.dd
wget -v https://github.com/hexdump0815/u-boot-misc/releases/download/${allwinner_h616_uboot_version}/boot-allwinner_h616-orangepi_zero3-aarch64.dd.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/boot-allwinner_h616-opizero3.dd
wget -v https://github.com/hexdump0815/u-boot-misc/releases/download/${allwinner_h616_uboot_version}/boot-allwinner_h616-longanpi-3h-aarch64.dd.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/boot-allwinner_h616-longanpi-3h-aarch64.dd
# lets only use new u-boot versions now
#wget -v https://github.com/hexdump0815/linux-mainline-and-mali-allwinner-h6-kernel/raw/24b1d4651f39f1a690debf06f23a9e35dae775e2/misc.616/u-boot/boot-h313-lpddr3.dd.gz -O - | gunzip -c > ${DOWNLOAD_DIR}/boot-extra-${1}/boot-allwinner_h313-lpddr3.dd
