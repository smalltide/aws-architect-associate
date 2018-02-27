#!/bin/bash
yum update -y
yum install httpd php php-mysql stress -y
cd /etc/httpd/conf
cp httpd.conf httpdconfbackup.conf
rm -rf httpd.conf
wget https://s3-eu-west-1.amazonaws.com/acloudguru-wp/httpd.conf
cd /var/www/html
echo "healthy" > healthy.html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf wordpress
rm -rf latest.tar.gz
chmod -R 755 wp-content
chown -R apache:apache wp-content
service httpd start
chkconfig httpd on