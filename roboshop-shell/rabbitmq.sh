source common.sh
component=rabbitmq-server
service=rabbitmq-server
componentrepo=rabbitmq

print_task Copying mongodb repo file
copy_repo_file


print_task Installing RabbitMQ
dnf install rabbitmq-server -y

print_task Starting RabbitMQ Service
enable_and_restart_component

print_task Creating user for the application
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"