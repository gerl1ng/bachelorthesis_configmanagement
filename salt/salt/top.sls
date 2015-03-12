base:
  '*':
    - default
  'loadbalancer':
    - application1.loadbalancer
  'webserver*':
    - application1.webserver
  'database':
    - application1.database
