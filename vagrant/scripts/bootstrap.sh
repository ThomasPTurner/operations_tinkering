#!/bin/bash

# add salt master to hosts
echo "10.20.30.40 salt" >> /etc/hosts

# Install salt
curl -o bootstrap-salt.sh -L https://bootstrap.saltproject.io && sudo sh bootstrap-salt.sh -P stable 3003.3

# configure salt-minion
echo "master: salt" > /etc/salt/minion
service salt-minion start
