git:
  pkg:
    - installed
    - version: {{ pillar['git']['package_version'] }}

htop:
  pkg:
    - installed
    - version: {{ pillar['htop']['package_version'] }}

openssh-client:
  pkg:
    - name: {{ pillar['openssh-client']['package_name'] }}
    - installed
    - version: {{ pillar['openssh-client']['package_version'] }}

openssh-server:
  pkg:
    - installed
    - version: {{ pillar['openssh-server']['package_version'] }}
  service:
    - name: {{ pillar['openssh-server']['service_name'] }}
    - running
    - require: 
      - pkg: openssh-server

tmux:
  pkg:
    - installed
    - version: {{ pillar['tmux']['package_version'] }}