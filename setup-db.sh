#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

wget https://www.dotdeb.org/dotdeb.gpg
apt-get update -y
apt-get install -y software-properties-common
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
apt-key add dotdeb.gpg
add-apt-repository 'deb http://packages.dotdeb.org jessie all'
add-apt-repository 'deb [arch=amd64,i386] http://lon1.mirrors.digitalocean.com/mariadb/repo/10.1/debian jessie main'
add-apt-repository ppa:git-core/ppa -y
apt-get update -y

apt-get autoremove -y

rm dotdeb.gpg

debconf-set-selections <<< 'mariadb-server-10.1 mysql-server/root_password password root'
debconf-set-selections <<< 'mariadb-server-10.1 mysql-server/root_password_again password root'

apt-get install -y mariadb-server

apt-get upgrade -y
apt-get install -y git curl

useradd -m -d /home/deploy -s /bin/bash deploy

mkdir -p /home/deploy/.composer
mkdir -p /home/deploy/.ssh

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCasyO1qNW+Z331PzHBQ2sgVuvNKZnpUIzz2F+bhS31q2/b2AaXYcU8ljtW2yVcMlUvrvDkRQyynLza2QBfsXTeJpqtKxujqcLXpRN9t81OLjhKebRP/lExq9I6c4xEnwFBx/OqB7ighDNUZc6zRi80V1K3iloGn12ywpL7vI/+EO+ABXP4sTchwh47bppcBNy4HjOre+NqpLNZkZ02E4lngSaOCY6r36TdICaigeQX6n/Xgwm2rRkr0qNIZsd/IoyLYS6/CWUUJjX16qxXt1wwMiwwpRbZ2IULnZ0lI74QXjucD+Ow0OKwWwgLsN55VUGXVOlpX1GJ2p5mZ3H6YX0B deploy@deployer" > /home/deploy/.ssh/authorized_keys

chown -R deploy:deploy /home/deploy
