#!/bin/bash

set -e

until ip link show eth0 up; do
  echo "waiting for eth0 up ..."
  sleep 1
done

ip link set eth0 address 00:55:55:55:60:10

ip link add link eth0 name eth0.601 type vlan id 601
ip link set eth0.601 up

ip addr add 99.60.1.2/24 dev eth0.601
ip -6 addr add 1234::99.60.1.2/120 dev eth0.601

ip route add 99.60.0.0/16 via 99.60.1.254
ip -6 route add 1234::/16 via 1234::99.60.1.254

tail -f /dev/null
