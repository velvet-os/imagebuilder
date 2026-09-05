# motorola moto g4 play - harpia

## bootable sd card images

- https://github.com/velvet-os/imagebuilder-testimages/releases/tag/spring-2026-testimages
- https://github.com/velvet-os/imagebuilder-testimages/releases/tag/autumn-release-2025-testimages (testimage)
- https://github.com/velvet-os/imagebuilder-testimages/releases/tag/spring-release-2025-testimages-round-05 (testimage)
- https://github.com/velvet-os/imagebuilder/releases/tag/231111-02
- https://github.com/velvet-os/imagebuilder/releases/tag/211231-02

## tested systems - working

- motorola moto g4 play xt1602 - harpia

## untested systems

- motorola moto g4 play xt1603
- motorola moto g4 play xt1604
- motorola moto g4 play xt1607

## kernel build notes

- right now i'm still using a postmarketos kernel+initrd=boot.img and will maybe later move to an own boot.img
  - https://github.com/hexdump0815/pmaports-other/tree/main/linux-postmarketos-qcom-msm8916
  - https://github.com/hexdump0815/pmaports-other/tree/main/device-motorola-harpia

## priority

- low: will be worked on and improved rarely

## special notes

- this is not very useable yet, still in a very early and experimental phase
- to install write the image to an sd card and install lk2nd-msm8916.img from https://github.com/msm8916-mainline/lk2nd/releases via the instructions in https://github.com/msm8916-mainline/lk2nd/blob/master/README.md
- it looks like not all lk2nd versions are working well - the newer versions from 17.0 on seem to not boot properly from sd card anymore (always only booting into fastboot mode) but the older versions up to 0.16.0 version seem to be working (tested with v0.15.0 on harpia)
- a1 rated sd cards are highly recommended as otherwise the performance will be bad due to bad random disk io
- if the phone is connected to a computer or power supply via usb a shutdown will result in a reboot, disconnecting it will let it shutdown properly
- sometimes there the system was hanging during shutdown, tapping onto the screen a few times seems to help (i did not see this happen anymore in recent times)
- in case of problems with the boot process the phone does not seem to respond to the power button anymore to turn it off, pressing the vol-down and the power button together for a while might help out in those situation
- sound does not seem to work
- wifi only works partially (see link below)
- see also: https://wiki.postmarketos.org/wiki/Motorola_Moto_G4_Play_(motorola-harpia)
- if the usb port in the kernel is switched from "peripheral" to "host" mode in the dtb (which is the case for latest kernel used here) it is possible to connect usb devices (keyboard, mouse, ethernet etc.) to it via a powered otg usb hub ... it has to be powered as the usb port itself will not provide power ... it looks like the phone even gets powered well via the powered hub in this mode
- suspend via s2idle mode seems to work quite well and the phone should be able to survive more than a day in this mode - wakeup can be done via a short press on the power button or by conneting power to usb - it takes a very long time for the phone to wake up for some reason (up to a few minutes)
- charging of the phone does not seem to work while running linux (see todo.txt) - luckily if running with a powered special otg usb hub with its switch in the middle position the phone seems to be powered quite well via usb - the only way to charge it so far i found is to boot into the twrp recovery i had installed beforehand via vol-down + power and then select recovery mode, in this mode it seems to charge properly
- fun fact: it is possible to connect an external monitor using a displaylink usb2 adapter with the linux udl kernel driver and the setup as described in https://wiki.archlinux.org/title/DisplayLink#Configuring_X_Server - the performance of the result is nothing one wants to work with for too long :)
- the gpu support in newer kernel versions seems to be not that good anymore and for firefox it is recommended to disable gpu support by setting layers.acceleration.disabled to true in about:config
