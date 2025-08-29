source common.sh
component=mongodb-org
service=mongod
componentrepo=mongo
find=127.0.0.1
replace=0.0.0.0

print_task Copying mongodb repo file
copy_repo_file

print_task Installing and starting mongodb
install_enable_restart_mongodb

print_task Updating listen address
find_and_replace

print_task Restarting mongodb
restart_component
