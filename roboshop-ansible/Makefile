default:
	git pull
	ansible-playbook -i $(component).maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component=$(component)

frontend:
	ansible-playbook -i frontend.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component=frontend
redis:
	ansible-playbook -i redis.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component=redis
mongodb:
	git pull
	ansible-playbook -i mongodb.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component=mongodb
mysql:
	git pull
	ansible-playbook -i mysql.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component=mysql
rabbitmq:
	git pull
	ansible-playbook -i rabbitmq.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component=rabbitmq
catalogue:
	git pull
	ansible-playbook -i catalogue.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component=catalogue
user:
	git pull
	ansible-playbook -i user.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component=user
cart:
	git pull
	ansible-playbook -i cart.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component=cart
shipping:
	git pull
	ansible-playbook -i shipping.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component=shipping
payment:
	git pull
	ansible-playbook -i payment.maksuduldevsecops.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 roboshop.yml -e component=payment










