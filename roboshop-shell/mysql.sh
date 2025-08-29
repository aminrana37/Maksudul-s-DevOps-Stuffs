source common.sh
service=mysqld

print_task Install MySQL Server
dnf install mysql-server -y

print_task Starting MySQL Service
enable_and_restart_component

print_task Changing the default root password
mysql_secure_installation --set-root-pass RoboShop@1