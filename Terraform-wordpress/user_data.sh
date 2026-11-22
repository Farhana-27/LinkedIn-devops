#!/bin/bash
# WordPress install script, run by cloud-init on first boot
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive

# Install Apache, MySQL, PHP and the PHP extensions WordPress needs
apt-get update -y
apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql \
  php-curl php-gd php-mbstring php-xml php-zip php-intl

systemctl enable --now apache2
systemctl enable --now mysql

# Create the WordPress database and user
mysql -e "CREATE DATABASE IF NOT EXISTS ${db_name};"
mysql -e "CREATE USER IF NOT EXISTS '${db_user}'@'localhost' IDENTIFIED BY '${db_password}';"
mysql -e "GRANT ALL PRIVILEGES ON ${db_name}.* TO '${db_user}'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Download WordPress and put it in Apache's web root
cd /tmp
curl -sO https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
rm -f /var/www/html/index.html
cp -r wordpress/* /var/www/html/

# Configure WordPress to connect to the database
cd /var/www/html
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/${db_name}/" wp-config.php
sed -i "s/username_here/${db_user}/" wp-config.php
sed -i "s/password_here/${db_password}/" wp-config.php

# Give Apache ownership of the WordPress files, then restart it
chown -R www-data:www-data /var/www/html
systemctl restart apache2

