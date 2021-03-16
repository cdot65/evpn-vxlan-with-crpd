#!/bin/bash     

set -e

mount -t bpf bpf /sys/fs/bpf/   # required for xdp maps

if [ -s /config/network-init.sh ]; then
   /bin/bash /config/network-init.sh > /root/network-init.log 2>&1 & disown
fi

export > /etc/envvars
exec /sbin/runit-init 0
