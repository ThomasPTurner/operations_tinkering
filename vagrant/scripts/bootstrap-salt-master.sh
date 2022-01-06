#! /bin/bash

apt-get update
apt-get install -y salt-master python-pip python3-git
cat /srv/salt/master.conf > /etc/salt/master
systemctl restart salt-master
