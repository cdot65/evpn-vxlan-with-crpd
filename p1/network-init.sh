#!/bin/bash

set -e

echo "setting loopback ip addresses ..."
ip addr add 81.4.4.4/32 dev lo

until ip link show eth2 up; do
  echo "waiting for eth2 up ..."
  sleep 1
done

ip addr add 81.1.5.5/24 dev eth0
ip addr add 81.2.5.5/24 dev eth1
ip addr add 81.3.5.5/24 dev eth2
