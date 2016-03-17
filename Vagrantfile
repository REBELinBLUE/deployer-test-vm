Vagrant.require_version ">= 1.5.0"

Vagrant.configure(2) do |config|

    config.vm.define "web" do |web|
        web.vm.box = "debian/jessie64"
        web.vm.network :private_network, ip: "192.168.33.50"
        web.vm.hostname = "web"

        web.vm.provision "shell", inline: "/vagrant/setup-web.sh"
        web.vm.provision "shell", inline: "/vagrant/clear.sh", run: "always"
        web.vm.provision "file", source: "~/.composer/auth.json", destination: "~/auth.json"
        web.vm.provision "shell", inline: "sudo composer self-update", run: "always"
    end

    config.vm.define "cron" do |cron|
        cron.vm.box = "debian/jessie64"
        cron.vm.network :private_network, ip: "192.168.33.60"
        cron.vm.hostname = "cron"

        cron.vm.provision "shell", inline: "/vagrant/setup-web.sh"
        cron.vm.provision "shell", inline: "/vagrant/clear.sh", run: "always"
        cron.vm.provision "file", source: "~/.composer/auth.json", destination: "~/auth.json"
        cron.vm.provision "shell", inline: "sudo composer self-update", run: "always"
    end

    config.vm.define "db" do |db|
        db.vm.box = "debian/jessie64"
        db.vm.network :private_network, ip: "192.168.33.70"
        db.vm.hostname = "db"

        db.vm.provision "shell", inline: "/vagrant/setup-db.sh"
    end
end
