#!/bin/bash

echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
    | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
    sudo apt-key add -
sudo apt-get update
sudo apt-get install -y postgresql-9.4
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" \
    /etc/postgresql/9.4/main/postgresql.conf
sudo sed -i \
     's/host[[:space:]]\+all[[:space:]]\+all[[:space:]]\+127.0.0.1\/32[[:space:]]\+md5/host    all             all             0.0.0.0\/0               md5/g' \
     /etc/postgresql/9.4/main/pg_hba.conf
sudo service postgresql restart
