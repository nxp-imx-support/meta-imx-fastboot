FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:mx8qxp-generic-bsp = " \
	file://0001-imx8qxp-add-falcon-mode-support.patch \
	file://imx8qxp-falcon.cfg \
"

SRC_URI:append:mx8m-generic-bsp = " \
	file://0001-imx8m-reset-ethernet-phy-in-spl.patch \
"

SRC_URI:append:mx8mq-generic-bsp = " \
	file://0001-imx8mq-add-falcon-mode-support.patch \
	file://imx8mq-falcon.cfg \
"

SRC_URI:append:mx8mn-generic-bsp = " \
	file://0001-imx8mn-add-falcon-mode-support.patch \
	file://imx8mn-falcon.cfg \
"

SRC_URI:append:mx8mm-generic-bsp = " \
	file://0001-imx8mm-add-falcon-mode-support.patch \
	file://imx8mm-falcon.cfg \
"

SRC_URI:append:mx8mp-generic-bsp = " \
	file://0001-imx8mp-add-falcon-mode-support.patch \
	file://imx8mp-falcon.cfg \
"

SRC_URI:append:mx8ulp-generic-bsp = " \
	file://0001-imx8ulp-add-falcon-mode-support.patch \
	file://imx8ulp-falcon.cfg \
"

SRC_URI:append:mx93-generic-bsp = " \
	file://0001-imx93-add-falcon-mode-support.patch \
	file://imx93-falcon.cfg \
"

SRC_URI:append:mx95-generic-bsp = " \
	file://0001-imx95-add-falcon-mode-support.patch \
	file://imx95-falcon.cfg \
"
