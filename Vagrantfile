# -*- mode: ruby -*-
# vi: set ft=ruby :

# make sure you have the Oracle VM VirtualBox Extension Pack install in 
# addition to virtualbox

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "archlinux-x86_64"
  config.vm.box_url = "http://cloud.terry.im/vagrant/archlinux-x86_64.box"
  config.vm.synced_folder ".", "/srv/salt/"
  config.vm.hostname = "saltedvagrant"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  config.vm.provision :salt do |salt|
      salt.minion_config = "vagrant/minion"
      salt.run_highstate = true
  end

end
