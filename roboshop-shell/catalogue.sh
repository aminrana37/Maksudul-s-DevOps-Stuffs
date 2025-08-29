source common.sh
component=catalogue
componentrepo=mongo
service=nodejs
version=20

component_and_service_setup

print_task Copying mongodb repo file
copy_repo_file

print_task Installing mongodb
dnf install mongodb-mongosh -y

print_task Loading Master Data
mongosh --host mongodb.maksuduldevsecops.online </app/db/master-data.js