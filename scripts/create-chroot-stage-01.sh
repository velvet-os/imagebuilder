#!/bin/bash
#
# IMPORTANT: as this script is being run as part of the rootfs cache
#            creation the rootfs cache has to be deleted after each
#            change in this script so that it gets recreated properly

# do not ask anything
export DEBIAN_FRONTEND=noninteractive

export LANG=C

apt-get update
apt-get -yq upgrade
# slick greeter is required as the default one seems to have problems on 32bit systems
# see: https://bluesabre.org/2019/10/20/install-xubuntu-19-10-on-a-raspberry-pi-4/
if [ "$1" = "jammy" ]; then
  apt-get -yq install locales vim openssh-server ssh-askpass sudo net-tools ifupdown iputils-ping kmod less rsync u-boot-tools usbutils dosfstools mesa-utils mesa-utils-extra console-data xubuntu-desktop linux-firmware lvm2 cryptsetup-bin cryptsetup-initramfs slick-greeter rsyslog btrfs-progs btrfs-compsize dialog cgpt lz4 vboot-kernel-utils plymouth plymouth-label plymouth-theme-xubuntu-logo plymouth-theme-xubuntu-text xserver-xorg-video-fbdev xinput rfkill curl gnome-system-tools gnome-system-monitor iptables firmware-sof-signed git strace glmark2 pwgen fdisk gdisk libglib2.0-bin initramfs-tools network-manager
elif [ "$1" = "noble" ]; then
  apt-get -yq install locales vim openssh-server ssh-askpass sudo net-tools ifupdown iputils-ping kmod less rsync u-boot-tools usbutils dosfstools mesa-utils mesa-utils-extra console-data xubuntu-desktop linux-firmware lvm2 cryptsetup-bin cryptsetup-initramfs slick-greeter rsyslog btrfs-progs btrfs-compsize dialog cgpt lz4 vboot-kernel-utils plymouth plymouth-label plymouth-theme-xubuntu-logo plymouth-theme-xubuntu-text xserver-xorg-video-fbdev xinput rfkill curl gnome-system-tools gnome-system-monitor iptables firmware-sof-signed git strace glmark2 pwgen fdisk gdisk libglib2.0-bin initramfs-tools network-manager
elif [ "$1" = "bookworm" ]; then 
  apt-get -yq install locales vim openssh-server ssh-askpass sudo net-tools ifupdown iputils-ping kmod less rsync u-boot-tools usbutils dosfstools mesa-utils mesa-utils-extra console-data task-xfce-desktop xserver-xorg-input-synaptics blueman firmware-linux-free firmware-linux firmware-linux-nonfree firmware-misc-nonfree firmware-brcm80211 firmware-iwlwifi firmware-intel-sound firmware-samsung firmware-libertas firmware-realtek firmware-qcom-soc firmware-qcom-media firmware-atheros pulseaudio pavucontrol lvm2 cryptsetup-bin cryptsetup cryptsetup-initramfs slick-greeter btrfs-progs btrfs-compsize dialog cgpt lz4 vboot-kernel-utils bc plymouth plymouth-themes xserver-xorg-video-fbdev xinput rfkill curl onboard gnome-system-tools gnome-system-monitor firmware-sof-signed git strace glmark2 pwgen fdisk gdisk libglib2.0-bin initramfs-tools tasksel network-manager
  tasksel install standard
elif [ "$1" = "trixie" ]; then
  apt-get -yq install locales vim openssh-server ssh-askpass sudo net-tools ifupdown iputils-ping kmod less rsync u-boot-tools usbutils dosfstools mesa-utils mesa-utils-extra console-data task-xfce-desktop xserver-xorg-input-synaptics blueman firmware-linux-free firmware-linux firmware-linux-nonfree firmware-misc-nonfree firmware-brcm80211 firmware-iwlwifi firmware-intel-sound firmware-samsung firmware-libertas firmware-realtek firmware-qcom-soc firmware-qcom-media firmware-atheros pulseaudio pavucontrol lvm2 cryptsetup-bin cryptsetup cryptsetup-initramfs slick-greeter btrfs-progs dialog lz4 bc plymouth plymouth-themes xserver-xorg-video-fbdev xinput rfkill curl onboard gnome-system-monitor firmware-sof-signed git strace glmark2 pwgen fdisk gdisk libglib2.0-bin initramfs-tools tasksel network-manager
  # it looks like currently gnome-system-tools is not yet available again for armv7l in trixie
  if [ "$2" != "armv7l" ]; then
    apt-get -yq install gnome-system-tools
  else
    apt-get -yq install system-tools-backends
  fi
  # it looks like currently those three packages are not yet available for riscv64 in trixie
  if [ "$2" != "riscv64" ]; then
    apt-get -yq install cgpt vboot-kernel-utils
  fi
  tasksel install standard
# special debian sid config for riscv64 as there is no useable bookworm for it yet
elif [ "$1" = "sidriscv" ]; then
  apt-get -yq install locales vim openssh-server ssh-askpass sudo net-tools ifupdown iputils-ping kmod less rsync u-boot-tools usbutils dosfstools mesa-utils mesa-utils-extra console-data task-xfce-desktop xserver-xorg-input-synaptics blueman firmware-linux-free firmware-linux firmware-linux-nonfree firmware-misc-nonfree firmware-brcm80211 firmware-iwlwifi firmware-intel-sound firmware-samsung firmware-libertas firmware-realtek firmware-qcom-soc firmware-qcom-media firmware-atheros pulseaudio pavucontrol lvm2 cryptsetup-bin cryptsetup cryptsetup-initramfs slick-greeter btrfs-progs btrfs-compsize dialog lz4 bc plymouth plymouth-themes xserver-xorg-video-fbdev xinput rfkill curl gnome-system-tools gnome-system-monitor firmware-sof-signed git strace glmark2 pwgen fdisk gdisk libglib2.0-bin initramfs-tools tasksel network-manager
  # temporarily disabled as its python dependency seems to be broken, to be brought back once fixed
  # apt-get -yq install onboard
  tasksel install standard
fi
