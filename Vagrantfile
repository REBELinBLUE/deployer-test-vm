Vagrant.require_version ">= 1.5.0"

Vagrant.configure(2) do |config|

    config.vm.define "web" do |web|
        web.vm.box = "debian/stretch64"
        web.vm.network :private_network, ip: "192.168.33.50", hostsupdater: "skip"
        web.vm.hostname = "web"

        # web.vm.provision "file", source: "~/.composer/auth.json", destination: "~/auth.json"
        web.vm.provision "shell", inline: "/vagrant/setup-web.sh"
        web.vm.provision "shell", inline: "/vagrant/clear.sh", run: "always"
        web.vm.provision "shell", inline: "sudo composer self-update", run: "always"

        web.vm.provider :virtualbox do |vb|
            vb.name = "debian-web"
            vb.customize ["modifyvm", :id, "--memory", 1024]
            vb.customize ["modifyvm", :id, "--cpus", 1]
            vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            vb.customize ["modifyvm", :id, "--ostype", "Debian_64"]
            vb.customize ["modifyvm", :id, "--groups", "/Debian 9"]
        end
    end

    config.vm.define "cron" do |cron|
        cron.vm.box = "debian/stretch64"
        cron.vm.network :private_network, ip: "192.168.33.60", hostsupdater: "skip"
        cron.vm.hostname = "cron"

        # cron.vm.provision "file", source: "~/.composer/auth.json", destination: "~/auth.json"
        cron.vm.provision "shell", inline: "/vagrant/setup-web.sh"
        cron.vm.provision "shell", inline: "/vagrant/clear.sh", run: "always"
        cron.vm.provision "shell", inline: "sudo composer self-update", run: "always"

        cron.vm.provider :virtualbox do |vb|
            vb.name = "debian-cron"
            vb.customize ["modifyvm", :id, "--memory", 1024]
            vb.customize ["modifyvm", :id, "--cpus", 1]
            vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            vb.customize ["modifyvm", :id, "--ostype", "Debian_64"]
            vb.customize ["modifyvm", :id, "--groups", "/Debian 9"]
        end
    end

    config.vm.define "db" do |db|
        db.vm.box = "debian/jessie64"
        db.vm.network :private_network, ip: "192.168.33.70", hostsupdater: "skip"
        db.vm.hostname = "db"

        db.vm.provision "shell", inline: "/vagrant/setup-db.sh"

        db.vm.provider :virtualbox do |vb|
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
