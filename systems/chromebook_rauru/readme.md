# chromebook rauru

## bootable sd card images

- https://github.com/velvet-os/imagebuilder-testimages/releases/tag/mixed-testimages-01 (experimental testimage)

## tested systems - working

- lenovo chromebook plus 15 - navi

## untested systems

- no other rauru chromebooks available yet

## generic mainline linux on arm chromebook notes

- https://github.com/hexdump0815/linux-mainline-on-arm-chromebooks/blob/main/readme.md

## kernel build notes

- https://github.com/hexdump0815/linux-chromeos-kernel/blob/master/readme.rru
  - a chromeos based kernel is used until mainline gets useable on this device

## priority

- experimental mode

## special notes

- the experimental testimage is ment as a starting point for people who want to help bringing support for this system forward, it has missing features and bugs etc. and should not be considered fully daily useable
- this is just some initial draft to support the bringup of this system
- this is still very much wip and not well tested, things might work or might not work
- as long as the chromeos kernel is used there is no gpu support
- sound is intentionally not working to avoid accidently breaking the audio hardware
