#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

wget https://www.dotdeb.org/dotdeb.gpg
apt-get update -y
apt-get install -y software-properties-common
apt-key add dotdeb.gpg
add-apt-repository ppa:git-core/ppa -y
apt-get update -y

rm dotdeb.gpg

mkdir /var/www
apt-get upgrade -y
apt-get install -y --allow-unauthenticated git curl unzip zip php-readline php-cli php-memcache php-zip php-mbstring php-curl php-mysqlnd php-gd php-fpm nginx-full memcached redis-server

apt-get install -y build-essential
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs

curl -sS https://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar /usr/local/bin/composer
useradd -m -d /home/deploy -s /bin/bash deploy
chown deploy:deploy /var/www

apt-get autoremove -y
apt-get upgrade -y
rm -rf /var/www/*

mkdir -p /home/deploy/.ssh
mkdir -p /home/deploy/.composer

mv /home/vagrant/auth.json /home/deploy/.composer/auth.json

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCasyO1qNW+Z331PzHBQ2sgVuvNKZnpUIzz2F+bhS31q2/b2AaXYcU8ljtW2yVcMlUvrvDkRQyynLza2QBfsXTeJpqtKxujqcLXpRN9t81OLjhKebRP/lExq9I6c4xEnwFBx/OqB7ighDNUZc6zRi80V1K3iloGn12ywpL7vI/+EO+ABXP4sTchwh47bppcBNy4HjOre+NqpLNZkZ02E4lngSaOCY6r36TdICaigeQX6n/Xgwm2rRkr0qNIZsd/IoyLYS6/CWUUJjX16qxXt1wwMiwwpRbZ2IULnZ0lI74QXjucD+Ow0OKwWwgLsN55VUGXVOlpX1GJ2p5mZ3H6YX0B deploy@deployer" > /home/deploy/.ssh/authorized_keys

chown -R deploy:deploy /home/deploy

echo '' >> /home/vagrant/.profile
echo 'cd /var/www' >> /home/vagrant/.profile
