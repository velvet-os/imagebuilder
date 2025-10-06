# chromebook corsola

## bootable sd card images

- https://github.com/velvet-os/imagebuilder-testimages/releases/tag/spring-release-2025-testimages-round-01 (testimage)
- https://github.com/velvet-os/imagebuilder/releases/tag/240112-01
- https://github.com/velvet-os/imagebuilder/releases/tag/230626-01

## tested systems - working

- lenovo ideapad slim 3 (mt8186 version) - [magenton](https://github.com/velvet-os/velvet-os.github.io/blob/main/chromebooks/systems/corsola/magneton.md)
  - see also: https://github.com/velvet-os/imagebuilder/issues/228
- asus chromebook cm14 (cm1402c) - tentacool

## untested systems

- lenovo 100e gen 4 (mt8186 version) - rusty
- lenovo 300e gen 4 (mt8186 version) - steelix
- asus chromebook cm14 flip (cm1402f) - tentacruel
- asus chromebook enterprise cm30 detachable (cm3001) - starmie
- asus chromebook cz12 (cz1204c) - chinchou
- asus chromebook cz12 flip (cz1204f) - chinchou360
- huaqin noname (it seems to have lte) - ponyta
- acer chromebook 311 (c723/c723t) - voltorb
- acer chromebook 311 (r724t) - squirtle
- hp chromebook g1m 11 inch - skitty

## generic mainline linux on arm chromebook notes

- https://github.com/hexdump0815/linux-mainline-on-arm-chromebooks/blob/main/readme.md

## kernel build notes

- https://github.com/hexdump0815/linux-mainline-mediatek-mt81xx-kernel/blob/master/readme.cbm

## mesa build notes

- not relevant yet

## priority

- medium: will be worked on and improved from time to time

## special notes

- most things seem to work more or less with the mainline kernel meanwhile
- by default sound is disabled as multiple people reported strange noises on
  bootup. to enable audio on corsola devices, please do the following steps as
root:
    ```
    mv /usr/share/alsa/ucm2/conf.d/sof-mt8186_rt10.off /usr/share/alsa/ucm2/conf.d/sof-mt8186_rt10
    mv /usr/share/alsa/ucm2/sof-mt8186_rt10.off /usr/share/alsa/ucm2/sof-mt8186_rt10
    alsaucm -c sof-mt8186_rt10 reload
    ```
  and then as the normal user:
    ```
    systemctl --user restart pipewire wireplumber pipewire-pulse
    ```
  audio should work afterwards. also, you may need to initialize the
SectionDevice manually once (only one time) to make pulseaudio finds them
properly, same for Headphone and InternalMic:
    ```
    alsaucm  -c sof-mt8186_rt10 set _verb HiFi set _enadev Speaker
    alsaucm  -c sof-mt8186_rt10 set _verb HiFi set _enadev InternalMic
    ```
- it looks like (at least the initial batch of) corsola chromebooks is a bit
  buggy when trying to switch into developer mode and seems to hang there, so
either an update has to be done first or they have to be restored from the
latest recovery image - then switching to developer mode works properly
