#!/bin/bash

set -e

until ip link show eth0 up; do
  echo "waiting for eth0 up ..."
  sleep 1
done

ip link set eth0 address 00:33:33:33:60:00

ip link add link eth0 name eth0.600 type vlan id 600
ip link set eth0.600 up

ip addr add 99.60.0.3/24 dev eth0.600
ip -6 addr add 1234::99.60.0.3/120 dev eth0.600

ip route add 99.60.0.0/16 via 99.60.0.254
ip -6 route add 1234::/16 via 1234::99.60.0.254

tail -f /dev/null
