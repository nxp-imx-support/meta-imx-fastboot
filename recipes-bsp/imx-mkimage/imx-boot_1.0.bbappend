DEPENDS:append = " virtual/kernel u-boot-mkimage-native"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://0001-Add-fastboot-support-for-iMX8M-and-iMX9.patch"

do_compile[depends] += " \
    virtual/kernel:do_deploy \
"

do_compile:append:mx8m-generic-bsp() {
    cp ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${BOOT_STAGING}
    cp ${DEPLOY_DIR_IMAGE}/bl31-${ATF_PLATFORM}.bin ${BOOT_STAGING}/bl31.bin
    
    make SOC=${IMX_BOOT_SOC_TARGET} kernel-atf.itb
    make SOC=${IMX_BOOT_SOC_TARGET} uImage
}

do_compile:append:mx9-generic-bsp() {
    cp ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${BOOT_STAGING}
    cp ${DEPLOY_DIR_IMAGE}/bl31-${ATF_PLATFORM}.bin ${BOOT_STAGING}/bl31.bin

    make SOC=${IMX_BOOT_SOC_TARGET} kernel-atf-container.img
    make SOC=${IMX_BOOT_SOC_TARGET} uImage
}

do_deploy:append:mx8m-generic-bsp() {
    cp ${BOOT_STAGING}/kernel-atf.itb ${DEPLOY_DIR_IMAGE}
    cp ${BOOT_STAGING}/u-boot.itb ${DEPLOY_DIR_IMAGE}/u-boot-atf.itb
    cp ${BOOT_STAGING}/uImage ${DEPLOY_DIR_IMAGE}
}

do_deploy:append:mx9-generic-bsp() {
    cp ${BOOT_STAGING}/kernel-atf-container.img ${DEPLOY_DIR_IMAGE}
    cp ${BOOT_STAGING}/u-boot-atf-container.img ${DEPLOY_DIR_IMAGE}
    cp ${BOOT_STAGING}/uImage ${DEPLOY_DIR_IMAGE}
}
