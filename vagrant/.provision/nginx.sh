#!/usr/bin/env bash

# nginx
sudo apt-get -y install nginx
sudo service nginx start

# set up nginx server
sudo cp /srv/website/nginx.conf /etc/nginx/sites-available/site.conf
sudo chmod 644 /etc/nginx/sites-available/site.conf
sudo ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf
sudo service nginx restart

# clean /var/www
sudo rm -Rf /var/www

echo "Done";