# Start a container
resource "docker_container" "php-httpd" {
  name  = "webserver"
  image = "php-httpd:challenge"
  hostname = "php-httpd"
  networks_advanced {
    name = docker_network.private_network.id
  }
  ports {
    internal    =   80
    external    =   80
    ip          =   "0.0.0.0"
  }
    
  labels {
    label       =   "challenge"
    value       =   "second"
}
  volumes {
    container_path = "/var/www/html"
    host_path   =   "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
  }
}


# Start a container
resource "docker_container" "phpmyadmin" {
  name  = "db_dashboard"
  image = "phpmyadmin/phpmyadmin"
  hostname = "phpmyadmin"
  networks_advanced {
    name = docker_network.private_network.id
  }
  ports {
    internal    =   80
    external    =   8081
    ip          =   "0.0.0.0"
  }
    
  labels {
    label       =   "challenge"
    value       =   "second"
}
  volumes {
    container_path = "/var/www/html"
    host_path   =   "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
  }
  
  links = [
    docker_container.mariadb.id
  ]

  depends_on = [ docker_container.mariadb ]
}

# Start a container
resource "docker_container" "mariadb" {
  name  = "db"
  image = "mariadb:challenge"
  hostname = "db"
  networks_advanced {
    name = docker_network.private_network.id
  }
  ports {
    internal    =   3306
    external    =   3306
    ip          =   "0.0.0.0"
  }
    
  labels {
    label       =   "challenge"
    value       =   "second"
}
  
  env = ["MYSQL_ROOT_PASSWORD=1234", "MYSQL_DATABASE=simple-website"]
  volumes {
    container_path = "/var/lib/mysql"
    volume_name = docker_volume.mariadb_volume.id
  }
}


