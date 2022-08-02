Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.boot_timeout = 900

  config.vm.define "dz_acm" do |build|
	build.vm.box = "geerlingguy/ubuntu1804"
    build.vm.hostname = "acm"
	build.vm.network "private_network", ip: "192.168.3.70"
	build.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
		vb.name = "dz_acm"
		vb.cpus = "1"
	end
	build.vm.provision "shell", path: "userdata/acm-setup.sh"
  end

  config.vm.define "dz_vproapp" do |vproapp|
    vproapp.vm.box = "geerlingguy/ubuntu1804"
	vproapp.vm.hostname = "vproapp"
    vproapp.vm.network "private_network", ip: "192.168.3.72"
	vproapp.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
	 vb.cpus = "1"
     vb.name = "dz_vproapp"
	end
	vproapp.vm.provision "shell", path: "userdata/base-setup.sh"
  end

end
