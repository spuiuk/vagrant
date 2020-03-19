#Fix networking for 192.168.145.0/24 network
yum install -y net-tools python2
echo DEFROUTE=no >> /etc/sysconfig/network-scripts/ifcfg-eth0;
echo GATEWAY=192.168.145.1 >> /etc/sysconfig/network-scripts/ifcfg-eth1;
route del default; route add default gw 192.168.145.1

