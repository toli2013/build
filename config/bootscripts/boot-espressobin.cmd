# DO NOT EDIT THIS FILE
#
# Please edit /boot/armbianEnv.txt to set supported parameters
#

load ${devtype} ${devnum}:${distro_bootpart} ${scriptaddr} ${prefix}armbianEnv.txt
env import -t ${scriptaddr} ${filesize}

setenv bootargs "$console root=${rootdev} rootfstype=${rootfstype} rootwait loglevel=${verbosity} usb-storage.quirks=${usbstoragequirks}  ${extraargs}"

load $devtype ${devnum}:${distro_bootpart} $kernel_addr_r ${prefix}Image
load $devtype ${devnum}:${distro_bootpart} $ramdisk_addr_r ${prefix}uInitrd
load $devtype ${devnum}:${distro_bootpart} $fdt_addr_r ${prefix}dtb/$fdtfile

booti $kernel_addr_r $ramdisk_addr_r $fdt_addr_r

# mkimage -C none -A arm -T script -d /boot/boot.cmd /boot/boot.scr.uimg
