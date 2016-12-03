vagrant_dir = File.expand_path(File.dirname(__FILE__))

#Vagrant.require_plugin "vagrant-reload"

Vagrant.configure("2") do |config|
  config.vm.guest = :freebsd

  config.vm.box = "freebsd/FreeBSD-11.0-STABLE"
  config.ssh.shell = "sh"
  config.vm.base_mac = "080027D14C66"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
    vb.customize ["modifyvm", :id, "--audio", "none"]
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio"]

    vvv_pwd = Dir.pwd
    vb.name = File.basename(vvv_pwd)
  end
  
  config.vm.network :private_network, id: "vvv_primary", ip: "192.168.91.91"
  config.vm.synced_folder ".", "/vagrant", :nfs => true, id: "vagrant-root"

  config.vm.provision "system", type: "shell", path: File.join( "provision", "pre-setup.sh" )
  
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "vv"
    ansible.playbook = "provision/system.yml"
    #ansible.ask_vault_pass = true
    ansible.host_key_checking = false
    ansible.inventory_path = 'provision/inventory'
  end
    
  #config.vm.provision :reload
  
end
