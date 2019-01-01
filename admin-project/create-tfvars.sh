#!/bin/bash


# set some variables:
# export GOOGLE_PROJECT=$(gcloud config get-value project)
export GOOGLE_PROJECT="acme-corp-admin"
export MY_PUBLIC_IPV4=$(curl https://api.ipify.org)

# create our variables file:
cat - > terraform.tfvars <<EOF

# project properties
project="${GOOGLE_PROJECT}"
name="${GOOGLE_PROJECT}"
region="us-west2"

# custom network properties
network_name="${GOOGLE_PROJECT}-net"
ip_cidr_range="172.16.0.0/28"
subnet1_ip_cidr_range="10.40.0.0/14"
subnet2_ip_cidr_range="10.0.16.0/20"
zone="us-west2-a"
additional_zones = [
  "us-west2-b",
  "us-west2-c",
]
ssh_source_ranges=["${MY_PUBLIC_IPV4}"]

# IAM Properties
bastion_svc_account="bastion-svc"
generic_vm_svc_account="generic-vm-svc"

EOF
