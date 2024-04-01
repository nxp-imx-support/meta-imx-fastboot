i.MX Fast Boot Meta-Layer
=======================

**What's new**
* Add support for the i.MX 8QXP, i.MX 8MQ and i.MX 8ULP
* Layer restructure
-----------------------

This layer creates custom images with Falcon Mode enabled in U-Boot. Full description of this method can be found in [AN14093](https://www.nxp.com.cn/docs/en/application-note/AN14093.pdf). **Note: The AN14093 has not yet been updated for the LF 6.6.36-2.1.0 BSP version. Please, follow the steps described below in order to build the image with Falcon Mode enabled.**

It supports the **i.MX 8QuadXPlus**, **i.MX 8M Family** (i.MX 8M Quad, i.MX 8M Nano, i.MX 8M Mini, i.MX 8M Plus), **i.MX 8ULP** and the **i.MX 9 Family** (i.MX 93 and i.MX 95).

Yocto Image
-----------
Follow the below instructions for building the image.

#### Prepare the Yocto Project BSP

Follow the steps described in the Section 3-4 from the [i.MX Yocto Project User's Guide](https://www.nxp.com/docs/en/user-guide/IMX_YOCTO_PROJECT_USERS_GUIDE.pdf) to prepare your Yocto environment. We will further assume that the BSP directory is `~/imx-yocto-bsp`.

#### Get the meta-imx-fastboot layer

Clone the `meta-imx-fastboot` layer into your sources directory.

```sh
cd ~/imx-yocto-bsp/sources
git clone -b lf-6.6.36-2.1.0 https://github.com/nxp-imx-support/meta-imx-fastboot
```
	
#### Setup the build folder
	
```sh
cd ~/imx-yocto-bsp
DISTRO=fsl-imx-wayland MACHINE=<machine_name> source imx-setup-release.sh -b <build_dir>
```

Where `<machine_name>` can be:

| i.MX 8             | i.MX 9                 |
|--------------------|------------------------|
| imx8qxpc0mek       | imx93evk               |
| imx8mq-evk         | imx95-19x19-lpddr5-evk |
| imx8mm-lpddr4-evk  |                        |
| imx8mm-ddr4-evk    |                        |
| imx8mn-lpddr4-evk  |                        |
| imx8mn-ddr4-evk    |                        |
| imx8mp-lpddr4-evk  |                        |
| imx8mp-ddr4-evk    |                        |
| imx8ulp-lpddr4-evk |                        |

#### Add the meta-imx-fastboot layer to bblayers

```sh
bitbake-layers add-layer ../sources/meta-imx-fastboot
```

#### Build the image

```sh
bitbake <image_name>
```

Where `<image_name>` can be:

- core-image-minimal
- core-image-base
- imx-image-core
- imx-image-multimedia
- imx-image-full

You can find the resulted image into the deploy directory: `~/imx-yocto-bsp/<build_dir>/tmp/deploy/images/<machine_name>/<image_name>-<machine_name>.rootfs.wic.zst`.

#### Write the image on the SD/eMMC

To write the image on the eMMC using UUU, use the following command:

```sh
uuu -b emmc_all <image_name>-<machine_name>.rootfs.wic.zst
```
If you want to write the SD using UUU, replace `emmc` with `sd`.

If you want to write the image on the SD card from the host machine, use `dd`, as described in Section 4.3.2 from the [i.MX Linux User's Guide](https://www.nxp.com/docs/en/user-guide/IMX_LINUX_USERS_GUIDE.pdf). 

#### Prepare the kernel device tree

To boot in Falcon Mode, the kernel device tree must be fixed up in U-Boot.

Boot the board using the image built at the previous step, and stop it in U-Boot.

Run the following command:

```sh
u-boot => run prepare_fdt
```

This command creates the `<board>-falcon.dtb`, which is saved automatically in the FAT (boot) partition of the SD card. **You only need to run this command once.**

This device tree will be used by SPL to boot in Falcon Mode.

#### Enable DDR Quickboot for i.MX 95

```sh
u-boot => qb save
```

Any subsequent time you boot the board, it will automatically start in Falcon Mode. You can fall back to U-Boot by keeping any key pressed during power on.
