#! /bin/sh

openconnect -u rreckel --protocol=pulse -b vpn.vdl.lu &> /dev/null
sleep 3
ip route del default dev tun0
ip route add 10.0.0.0/8 dev tun0

