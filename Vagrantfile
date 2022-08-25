Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true 
  config.hostmanager.manage_host = true
  config.vm.boot_timeout = 900

  config.vm.define "jenkins" do |build|
	build.vm.box = "geerlingguy/ubuntu2004"
    build.vm.hostname = "jenkins"
	build.vm.network "private_network", ip: "192.168.3.90"
	build.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
		vb.name = "dev_jenkins"
		vb.cpus = "1"
	end
  end

  config.vm.define "nexus" do |nexus|
    nexus.vm.box = "geerlingguy/centos7"
	nexus.vm.hostname = "nexus"
    nexus.vm.network "private_network", ip: "192.168.3.91"
	nexus.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
	 vb.cpus = "2"
     vb.name = "dev_nexus"
	end
  end

  config.vm.define "sonarqube" do |sq|
	sq.vm.box = "geerlingguy/ubuntu2004"
    sq.vm.hostname = "sonarqube"
	sq.vm.network "private_network", ip: "192.168.3.92"
	sq.vm.provider "virtualbox" do |vb|
		vb.memory = "4096"
		vb.name = "dev_sonarqube"
		vb.cpus = "2"
	end
  end

  config.vm.define "backend" do |backend|
	backend.vm.box = "geerlingguy/centos7"
    backend.vm.hostname = "vprobackend"
	backend.vm.network "private_network", ip: "192.168.3.93"
	backend.vm.provider "virtualbox" do |vb|
		vb.memory = "1024"
		vb.name = "dev_vprobackend"
		vb.cpus = "1"
	end
	backend.vm.provision "shell", path: "userdata/backend-stack.sh"
  end

  config.vm.define "ctfrontend" do |ctfrontend|
    ctfrontend.vm.box = "geerlingguy/centos7"
	ctfrontend.vm.hostname = "ctfrontend"
    ctfrontend.vm.network "private_network", ip: "192.168.3.95"
	ctfrontend.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
	 vb.cpus = "1"
     vb.name = "ctfrontend"
	end
  end

  config.vm.define "cpfrontend" do |cpfrontend|
    cpfrontend.vm.box = "geerlingguy/centos7"
	cpfrontend.vm.hostname = "cpfrontend"
    cpfrontend.vm.network "private_network", ip: "192.168.3.97"
	cpfrontend.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
	 vb.cpus = "1"
     vb.name = "cpfrontend"
	end
  end

end
