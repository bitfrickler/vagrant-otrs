vmname = "otrs-dev"
hostname = "otrs-dev"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "bento/fedora-22"
  config.vm.hostname = hostname
  config.vm.network "forwarded_port", guest: 80, host: 8000, protocol: "tcp"
  #config.vm.network :private_network, ip: "10.3.1.5"
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 1
    v.name = vmname
    v.gui = false
  end

  config.vm.provision :shell, path: "bootstrap.sh"

end