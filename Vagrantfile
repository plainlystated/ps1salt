# -*- mode: ruby -*-
# vi: set ft=ruby :

# make sure you have the Oracle VM VirtualBox Extension Pack install in 
# addition to virtualbox

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "arch" do |arch|
      arch.vm.box = "archlinux-x86_64"
      arch.vm.box_url = "http://cloud.terry.im/vagrant/archlinux-x86_64.box"
      arch.vm.hostname = "arch"
  end

  config.vm.define "dc", :autostart => false do |dc|
     dc.vm.box = "archlinux-x86_64"
     dc.vm.box_url = "http://cloud.terry.im/vagrant/archlinux-x86_64.box"
     dc.vm.hostname = "dc"
     dc.vm.provision :salt do |salt|
         salt.minion_config = "vagrant/minion-ad"
         salt.run_highstate = true
     end
  end

  # work-around for issue with salt bootstrap
  config.vm.provision :shell, :inline => "pacman --noconfirm -S community/lsb-release"

  config.vm.synced_folder ".", "/srv/salt/"

  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  config.vm.provision :salt do |salt|
      salt.minion_config = "vagrant/minion"
      salt.run_highstate = true
  end
end
