i.MX Fast Boot Meta-Layer
=======================

This layer creates custom images with Falcon Mode enabled in U-Boot. Full description of this method can be found in [AN14093](https://www.nxp.com.cn/docs/en/application-note/AN14093.pdf).

It supports the **i.MX8M Family** (i.MX8M Nano, i.MX8M Mini, i.MX8M Plus) and the **i.MX9 Family** (i.MX93 and i.MX95). 

Yocto Image
-----------
Follow the below instructions for building the image.

#### Download the Yocto Project BSP

```sh
repo init -u https://github.com/nxp-imx/imx-manifest -b imx-linux-scarthgap -m imx-6.6.23-2.0.0.xml
repo sync
```

#### Get the meta-imx-fastboot Meta-layer

Clone the meta-imx-fastboot Meta-layer into your sources directory
	
#### Setup the build folder
	
```sh
DISTRO=fsl-imx-wayland MACHINE=<machine_name> source sources/meta-imx-fastboot/tools/imx-setup-fastboot.sh -b <build_dir>
```

Where ```<machine_name>``` is:
- **imx8mnevk-fastboot** 			    for i.MX8M Nano
- **imx8mmevk-fastboot** 			    for i.MX8M Mini
- **imx8mpevk-fastboot**			    for i.MX8M Plus
- **imx93evk-fastboot**  			    for i.MX93
- **imx95-19x19-lpddr5-evk-fastboot** 	for i.MX95

#### Build the fastboot image

```sh
bitbake imx-image-fastboot
```

#### Prepare the kernel device tree

To boot in Falcon Mode, the kernel device tree must be fixed up in U-Boot.

Boot the board using the image built at the previous step, and stop it in U-Boot.

Run the following command:

```sh
u-boot => run prepare_fdt
```

This command creates the ```<board>-falcon.dtb```, which is saved automatically in the FAT partition of the SD card. **You only need to run this command once.**

This device tree will be used by SPL to boot in Falcon Mode.

#### Enable DDR Quickboot for i.MX 95

```sh
u-boot => qb save
```

Any subsequent time you boot the board, it will automatically start in Falcon Mode. You can fall back to U-Boot by keeping any key pressed during power on.
