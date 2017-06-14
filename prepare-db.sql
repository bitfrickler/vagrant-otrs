create database otrs;

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'Admin123#';
GRANT ALL PRIVILEGES ON *.* TO 'otrs'@'%' IDENTIFIED BY 'Admin123#';
flush privileges;

-- set password for admin user to Admin123#
UPDATE otrs.users SET pw = '3319767b84a08dffb6af200f0b3e3361e09eb2a665837a7c8d63ef42841975c9' WHERE login='root@localhost';
