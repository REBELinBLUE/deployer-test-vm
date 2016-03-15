#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

wget https://www.dotdeb.org/dotdeb.gpg
apt-get update -y
apt-get install -y software-properties-common
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
apt-key add dotdeb.gpg
add-apt-repository 'deb http://packages.dotdeb.org jessie all'
apt-get update -y

rm dotdeb.gpg

mkdir /var/www
apt-get upgrade -y
apt-get install -y git curl php5-cli php5-memcache php5-curl php5-gd php5-mcrypt php5-fpm nginx-full

apt-get autoremove -y

curl -sS https://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar /usr/local/bin/composer
useradd -m -d /home/deploy -s /bin/bash deploy
chown deploy:deploy /var/www

apt-get upgrade -y
rm -rf /var/www/*

mkdir -p /home/deploy/.ssh

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCasyO1qNW+Z331PzHBQ2sgVuvNKZnpUIzz2F+bhS31q2/b2AaXYcU8ljtW2yVcMlUvrvDkRQyynLza2QBfsXTeJpqtKxujqcLXpRN9t81OLjhKebRP/lExq9I6c4xEnwFBx/OqB7ighDNUZc6zRi80V1K3iloGn12ywpL7vI/+EO+ABXP4sTchwh47bppcBNy4HjOre+NqpLNZkZ02E4lngSaOCY6r36TdICaigeQX6n/Xgwm2rRkr0qNIZsd/IoyLYS6/CWUUJjX16qxXt1wwMiwwpRbZ2IULnZ0lI74QXjucD+Ow0OKwWwgLsN55VUGXVOlpX1GJ2p5mZ3H6YX0B deploy@deployer" > /home/deploy/.ssh/authorized_keys

chown -R deploy:deploy /home/deploy
