
# project properties
project="acme-corp-resource"
admin_project="acme-corp-admin"
name="acme-corp-resource"
region="us-west2"
zone="us-west2-a"

# bastion host properties
bastion_image="projects/cis-public/global/images/cis-ubuntu-linux-1804-level-1-v1-0-0-0" # CIS hardened image
bastion_svc_account="bastion-svc@acme-corp-admin.iam.gserviceaccount.com"
generic_vm_svc_account="generic-vm-svc@acme-corp-admin.iam.gserviceaccount.com"
ssh_source_ranges=["/32"]
host_network="us-west2/acme-corp-admin-net?project=acme-corp-admin"
network_name="projects/acme-corp-admin/global/networks/acme-corp-admin-net"
subnetwork="projects/acme-corp-admin/regions/us-west2/subnetworks/acme-corp-admin-net"

