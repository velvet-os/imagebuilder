#!/bin/bash

# add some extra options to the kernel cmdline
sed -i 's,GRUB_CMDLINE_LINUX="",GRUB_CMDLINE_LINUX="rootwait ro fsck.fix=yes fsck.repair=yes net.ifnames=0 noresume apparmor=0 systemd.gpt_auto=0",g' /etc/default/grub
