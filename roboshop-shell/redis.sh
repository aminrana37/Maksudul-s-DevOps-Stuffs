source common.sh
component=redis
service=redis
version=7
find=127.0.0.1
replace=0.0.0.0

print_task Setting up redis
service_setup

print_task Updating listening address
find_and_replace

print_task Updating protected-mode
sed -i -e 's|protected-mode yes|protected-mode no|' /etc/redis.conf

print_task Start & Enable Redis Service
enable_and_restart_component