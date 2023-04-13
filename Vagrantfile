$scripta = <<-PROVSCRIPTA
  docker ps
  ip addr
PROVSCRIPTA

$scriptj = <<-PROVSCRIPTJ
# Java + Maven + Git
  sudo apt update
  sudo apt install openjdk-11-jdk -y
  sudo apt install ca-certificates -y
  sudo apt install maven git wget unzip -y

# Jenkins
echo deb [allow-insecure=yes] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins --allow-unauthenticated -y

# Ansible
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

docker ps
ip addr
PROVSCRIPTJ

Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.boot_timeout = 900

  config.vm.define "dz4_jenkins" do |build|
    build.vm.box = "geerlingguy/ubuntu1804"
    build.vm.hostname = "jenkins"
    build.vm.network "public_network", type: "dhcp"
    build.vm.network "private_network", ip: "192.168.33.51", virtualbox__intnet: true
    build.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.name = "dz4_jenkins"
      vb.cpus = "1"
      vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
      vb.customize ["modifyvm"     , :id, "--vram","64"]
      vb.customize ["modifyvm"     , :id, "--graphicscontroller","vmsvga"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
    build.vm.provision "shell", inline: $scriptj, privileged: false
  end

  config.vm.define "dz4_app" do |vproapp|
    vproapp.vm.box = "gusztavvargadr/docker-linux"
    vproapp.vm.hostname = "app"
    vproapp.vm.network "public_network", type: "dhcp"
    vproapp.vm.network "private_network", ip: "192.168.33.54", virtualbox__intnet: true
    vproapp.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = "1"
      vb.name = "dz4_app"
      vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
      vb.customize ["modifyvm"     , :id, "--vram","64"]
      vb.customize ["modifyvm"     , :id, "--graphicscontroller","vmsvga"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	end
	
    vproapp.vm.provision "shell", run: "always", inline: $scripta, privileged: false
  end

end