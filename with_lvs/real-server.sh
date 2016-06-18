#!/bin/bash
# for bind vip

VIP=192.168.0.88

. /etc/rc.d/init.d/functions

case "$1" in
start)
    ifconfig lo:1 $VIP netmask 255.255.255.255 broadcast $VIP
    /sbin/route add -host $VPI dev lo:1
    echo 1 > /proc/sys/net/ipv4/conf/lo/arp_ignore
    echo 2 > /proc/sys/net/ipv4/conf/lo/arp_announce
    echo 1 > /proc/sys/net/ipv4/conf/all/arp_ignore
    echo 2 > /proc/sys/net/ipv4/conf/all/arp_announce
    sysctl -p > /dev/null 2>&1
    echo "RealServer Start OK"
    ;;
stop)
    ifconfig lo:1 down
    route del $VIP > /dev/null 2>&1
    echo 0 > /proc/sys/net/ipv4/conf/lo/arp_ignore
    echo 0 > /proc/sys/net/ipv4/conf/lo/arp_announce
    echo 0 > /proc/sys/net/ipv4/conf/all/arp_ignore
    echo 0 > /proc/sys/net/ipv4/conf/all/arp_announce
    echo "RealServer Stoped"
    ;; 
*)
    echo "Usage: $0 {start|stop}"
    exit 1
esac
exit 0
