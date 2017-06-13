#!/bin/bash

MYSQL_PASSWORD=Admin123#

dnf -y install community-mysql-server
systemctl start mysql.service
mysqladmin -u root password $MYSQL_PASSWORD
mysql -u root --password=$MYSQL_PASSWORD -e"set global max_allowed_packet=21000000"

systemctl start mysql.service


#dnf install -y otrs-5.0.19-02.noarch.rpm
dnf install -y http://ftp.otrs.org/pub/otrs/RPMS/fedora/22/otrs-5.0.19-02.noarch.rpm
systemctl start httpd.service
