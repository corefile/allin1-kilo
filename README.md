# allin1-kilo
Repo for openstack lab

## Requirements
* Vagrant >= 1.7.0
* VirtualBox >= 4.3.20
* Vagrant Plugin : reload
* Vagrant Plugin : sahara
* Not using the following networks: 192.168.111.0/24, 192.168.50.0/24

## Installation
##### Vagrant Plugins
<pre>
 $ vagrant plugin install vagrant-reload
 $ vagrant plugin install sahara
</pre>

This lab requires two virtual boxes, a vbox acting as a router and the openstack allinone server.

Note for Windows users: In Windows, VBoxManage.exe is not in the %PATH%. 
You'll want to add VirtualBox's directory (usually something like C:\Program Files\Oracle\VirtualBox) 
into the PATH.

##### Router Node 
<pre>
 $ git clone https://github.com/corefile/router-node.git router-node
 
 $ cd router-node
 
 $ vagrant up
</pre>


##### Kilo OpenStack Node
<pre>
 $ git clone https://github.com/corefile/allin1-kilo
 $ cd allin1-kilo
 $ vagrant up
 $ vagrant ssh
</pre>
##### Run Scripts to setup Tenant -- user1, Tenant Networking, and Tenant instances
<pre>
 $ sudo su -
 # cd /root/ && cp /vagrant/runme1_root.sh && ./runme1_root.sh
 # exit 
 $ cd ~/ && cp /vagrant/{runme2_vagrant.sh,keystone_user1} . && ./runme2_vagrant.sh 
</pre>

You can access the Horizon dashboard (slow the first time you access it) at:
<pre>
http://192.168.50.21/dashboard/
</pre>
login: user1
pass: user1 
