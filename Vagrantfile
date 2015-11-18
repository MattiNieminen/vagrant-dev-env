Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "192.168.160.4"

  # Init
  config.vm.provision "shell", path: "os/init.sh"

  # MongoDB
  config.vm.network "forwarded_port", guest: 27017, host: 27017
  config.vm.provision "shell", path: "os/mongodb.sh"

  # PostgreSQL
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  config.vm.provision "shell", path: "os/postgres.sh"
end
