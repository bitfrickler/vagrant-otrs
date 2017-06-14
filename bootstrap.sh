#!/bin/bash

MYSQL_PASSWORD=Admin123#
MYSQL_CONF=/etc/my.cnf

dnf -y install community-mysql-server
systemctl enable mysqld.service
systemctl start mysqld.service
mysqladmin -u root password $MYSQL_PASSWORD
sed -ie 's/bind-address/#bind-address/g' $MYSQL_CONF
sed -ie '/max_allowed_packet/d' $MYSQL_CONF
sed -ie '/query_cache_size/d' $MYSQL_CONF
sed -i -r -e '/\[mysqld\]/a max_allowed_packet = 20M\nquery_cache_size = 32M\ninnodb_log_file_size = 256M' $MYSQL_CONF
systemctl restart mysqld.service

dnf install -y http://ftp.otrs.org/pub/otrs/RPMS/fedora/22/otrs-5.0.19-02.noarch.rpm

#sudo sed -ie "s/$Self->{DatabasePw} = 'some-pass';/$Self->{DatabasePw} = 'Admin123#';/g" /opt/otrs/Kernel/Config.pm

#userdel otrs
#useradd otrs &> /dev/null
#echo otrs | passwd --stdin otrs

systemctl enable httpd.service
systemctl start httpd.service
sudo su -c "/opt/otrs/bin/otrs.Daemon.pl start" -s /bin/bash apache

#mysql -u root --password=$MYSQL_PASSWORD mysql < /vagrant/prepare-db.sql