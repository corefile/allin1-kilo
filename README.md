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

Note for Windows users: In Windows, VBoxManage.exe may not be in the %PATH%. If not 
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
</pre>

This is a good time to take a snapshot of your OpenStack Node so you can return to a known working state

<pre>
 $ vagrant sandbox on
</pre>

If you mess somethign up and want to get back to the orginal box state just run "vagrant sandbox rollback"

##### Run Scripts to setup Tenant -- user1, Tenant Networking, and Tenant instances
<pre>
 $ vagrant ssh
 $ sudo su -
 # cd /root/ && cp /vagrant/runme1_root.sh && ./runme1_root.sh
 # exit 
 $ cd ~/ && cp /vagrant/{runme2_vagrant.sh,keystone_user1} . && ./runme2_vagrant.sh 
</pre>

If you are satisfied that your openstack box configured, you can update your snapshot to this point

<pre>
 $ vagrant sandbox commit
</pre>

You can access the Horizon dashboard (slow the first time you access it) at:
<pre>
http://192.168.50.21/dashboard/
</pre>
login: user1
pass: user1 