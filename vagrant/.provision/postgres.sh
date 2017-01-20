#!/usr/bin/env bash
POSTGRE_VERSION=9.5

apt-get install -y postgresql-$POSTGRE_VERSION postgresql-server-dev-$POSTGRE_VERSION postgresql-contrib build-essential python python-pip
sudo pip install --upgrade pip
sudo pip install yandex-pgmigrate

# Configure PostgreSQL

# Listen for localhost connections
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/$POSTGRE_VERSION/main/postgresql.conf

# Identify users via "md5", rather than "ident", allowing us
# to make PG users separate from system users. "md5" lets us
# simply use a password
echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /etc/postgresql/$POSTGRE_VERSION/main/pg_hba.conf
sudo service postgresql start

# Create new superuser "spark"
sudo -u postgres bash -c "psql -c \"CREATE USER spark WITH PASSWORD 'm00nshine';\""
sudo su postgres -c "createdb -E UTF8 --locale=en_US.UTF-8 -O spark arco"
sudo service postgresql restart