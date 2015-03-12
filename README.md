Bachelorthesis
==============

Topic: Configuration Management and Continuous Delivery in Enterprise Application Environments

Use the Vagrantfiles for setting up the environment. Configure manually by using the data in the folder manual or just logon to the master and execute the following comands to let the magic happen with salt.

sudo su -
salt-key -A
salt '*' state.highstate