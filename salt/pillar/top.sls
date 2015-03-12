base:
  '*':
    - packages
    - application1.info
  'loadbalancer':
    - application1.loadbalancer
  'webserver*':
    - application1.webserver
  'database':
    - application1.database