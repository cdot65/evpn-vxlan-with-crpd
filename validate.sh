#!/bin/bash

SECONDS=0

while true; do
  docker exec p1 cli show ospf neigh | grep Full | wc -l | grep ^3$ >/dev/null && break
  echo "$SECONDS: waiting for all ospf neighbors in state Full ..."
  sleep 5
done
docker exec p1 cli show ospf neigh

echo "testing IPv4 ce - ce connectivity via vxlan ..."
echo ""

for destip in 99.60.0.2 99.60.0.3 99.60.1.1 99.60.1.2 99.60.1.3; do
  while true; do
    docker exec -ti ce1 ping -c 3 $destip && break
    echo "$SECONDS: waiting to reach $destip ..."
    sleep 1
  done
done

echo "testing IPv6 ce - ce connectivity via vxlan ..."
echo ""

for destip in 1234::99.60.0.2 1234::99.60.0.3 1234::99.60.1.1 1234::99.60.1.2 1234::99.60.1.3; do
  while true; do
    docker exec -ti ce1 ping6 -c 3 $destip && break
    echo "$SECONDS: waiting to reach $destip ..."
    sleep 1
  done
done

for pe in pe1 pe2 pe3; do
  echo ""
  echo $pe: cli show evpn instance extensive
  docker exec -ti $pe cli show evpn instance extensive
done

echo ""
echo p1: cli show bgp summary
docker exec -ti p1 cli show bgp summary

echo ""
echo "success in $SECONDS seconds"
