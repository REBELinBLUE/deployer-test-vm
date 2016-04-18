Vagrant.require_version ">= 1.5.0"

Vagrant.configure(2) do |config|

    config.vm.define "web" do |web|
        web.vm.box = "debian/jessie64"
        web.vm.network :private_network, ip: "192.168.33.50"
        web.vm.hostname = "web"
        web.vm.box_check_update = false

        if Vagrant.has_plugin?("vagrant-cachier")
            web.cache.scope = :box
            web.cache.enable :apt
            web.cache.enable :composer

            web.cache.synced_folder_opts = {
                type: :nfs,
                mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
            }
        end

        web.vm.provision "file", source: "~/.composer/auth.json", destination: "~/auth.json"
        web.vm.provision "shell", inline: "/vagrant/setup-web.sh"
        web.vm.provision "shell", inline: "/vagrant/clear.sh", run: "always"
        web.vm.provision "shell", inline: "sudo composer self-update", run: "always"

        web.vm.provider "virtualbox" do |vb|
            vb.name = "debian-web"
            vb.customize ["modifyvm", :id, "--memory", 1024]
            vb.customize ["modifyvm", :id, "--cpus", 1]
            vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            vb.customize ["modifyvm", :id, "--ostype", "Debian_64"]
            vb.customize ["modifyvm", :id, "--groups", "/Debian 8"]
        end
    end

    config.vm.define "cron" do |cron|
        cron.vm.box = "debian/jessie64"
        cron.vm.network :private_network, ip: "192.168.33.60"
        cron.vm.hostname = "cron"
        cron.vm.box_check_update = false

        if Vagrant.has_plugin?("vagrant-cachier")
            cron.cache.scope = :box
            cron.cache.enable :apt
            cron.cache.enable :composer

            cron.cache.synced_folder_opts = {
                type: :nfs,
                mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
            }
        end

        cron.vm.provision "file", source: "~/.composer/auth.json", destination: "~/auth.json"
        cron.vm.provision "shell", inline: "/vagrant/setup-web.sh"
        cron.vm.provision "shell", inline: "/vagrant/clear.sh", run: "always"
        cron.vm.provision "shell", inline: "sudo composer self-update", run: "always"

        cron.vm.provider "virtualbox" do |vb|
            vb.name = "debian-cron"
            vb.customize ["modifyvm", :id, "--memory", 1024]
            vb.customize ["modifyvm", :id, "--cpus", 1]
            vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            vb.customize ["modifyvm", :id, "--ostype", "Debian_64"]
            vb.customize ["modifyvm", :id, "--groups", "/Debian 8"]
        end
    end

    config.vm.define "db" do |db|
        db.vm.box = "debian/jessie64"
        db.vm.network :private_network, ip: "192.168.33.70"
        db.vm.hostname = "db"
        db.vm.box_check_update = false

        if Vagrant.has_plugin?("vagrant-cachier")
            db.cache.scope = :box
            db.cache.enable :apt
            db.cache.enable :composer

            db.cache.synced_folder_opts = {
                type: :nfs,
                mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
            }
        end

        db.vm.provision "shell", inline: "/vagrant/setup-db.sh"

        db.vm.provider "virtualbox" do |vb|
            vb.name = "debian-db"
            vb.customize ["modifyvm", :id, "--memory", 1024]
            vb.customize ["modifyvm", :id, "--cpus", 1]
            vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            vb.customize ["modifyvm", :id, "--ostype", "Debian_64"]
            vb.customize ["modifyvm", :id, "--groups", "/Debian 8"]
        end
    end
end
