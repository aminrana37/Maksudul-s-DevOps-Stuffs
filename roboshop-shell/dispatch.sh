source common.sh
component=dispatch

print_task Installing GoLang
dnf install golang -y

print_task Configuring the application
configure_conponent_dispatch

print_task Setting up SystemD Payment Service
daemon_reload_and_restart_component