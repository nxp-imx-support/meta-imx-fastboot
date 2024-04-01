UBOOT_TARGET_RENAMED = "${UBOOT_TARGET}"
UBOOT_TARGET_RENAMED:mx8m-generic-bsp = "u-boot-atf.itb"

IMAGE_BOOT_FILES:append = " \
   ${UBOOT_TARGET};${UBOOT_TARGET_RENAMED} \
   ${KERNEL_TARGET} \
"

ROOTFS_POSTPROCESS_COMMAND:append = " install_uimage "

install_uimage() {
    mkdir -p ${IMAGE_ROOTFS}/home/root/.falcon
    cp ${DEPLOY_DIR_IMAGE}/uImage ${IMAGE_ROOTFS}/home/root/.falcon
}
