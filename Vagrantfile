vagrant_dir = File.expand_path(File.dirname(__FILE__))

#Vagrant.require_plugin "vagrant-reload"

Vagrant.configure("2") do |config|
  config.vm.guest = :freebsd
  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
  config.vm.box = "freebsd/FreeBSD-11.0-STABLE"
  config.ssh.shell = "sh"
  #config.ssh.forward_agent = true
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

  if File.exists?(File.join(vagrant_dir,'provision','system.sh')) then
    config.vm.provision "system", type: "shell", path: File.join( "provision", "system.sh" )
  end
    
  config.vm.provision :reload
  
end
