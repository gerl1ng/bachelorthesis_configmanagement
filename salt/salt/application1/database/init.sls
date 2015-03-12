mariadb-server:
  pkg:
    - name: {{ pillar['mariadb-server']['package_name'] }}
    - installed
    - version: {{ pillar['mariadb-server']['package_version'] }}
  service:
    - name: {{ pillar['mariadb-server']['service_name'] }}
    - running
    - require:
      - pkg: mariadb-server
      {% if grains['os'] == 'Ubuntu' %}
    - watch:
      - file: config
      {% endif %}

{% if grains['os'] == 'Ubuntu' %}
config:
  file:
    - name: {{ pillar['database']['config_destination'] }}
    - managed
    - user: root
    - group: root
    - mode: 644    
    - source: {{ pillar['database']['config_source'] }}
    - require:
      - pkg: mariadb-server
{% endif %}

mariadb-client:
  pkg:
    - name: {{ pillar['mariadb-client']['package_name'] }}
    - installed
    - version: {{ pillar['mariadb-client']['package_version'] }}

mysql_python:
  pkg:
    - name: {{ pillar['mysql-python']['package_name'] }}
    - installed
    - version: {{ pillar['mysql-python']['package_version'] }}

mysql-connector-python:
  pkg:
    - name: {{ pillar['mysql-connector-python']['package_name'] }}
    - installed
    - version: {{ pillar['mysql-connector-python']['package_version'] }}

wordpress_database:
  mysql_database.present:
    - name: {{ pillar['database']['name'] }}

{% set allowedhosts = pillar['info']['webserver'] + pillar['database']['hosts_allowed'] %}
{% for host in allowedhosts %}
access_{{host}}:
  mysql_user.present:
    - name: {{ pillar['database']['user_name'] }}
    - password: {{ pillar['database']['user_password'] }}
    - host: '{{host}}'
    - require:
      - service: mariadb-server
  mysql_grants.present:
    - database: {{ pillar['database']['name'] }}.*
    - grant: ALL PRIVILEGES
    - user: {{ pillar['database']['user_name'] }}
    - host: '{{host}}'
    - require:
      - service: mariadb-server
{% endfor %}
