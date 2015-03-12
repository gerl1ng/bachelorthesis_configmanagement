haproxy:
  pkg:
    - installed
    - version: {{ pillar['haproxy']['package_version'] }}
  service:
    - running
    - require:
      - pkg: haproxy
    - watch:
      - file: config
      - file: service_enable

config:
  file:
    - name: {{ pillar['loadbalancer']['config_destination'] }}
    - managed
    - user: root
    - group: root
    - mode: 644
    - source: {{ pillar['loadbalancer']['config_source'] }}
    - require:
      - pkg: haproxy

service_enable:
  file:
    - name: /etc/default/haproxy
    - managed
    - user: root
    - group: root
    - mode: 644
    - source: salt://application1/loadbalancer/service_enable
    - require:
      - pkg: haproxy