source common.sh
component=nginx
service=nginx
version=1.24

print_task Setting up nginx
service_setup
enable_and_restart_service

print_task Configure Frontend Content
configure_frontend_content

print_task Copying nginx config file
cp nginx.conf /etc/nginx/nginx.conf

print_task Restarting nginx
restart_component
