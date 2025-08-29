source common.sh
component=payment
service=payment

print_task Installing Python 3
dnf install python3 gcc python3-devel -y

print_task Configuring the application
configure_conponent_payment

print_task Setting up SystemD Payment Service
daemon_reload_and_restart_component

