# Terraform-Challenges-KodeKloud
## Challenge 2
In this challenge we will implement a simple LAMP stack using terraform and docker. Utilize /root/code/terraform-challenges/challenge2 directory to store your Terraform configuration files.

Inspect the requirements in detail by clicking on the icons of the interactive architecture diagram on the right and complete the tasks. Once done click on the Check button to validate your work.

![Screenshot from 2023-04-30 17-37-32](https://user-images.githubusercontent.com/46055709/235359665-ceeb7085-b6c9-4ce0-a6a1-7ea2e4b10165.png)

### docker_image

#### php-httpd-image
* Create a terraform resource named php-httpd-image for building docker image with following specifications:
* Image name: php-httpd:challenge
* Build context: lamp_stack/php_httpd
* Labels: challenge: second

#### mariadb-image 
* Create a terraform resource named mariadb-image for building docker image with following specifications:
* Image name: mariadb:challenge
* Build context: lamp_stack/custom_db
* Labels: challenge: second

### docker_network

* Create a terraform resource named private_network and configure the following:
* Create a Docker network with name=my_network
* Enable manual container attachment to the network.
* User-defined key/value metadata: challenge: second

### docker_volume

* Create a terraform resource named mariadb_volume creating a docker volume with name=mariadb-volume

### docker_container

#### php-httpd docker container
* Define a terraform resource php-httpd for creating docker container with following specification:
* Container Name: webserver
* Hostname: php-httpd
* Image used: php-httpd:challenge
* Attach the container to network my_network
* Publish a container's port(s) to the host:
* Hostport: 0.0.0.0:80
* containerPort: 80
* Labels: challenge: second
* Create a volume with host_path /root/code/terraform-challenges/challenge2/lamp_stack/website_content/ and container_path /var/www/html within webserver container.

#### phpmyadmin docker container
* Define a terraform resource phpmyadmin for docker container with following configurations:
* Container Name: db_dashboard
* Image Used: phpmyadmin/phpmyadmin
* Hostname: phpmyadmin
* Attach the container to network my_network
* Publish a container's port(s) to the host:
* Hostport: 0.0.0.0:8081
* containerPort: 80
* Labels: challenge: second
* Establish link based connectivity between db and db_dashboard containers (Deprecated)
* Explicitly specify a dependency on mariadb terraform resource

#### mariadb docker container
* Define a terraform resource mariadb for creating docker container with following specification:
* Container Name: db
* Image Used: mariadb:challenge
* Hostname: db
* Attach the container to network my_network
* Publish a container's port(s) to the host:
* Hostport: 0.0.0.0:3306
* containerPort: 3306
* Labels: challenge: second
* Define environment variables inside mariadb resource:
* MYSQL_ROOT_PASSWORD=1234
* MYSQL_DATABASE=simple-website
* Attach volume mariadb-volume to /var/lib/mysql directory within db container.
