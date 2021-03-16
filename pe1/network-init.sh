#!/bin/bash

set -e

echo "setting loopback ip addresses ..."
ip addr add 81.1.1.1/32 dev lo

until ip link show eth2 up; do
  echo "waiting for eth2 up ..."
  sleep 1
done

# fabric link
ip addr add 81.1.5.1/24 dev eth0
ip -6 addr add ::ffff:81.1.5.1/120 dev eth0

# ce interface
ip link add link eth1 name eth1.600 type vlan id 600
ip link set eth1.600 up
ip link add link eth2 name eth2.601 type vlan id 601
ip link set eth2.601 up
