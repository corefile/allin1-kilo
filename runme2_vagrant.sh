#!/usr/bin/env bash
set -e

source ./keystonerc_user1

if [ ! -f id_rsa_demo.pub ]; then ssh-keygen -t rsa -b 2048 -N '' -f id_rsa_demo; fi
nova keypair-add --pub-key  id_rsa_demo.pub  demo_key

neutron router-create rtr1
neutron router-gateway-set rtr1 ext

nova secgroup-create sec1 "sec1"
nova secgroup-add-rule sec1 icmp -1 -1 0.0.0.0/0
for x in tcp udp; do nova secgroup-add-rule sec1 ${x} 1 65535 0.0.0.0/0 ; done

neutron  net-create int
neutron  subnet-create --gateway=2.0.0.254 --name=subint int 2.0.0.0/24 --enable-dhcp --dns-nameserver=8.8.8.8
neutron	 router-interface-add rtr1 subint

neutron  net-create intTwo
neutron  subnet-create --gateway=3.0.0.254 --name=subintTwo intTwo 3.0.0.0/24 --enable-dhcp --dns-nameserver=8.8.8.8
neutron	 router-interface-add rtr1 subintTwo

# Tenant vm in subnet[One]
nova boot --poll --flavor m1.nano --image $(nova image-list | grep 'cirros\s' | awk '{print $2}') --nic net-id=$(neutron net-list | grep -w int | awk '{print $2}') --security-groups sec1 --key-name demo_key vm1

# Tenant vm in subnetTwo
nova boot --poll --flavor m1.nano --image $(nova image-list | grep 'cirros\s' | awk '{print $2}') --nic net-id=$(neutron net-list | grep -w intTwo | awk '{print $2}') --security-groups sec1 --key-name demo_key vm2


# Assign floating ips to all tenant vms
neutron floatingip-create ext
nova add-floating-ip vm1 192.168.111.22

neutron floatingip-create ext
nova add-floating-ip vm2 192.168.111.23
