include:
  - default

nginx:
  pkg:
    - installed
    - version: {{ pillar['nginx']['package_version'] }}
  service:
    - running
    - require: 
      - pkg: nginx
      - pkg: php-fpm
      - pkg: php-mysqlnd
      - pkg: php-cli
    - watch:    
      - file: config

php-fpm:  
  pkg:
    - name: {{ pillar['php-fpm']['package_name'] }}
    - installed
    - version: {{ pillar['php-fpm']['package_version'] }}
  service:
    - name: {{ pillar['php-fpm']['service_name'] }}
    - running
    - require:
      - pkg: php-fpm
      - pkg: php-cli
      - pkg: php-mysqlnd

mariadb-client:
  pkg:
    - name: {{ pillar['mariadb-client']['package_name'] }}
    - installed
    - version: {{ pillar['mariadb-client']['package_version'] }}

php-mysqlnd:
  pkg:
    - name: {{ pillar['php-mysqlnd']['package_name'] }}
    - installed
    - version: {{ pillar['php-mysqlnd']['package_version'] }}
    - require:
      - pkg: mariadb-client

php-cli:
  pkg:
    - name: {{ pillar['php-cli']['package_name'] }}
    - installed
    - version: {{ pillar['php-cli']['package_version'] }}

config:
  file:
    - managed
    - name: {{ pillar['webserver']['config_destination'] }}
    - user: root
    - group: root
    - mode: 644
    - source: {{ pillar['webserver']['config_source'] }}    
    - template: jinja
    - context:
        servername: {{ pillar['info']['webserver']|join(" ") }} {{ pillar['info']['loadbalancer']|join(" ") }} {{pillar['info']['domainname']}}
    - require:
      - pkg: nginx
    - require_in:
      - service: nginx

git-website:
  git.latest:
    - name: {{ pillar['webserver']['git_source'] }}
    - rev: {{ pillar['webserver']['git_revision'] }}
    - target: {{ pillar['webserver']['webhome'] }}
    - require:
      - pkg: git
      - pkg: nginx
