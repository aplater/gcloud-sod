
# project properties
project="acme-corp-admin"
name="acme-corp-admin"
region="us-west2"

# custom network properties
network_name="acme-corp-admin-net"
ip_cidr_range="172.16.0.0/28"
subnet1_ip_cidr_range="10.40.0.0/14"
subnet2_ip_cidr_range="10.0.16.0/20"
zone="us-west2-a"
additional_zones = [
  "us-west2-b",
  "us-west2-c",
]
ssh_source_ranges=["98.168.44.221"]

# IAM Properties
bastion_svc_account="bastion-svc"
generic_vm_svc_account="generic-vm-svc"

