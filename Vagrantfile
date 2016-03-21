# -*- mode: ruby -*-
# vi: set ft=ruby :


# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
    config.vm.provider       "hyperv"
    config.vm.box          = "seb!/w10-4devs"
    config.vm.box_url      = "file://z:/Vagrant/w10-4devs/hyperv.box"
    config.vm.hostname     = "#{ENV['COMPUTERNAME']}-VAGRANT"
    config.vm.communicator = "winrm"
    config.winrm.username  = "vagrant"
    config.winrm.password  = "vagrant"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "hyperv" do |vb|

      vb.vmname = "#{ENV['COMPUTERNAME']}-VAGRANT"

      # Number of virtual CPU given to mashine.
      # Defaults is taken from box image XML.
      vb.cpus = [1, ENV['NUMBER_OF_PROCESSORS'].to_i - 1 ].max

  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"

      # Number of MegaBytes maximal allowed to allocate for VM
      # This parameter is switch on Dynamic Allocation of memory.
      # Defaults is taken from box image XML.
      vb.maxmemory = 8192
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

  config.vm.provision 'shell', name: 'generic: chocolatey provisioner',
      run: 'up', powershell_args: '-ExecutionPolicy ByPass',
      inline: "iex ((new-object net.webclient)" +
              ".DownloadString('https://chocolatey.org/install.ps1'))"

  config.vm.provision 'shell', name: 'generic: chocolatey packages',
      run: 'up', powershell_args: '-ExecutionPolicy ByPass',
      inline: 'cinst -y C:\vagrant\provision\generic\choco.config'

  config.vm.define 'vs2015', autostart: true, primary: true do | main |

      main.vm.provision 'shell', name: 'vs2015: chocolatey packages',
          run: 'up', powershell_args: '-ExecutionPolicy ByPass',
          inline: 'cinst -y C:\vagrant\provision\vs2015\choco.config'

  end

end
