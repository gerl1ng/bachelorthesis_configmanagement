DROP DATABASE IF EXISTS `wordpress_prod`;
CREATE DATABASE `wordpress_prod`;
GRANT ALL PRIVILEGES ON wordpress_prod.* TO "wordpress"@"webserver1" IDENTIFIED BY "wordpress";
GRANT ALL PRIVILEGES ON wordpress_prod.* TO "wordpress"@"webserver2" IDENTIFIED BY "wordpress";
GRANT ALL PRIVILEGES ON wordpress_prod.* TO "wordpress"@"localhost" IDENTIFIED BY "wordpress";
FLUSH PRIVILEGES;

