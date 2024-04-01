#!/bin/sh
#
# i.MX Yocto Project Build Environment Setup Script
#
# Copyright (C) 2011-2016 Freescale Semiconductor
# Copyright 2017, 2024 NXP
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

echo Reading command line parameters
# Read command line parameters
while getopts "k:r:t:b:e:gh" nxp_setup_flag
do
    case $nxp_setup_flag in
        b) BUILD_DIR="$OPTARG";
           echo -e "\n Build directory is $BUILD_DIR" ;
           ;;
        h) nxp_setup_help='true';
           ;;
        ?) nxp_setup_error='true';
           ;;
    esac
done

RELEASEPROGNAME="./imx-setup-release.sh"

echo source $RELEASEPROGNAME -b $BUILD_DIR
source $RELEASEPROGNAME -b $BUILD_DIR

echo "BBLAYERS += \" \${BSPDIR}/sources/meta-imx-fastboot \"" >> $BUILD_DIR/conf/bblayers.conf