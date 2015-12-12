Vagrant.configure("2") do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  config.vm.hostname = "gitlab.box"
  config.vm.network :private_network, ip: "172.16.16.17"

  if Vagrant.has_plugin?("vagrant-hostmanager")
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
    config.hostmanager.aliases = %w(mattermost.box)
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.enable :yum
  end
  
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end
  
  config.vm.provision :shell do |shell|
    shell.inline = "puppet module install puppetlabs/firewall --force \
                --target-dir /tmp/vagrant-puppet/environments/vagrant/modules/
                    puppet module install puppetlabs/stdlib --force \
                 --target-dir /tmp/vagrant-puppet/environments/vagrant/modules/"
  end
  
  config.vm.provision "puppet" do |puppet|
    puppet.environment_path = "puppet/environments"
    puppet.environment = "vagrant"
    puppet.hiera_config_path = "puppet/environments/vagrant/hiera.yaml"
  end

end
