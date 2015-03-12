database:
  name: wordpress_prod
  user_name: wordpress
  user_password: wordpress
  hosts_allowed: ['localhost']
  {% if grains['os'] == 'Ubuntu' %}
  config_source: salt://application1/database/my.cnf_ubuntu
  config_destination: /etc/mysql/my.cnf
  {% endif %}

