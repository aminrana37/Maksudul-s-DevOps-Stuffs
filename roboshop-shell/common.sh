restart_component() {
  systemctl restart $service
}

enable_and_restart_service() {
  systemctl enable $service
  restart_component
}

service_setup() {
  dnf module disable $service -y
  dnf module enable $service:$version -y
  dnf install $service -y
}

install_enable_restart_service() {
  dnf install $service -y
  enable_and_restart_service
}

install_enable_restart_mongodb() {
  dnf install $component -y
  enable_and_restart_service
}

configure_conponent() {
  useradd roboshop
  mkdir /app
  curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip
  cd /app
  unzip /tmp/$component.zip
}

configure_conponent_others() {
  configure_conponent
  cd /app
  npm install
}

daemon_reload_and_restart_component() {
  cp $component.service /etc/systemd/system/$component.service
  systemctl daemon-reload
  enable_and_restart_component
}

component_and_service_setup() {
  print_task Configuring and installing $component
  service_setup

  print_task Configuring app content
  configure_conponent_others

  print_task Copying and reloading srvice
  daemon_reload_and_restart_component
}
#configure_conponent() {
#  useradd roboshop
#  mkdir /app
#  curl -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip
#  cd /app
#  unzip /tmp/$component.zip
#  cd /app
#  npm install
#}



configure_conponent_maven() {
  configure_conponent
  cd /app
  mvn clean package
  mv target/$component-1.0.jar $component.jar
}

configure_conponent_payment() {
  configure_conponent
  cd /app
  pip3 install -r requirements.txt
}

configure_conponent_dispatch() {
  configure_conponent
  cd /app
  go mod init $component
  go get
  go build
}


#enable_and_restart_component() {
#  systemctl enable $component
#  restart_component
#}




print_task() {
  echo -e "\e[34m$*\e[0m"
  echo "###############################################" &>> $log_file
  echo -e "\e[34m$*\e[0m" &>> $log_file
  echo "###############################################" &>> $log_file
}

log_file=/tmp/roboshop.log

configure_frontend_content() {
  rm -rf /usr/share/nginx/html/*
  curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip
  cd /usr/share/nginx/html
  unzip /tmp/frontend.zip
}

#restart_nginx() {
#  systemctl restart nginx
#}





#configure_and_install_nodejs() {
#  dnf module disable nodejs -y
#  dnf module enable nodejs:20 -y
#  dnf install nodejs -y
#}

#configure_catalogue_content() {
#  mkdir /app
#  curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
#  cd /app
#  unzip /tmp/catalogue.zip
#  cd /app
#  npm install
#}



copy_repo_file() {
  cp $componentrepo.repo /etc/yum.repos.d/$componentrepo.repo
}

copy_service() {
   cp $component.service /etc/systemd/system/$component.service
}

find_and_replace() {
   sed -i -e 's|$find|$replace|' /etc/$component.conf
}