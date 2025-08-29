source common.sh
component=shipping
service=shiping

print_task Installing maven
dnf install maven -y

print_task Downloading the application code
configure_conponent_maven

print_task Setting up SystemD Shipping Service
daemon_reload_and_restart_component

print_task Installing mysql client
dnf install mysql -y

print_task Loading Schema
dnf mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/db/schema.sql

print_task Creating app user
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/db/app-user.sql

print_task Loading Master Data
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pRoboShop@1 < /app/db/master-data.sql

print_task Restarting Shipping
restart_component