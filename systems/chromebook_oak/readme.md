# chromebook oak

## bootable sd card images

- https://github.com/velvet-os/imagebuilder/releases/tag/251115-01
- https://github.com/velvet-os/imagebuilder-testimages/releases/tag/spring-release-2025-testimages-round-01 (testimage)
- https://github.com/velvet-os/imagebuilder/releases/tag/230920-01
- https://github.com/velvet-os/imagebuilder/releases/tag/230218-02
- https://github.com/velvet-os/imagebuilder/releases/tag/220819-01
- https://github.com/velvet-os/imagebuilder/releases/tag/220606-02
- https://github.com/velvet-os/imagebuilder/releases/tag/210724-02
- https://github.com/velvet-os/imagebuilder/releases/tag/210509-01
- https://github.com/velvet-os/imagebuilder/releases/tag/210321-01

## tested systems - working

- acer chromebook r13 - elm
- lenovo chromebook 100e (mt8173 version) - [hana](https://github.com/velvet-os/velvet-os.github.io/blob/main/chromebooks/systems/oak/hana-100e-gen2.md)
- lenovo chromebook 300e (mt8173 version) - [hana](https://github.com/velvet-os/velvet-os.github.io/blob/main/chromebooks/systems/oak/hana-300e-gen2-mtk.md)
- lenovo chromebook n23 - hana
- asus chromebook c202xa - hana
- asus chromebook c203x - hana

## untested systems

- lenovo chromebook c330 - hana
- lenovo chromebook s330 - hana
- lenovo ideapad flex 3 chromebook (mt8173 version) - hana

## generic mainline linux on arm chromebook notes

- https://github.com/hexdump0815/linux-mainline-on-arm-chromebooks/blob/main/readme.md

## kernel build notes

- https://github.com/hexdump0815/linux-mainline-mediatek-mt81xx-kernel/blob/master/readme.cbm

## priority

- medium: will be worked on and improved from time to time, waiting for mainline gpu driver to get ready

## special notes

- most things seem to work more or less
- there is no gpu acceleration as there is no open source driver available for the powervr gpu in the mt8173 soc, mesa software rendering is used instead for opengl etc.
- when booting from an usb medium the bootup might hang waiting to discover the root device - in such cases it might help to shortly unplug and replug the usb medium the system is booted from
