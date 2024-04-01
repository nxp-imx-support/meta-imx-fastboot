FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:mx8qxp-generic-bsp = " file://0001-imx8qxp-add-falcon-mode-support.patch "

SRC_URI:append:mx8mq-generic-bsp = " file://0001-imx8mq-add-falcon-mode-support.patch "
SRC_URI:append:mx8mn-generic-bsp = " file://0001-imx8mn-add-falcon-mode-support.patch "
SRC_URI:append:mx8mm-generic-bsp = " file://0001-imx8mm-add-falcon-mode-support.patch "
SRC_URI:append:mx8mp-generic-bsp = " file://0001-imx8mp-add-falcon-mode-support.patch "

SRC_URI:append:mx8ulp-generic-bsp = " file://0001-imx8ulp-add-falcon-mode-support.patch "

SRC_URI:append:mx93-generic-bsp = " file://0001-imx93-add-falcon-mode-support.patch "
SRC_URI:append:mx95-generic-bsp = " file://0001-imx95-add-falcon-mode-support.patch "
