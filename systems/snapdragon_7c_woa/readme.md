# snapdragon 7c based windows on arm laptops

## bootable sd card images

- https://github.com/velvet-os/imagebuilder-testimages/releases/tag/spring-2026-testimages (experimental testimage)
- https://github.com/velvet-os/imagebuilder/releases/tag/251220-01
- https://github.com/velvet-os/imagebuilder-testimages/releases/tag/spring-release-2025-testimages-round-08 (testimage)
- https://github.com/velvet-os/imagebuilder/releases/tag/240107-01
- https://github.com/velvet-os/imagebuilder/releases/tag/230308-01
- https://github.com/velvet-os/imagebuilder/releases/tag/230305-01
- https://github.com/velvet-os/imagebuilder/releases/tag/221101-01

## tested systems - working

- samsung galaxy book go (snapdragon 7c gen2)
- acer aspire 1 a114-61 (snapdragon 7c)

see also https://github.com/velvet-os/imagebuilder/issues/136 for all above

## untested systems

- asus exportbook b3 detachable b3000 (snapdragon 7c gen2)
- hp laptop 14 (14-ed0123wm) (snapdragon 7c gen2)
- lenovo 10w 82st (snapdragon 7c gen2)
- tcl book 14 go (snapdragon 7c)
- jp.ik turn connect t101 (snapdragon 7c)
- jp.ik leap connect t304 (snapdragon 7c)
- positivo wise n1212S (snapdragon 7c)

## kernel build notes

- https://github.com/hexdump0815/linux-mainline-qcom-msm8998-kernel/blob/main/readme.qc7

## priority

- low: will be worked on and improved rarely, still very limited mainline support

## special notes

- this is very much work in progress, not really useable yet and mostly ment as a starting point for helping to bring mainline linux forward on this platform
- the grub setup so far is only an ugly hack to make it boot at all and the boot config is currently hard coded in /boot/boot/grub/grub.cfg (update since the 2025 images: regular u-boot is now used and the boot menu is generated via /etc/grub.d/40_custom)
- currently the dtb file for the samsung galaxy book go is hard coded in the grub config file, this needs to be adjusted in case of the aspire 1 or another snapdragon 7c system (update since the 2025 images: there is now a grub menu with all supported systems)
- the root filesystems is currently still set to ext4 (update since the 2025 images: btrfs is used now as well)
- so far only tested with bookworm, not sure if grub etc. in jammy is new enough to be working
- the linux support for those snapdragon 7c on windows on arm system is in its very early stages, but there is quite a bit of useable code already there from the snapdragon 7c chromebooks (trogdor)
- booting should only be done from usb for now, please keep the windows installation on emmc/ufs as it might be required to get updated firmware files from it still
- secure boot needs to be disabled in the bios in order to be able to boot those images at all
- some info on the samsung galaxy book go bringup can be found here: https://oftc.irclog.whitequark.org/aarch64-laptops/2022-10-18#31531590 and the following days and some info about the acer aspire 1 can be found here: https://oftc.irclog.whitequark.org/aarch64-laptops/2022-07-30#31145280
- samsung galaxy book go notes:
  - to enter the bios press f2 early after boot, sometimes it takes a few tries until it will enter the bios
  - to enter the boot selector press f10 early after powering on the device, sometimes it takes quite a few tries until the usb disk is detected by the boot selector (should be something like "uefi: usb ..." in the menu)
  - booting from usb seems to be quite selective on the device used: a sandisk ultra stick was detected only at around each 10th try, some no name slow cheap usb device worked much better, so some experimentation might be required - it seems to work more reliable if the usb device is connected via a usb-c to usb-a hub: this way it was visible each time in the boot menu, otherwise only every few tries - see also: https://github.com/velvet-os/imagebuilder/discussions/320#discussioncomment-14787323
  - sometimes it also seems to help to fix the secondary gpt partition table at the end of the disk (which is always wrong due to the size mismatch of the size of the created image and the size of the device it is written to) by doing an fdisk on the disk on some linux system without changing anything and still writing the result as this fixes that seconday gpt table - some bios versions seem to be sensitive to that - see: https://github.com/velvet-os/imagebuilder/discussions/400#discussioncomment-15312846
  - the right usb-c port (left not tested yet) is also working if some usb-c hub or adapter is connected to it while booting, this way a usb hub can be used to connect a mouse and usb ethernet
  - working so far: display framebuffer, keyboard (needs some key press during boot to get rid of logged errors), usb-a, usb-c (if connected together with usb-a at boot time already), gpu if at least one firmware file from windows is installed
  - a potential way to get rid of the log spam from the keyboard i2c is described here: https://github.com/velvet-os/imagebuilder/issues/136#issuecomment-3682300190
  - some interesting info: https://github.com/aarch64-laptops/debian-cdimage/issues/21
- acer aspire 1 a114-61 notes:
  - the started mainline port for it by nikita travkin (travmurav):
    - https://github.com/TravMurav/linux/tree/aspire1
    - https://gitlab.com/TravMurav/pmaports/-/tree/aspire1/device/testing/linux-postmarketos-qcom-sc7180
    - https://gitlab.com/TravMurav/pmaports/-/tree/aspire1/device/testing/device-acer-aspire1
  - working so far (beyond what is supported on the samsung galaxy book go): touchpad, wifi, bt (not sure), audio (maybe), battery status
- it looks like it is possible to create a recovery disk/drive from within windows via "start/windows" button and then searching for "recovery drive" (or whatever the proper translation for the installed windows language might be) and then using the resulting application to create such a drive on some usb disk following the dialogs - i did not try or use this yet, but it looks like its a good idea to create such a thing before even starting to play around with linux on a windows on arm device as there are usually no recovery media available for them
