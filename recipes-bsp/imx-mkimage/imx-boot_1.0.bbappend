DEPENDS:append = " virtual/kernel u-boot-mkimage-native"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:mx8qxp-generic-bsp = " file://0001-imx8qxp-add-falcon-mode-support.patch "

SRC_URI:append:mx8m-generic-bsp = " file://0001-imx8m-add-falcon-mode-support.patch "

SRC_URI:append:mx8ulp-generic-bsp = " file://0001-imx8ulp-add-falcon-mode-support.patch "

SRC_URI:append:mx93-generic-bsp = " file://0001-imx93-add-falcon-mode-support.patch "

SRC_URI:append:mx95-generic-bsp = " file://0001-imx95-add-falcon-mode-support.patch "

do_compile[depends] += " \
    virtual/kernel:do_deploy \
"

do_compile:append() {
    cp ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${BOOT_STAGING}

    make SOC=${IMX_BOOT_SOC_TARGET} ${KERNEL_TARGET}
    make SOC=${IMX_BOOT_SOC_TARGET} uImage
}

do_deploy:append() {
    cp ${BOOT_STAGING}/${KERNEL_TARGET} ${DEPLOY_DIR_IMAGE}
    cp ${BOOT_STAGING}/${UBOOT_TARGET} ${DEPLOY_DIR_IMAGE}
    cp ${BOOT_STAGING}/uImage ${DEPLOY_DIR_IMAGE}
}
