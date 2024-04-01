# Copyright 2024 NXP

DESCRIPTION = "An i.MX image with Falcon Mode enabled"
LICENSE = "MIT"

require recipes-fsl/images/imx-image-multimedia.bb

ROOTFS_POSTPROCESS_COMMAND:append = " \
    install_uimage; \
"

install_uimage() {
    mkdir -p ${IMAGE_ROOTFS}/home/root/.falcon
    cp ${DEPLOY_DIR_IMAGE}/uImage ${IMAGE_ROOTFS}/home/root/.falcon
}
