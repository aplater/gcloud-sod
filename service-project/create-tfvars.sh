#!/bin/bash


# set some variables:
# export GOOGLE_PROJECT=$(gcloud config get-value project)
export GOOGLE_PROJECT="acme-corp-resource"
export GOOGLE_ADMIN_PROJECT="acme-corp-admin"

# create our variables file:
cat - > terraform.tfvars <<EOF

# project properties
project="${GOOGLE_PROJECT}"
admin_project="${GOOGLE_ADMIN_PROJECT}"
name="${GOOGLE_PROJECT}"
region="us-west2"
zone="us-west2-a"

# bastion host properties
bastion_image="projects/cis-public/global/images/cis-ubuntu-linux-1804-level-1-v1-0-0-0" # CIS hardened image
bastion_svc_account="bastion-svc"

# generic host properties
generic_vm_svc_account="generic-vm-svc"

# network properties
ssh_source_ranges=["${MY_PUBLIC_IPV4}/32"]
host_network="us-west2/acme-corp-admin-net?project=acme-corp-admin"
network_name="projects/acme-inc-host/global/networks/acme-corp-admin-net"
subnetwork="projects/acme-inc-host/regions/us-west2/subnetworks/acme-corp-admin-net"

EOF
