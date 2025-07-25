# aarch64 generic uefi image with mbr partitioning and some extra space for bootloaders

## bootable sd card images

- https://github.com/velvet-os/imagebuilder-testimages/releases/tag/mixed-testimages-01 (experimental testimage)

## tested systems - working

- w95 amlogic s905w tv box

## untested systems

- many more are possible as long there is a new u-boot for them and the hardware is supported well by the generic debian kernel

## kernel build notes

- the regular debian/ubuntu distribution kernel is used in this case, so no kernel build required

## u-boot build notes

- https://github.com/hexdump0815/u-boot-misc/blob/master/readme.gxl

## priority

- medium: will be worked on and improved from time to time

## special notes

- the experimental testimage is ment as a starting point for people who want to help bringing support for this system forward, it has missing features and bugs etc. and should not be considered fully daily useable
- more coming soon
