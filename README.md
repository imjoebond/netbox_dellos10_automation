Ansible Repo for Configuring DHCP and ZTD for Dell Switches with Netbox inventory
===============================================

### Install dependencies


`pip3 install -r requirements.txt`  
`ansible-galaxy install -r requirements.yml`

### Requirements

Environment variables required for NETBOX_API and NETBOX_TOKEN  

### GNS3 Setup
![ GNS3 Setup](docs/GNS3_visual.PNG "how to setup gns3 environment")

example
`export NETBOX_API=https://netboxurl.yourorg.com:8000`  
`export NETBOX_TOKEN=0123456789abcdef0123456789abcdef01234555`  

### Running 
`ansible-playbook -i netbox_inventory.yaml Pipelines/playbooks/dhcp.yaml`
`ansible-playbook -i netbox_inventory.yaml Pipelines/playbooks/sonic_ztp.yaml`


#### Cloning Netbox
clone netbox-docker and use docker-compose to bring up an instance.
cp netbox.sql /var/lib/docker/volumes/netboxdocker_netbox-postgres-data/_data/
psql -U netbox -d postgres
drop database netbox with (force);
psql -U netbox -d netbox -f netbox.sql

source /opt/netbox/venv/bin/activate
python manage.py createsuperuser
