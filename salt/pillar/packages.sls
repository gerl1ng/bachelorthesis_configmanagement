nginx:
  package_name: nginx
  {% if grains['os'] == 'Ubuntu' %}
  package_version: 1.4.6-1ubuntu3.2
  {% else %}
  package_version: 1.6.2-4.fc21
  {% endif %}

mariadb-client:
  {% if grains['os'] == 'Ubuntu' %}
  package_name: mysql-client
  package_version: 5.5.41-0ubuntu0.14.04.1
  {% else %}
  package_name: mariadb
  package_version: 10.0.15-4.fc21
  {% endif %}
  
mariadb-server:
  {% if grains['os'] == 'Ubuntu' %}
  package_name: mysql-server
  package_version: 5.5.41-0ubuntu0.14.04.1
  service_name: mysql
  {% else %}
  package_name: mariadb-server
  package_version: 10.0.15-4.fc21
  service_name: mariadb
  {% endif %}

openssh-client:
  {% if grains['os'] == 'Ubuntu' %}
  package_name: openssh-client
  package_version: 1:6.6p1-2ubuntu2
  {% else %}
  package_name: openssh
  package_version: 6.6.1p1-11.1.fc21
  {% endif %}

php-mysqlnd:
  {% if grains['os'] == 'Ubuntu' %}
  package_name: php5-mysqlnd
  package_version: 5.5.9+dfsg-1ubuntu4.6
  {% else %}
  package_name: php-mysqlnd
  package_version: 5.6.6-1.fc21
  {% endif %}

php-cli:
  {% if grains['os'] == 'Ubuntu' %}
  package_name: php5-cli
  package_version: 5.5.9+dfsg-1ubuntu4.6
  {% else %}
  package_name: php-cli
  package_version: 5.6.6-1.fc21
  {% endif %}

php-fpm:
  {% if grains['os'] == 'Ubuntu' %}
  package_name: php5-fpm
  package_version: 5.5.9+dfsg-1ubuntu4.6
  service_name: php5-fpm
  {% else %}
  package_name: php-fpm
  package_version: 5.6.6-1.fc21
  service_name: php-fpm
  {% endif %}

mysql-python:
  {% if grains['os'] == 'Ubuntu' %}
  package_name: python-mysqldb
  package_version: 1.2.3-2ubuntu1
  {% else %}
  package_name: MySQL-python
  package_version: 1.2.3-13.fc21
  {% endif %}

mysql-connector-python:
  {% if grains['os'] == 'Ubuntu' %}
  package_name: python-mysql.connector
  package_version: 1.1.6-1
  {% else %}
  package_name: mysql-connector-python
  package_version: 1.1.6-3.fc21
  {% endif %}

haproxy:
  package_name: haproxy
  {% if grains['os'] == 'Ubuntu' %}
  package_version: 1.4.24-2
  {% else %}
  package_version: 1.5.11-1.fc21
  {% endif %}

git:
  {% if grains['os'] == 'Ubuntu' %}
  package_version: 1:1.9.1-1ubuntu0.1
  {% else %}
  package_version: 2.1.0-4.fc21
  {% endif %}

htop:
  {% if grains['os'] == 'Ubuntu' %}  
  package_version: 1.0.2-3
  {% else %}
  package_version: 1.0.3-4.fc21
  {% endif %}

openssh-server:
  package_name: openssh-server
  {% if grains['os'] == 'Ubuntu' %}
  package_version: 1:6.6p1-2ubuntu2
  service_name: ssh
  {% else %}
  package_version: 6.6.1p1-11.1.fc21
  service_name: sshd
  {% endif %}

tmux:
  {% if grains['os'] == 'Ubuntu' %}
  package_version: 1.8-5
  {% else %}
  package_version: 1.9a-5.fc21
  {% endif %}