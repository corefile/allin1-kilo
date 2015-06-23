# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
BOX_NAME = 'corefile/allin1-kilo'
BOX_IN = '192.168.50.21'
BOX_EX = '192.168.111.11'
HOSTNAME = 'allin1'
DOMAIN   = 'openstackclass.dev'
Vagrant.require_version '>= 1.7.0'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

#config.vm.synced_folder "./", "/vagrant", id: "vagrant-root",
#    owner: "vagrant",
#    group: "nobody",
#    mount_options: ["dmode=777,fmode=755"]

config.vm.box = BOX_NAME
config.vm.define "allin1-Kilo"
config.vm.network "private_network", ip: BOX_IN
config.vm.network "private_network", ip: BOX_EX, virtualbox__intnet: "mylocalnet"
config.vm.host_name = HOSTNAME + '.' + DOMAIN
config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio"]
    vb.customize ["modifyvm", :id, "--nictype3", "virtio"]
    vb.customize ["modifyvm", :id, "--nicpromisc2", "allow-all"]
    vb.customize ["modifyvm", :id, "--nicpromisc3", "allow-all"] 
 end

end
