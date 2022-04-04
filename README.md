Ansible Repo for Configuring DHCP and ZTD for Dell Switches with Netbox inventory
===============================================

### Install dependencies


`pip3 install -r requirements.txt`  
`ansible-galaxy install -r requirements.yml -p roles`

### Requirements

Environment variables required for NETBOX_API and NETBOX_TOKEN  

example
`export NETBOX_API=https://netboxurl.yourorg.com:8000`  
`export NETBOX_TOKEN=0123456789abcdef0123456789abcdef01234555`  

### Running 
`ansible-playbook -i netbox_inventory.yaml playbooks/Pipelines/playbooks/dhcp.yaml`
`ansible-playbook -i netbox_inventory.yaml playbooks/Pipelines/playbooks/sonic_ztp.yaml`

