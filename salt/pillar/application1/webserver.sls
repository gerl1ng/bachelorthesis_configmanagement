webserver:
  {% if grains['os'] == 'Ubuntu' %}
  config_source: salt://application1/webserver/virtual.conf_socket
  {% else %}
  config_source: salt://application1/webserver/virtual.conf
  {% endif %}
  config_destination: /etc/nginx/conf.d/virtual.conf
  webhome: /usr/share/nginx/html/wordpress
  git_source: https://github.com/gerl1ng/bachelorthesis_website.git
  git_revision: 0ae7ebf0d7941def584384d9300111d55c65f43a