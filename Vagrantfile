# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define :ansibleserver do |ansibleserver|
    ansibleserver.vm.box = "precise32"
    ansibleserver.vm.hostname = "ansibleserver"
    ansibleserver.vm.network :private_network, ip: "192.168.250.2"
    ansibleserver.vm.provision :shell,
    :inline => 'grep -qs 192.168.250.3 /etc/hosts || echo "192.168.250.3 ansibleclient" >> /etc/hosts'
    ansibleserver.vm.provision :shell, path: "installansible.sh"
    ansibleserver.vm.provider "virtualbox" do |v|
        v.memory = 512
        v.cpus = 2
        v.gui = true
    end
  end


  config.vm.define :ansibleclient do |ansibleclient|
    ansibleclient.vm.box = "precise32"
    ansibleclient.vm.hostname = "ansibleclient"
    ansibleclient.vm.network :private_network, ip: "192.168.250.3"
    ansibleclient.vm.network "forwarded_port", guest: 8080, host: 8080
    ansibleclient.vm.provision :shell,
    :inline => 'grep -qs 192.168.250.2 /etc/hosts || echo "192.168.250.2 ansbileserver " >> /etc/hosts'
    ansibleclient.vm.provision :shell, path: "prepareclient.sh"
    ansibleclient.vm.provider "virtualbox" do |v|
        v.memory = 512
        v.cpus = 2
    end
  end

end
