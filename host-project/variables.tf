# Variables for "Admin" project
variable project {
  description = "The project ID to host project resources in"
}

variable name {
  description = "The project name/prefix"
}

variable region {
  description = "The region to host the resources in"
}

variable zone {
  description = "Initial HA zone for resources"
}

variable network_name {
  description = "The VPC network to host the resources in"
}

variable ip_cidr_range {
  description = "Set a custom ip cidr range"
}

variable subnet1_ip_cidr_range {
  description = "The secondary ip range to use for pods"
}

variable subnet2_ip_cidr_range {
  description = "The secondary ip range to use for services"
}

variable private_ip_google_access {
  description = "Enable GCP services private IP access"
  default     = true
}

variable auto_create_subnetworks {
  description = "Disable auto-creation of subnetworks, allow creation of custom subnetworks"
  default     = false
}

variable additional_zones {
  type        = "list"
  description = "Set some additional zones for high availability"
}

variable bastion_svc_account {
  description = "Set a custom service account for the bastion compute instance"
}

variable bastion_svc_account_role {
  description = "Set appropriate role bindings for bastion instance service account"
  default     = "roles/container.admin"
}

variable bastion_oath_scopes {
  description = "Constrain GCP services scopes for bastion instance."

  default = [
    "https://www.googleapis.com/auth/cloud-platform",
  ]
}

variable ssh_firewall_rule_name {
  description = "Configure a firewall rule to constrai access to our bastion host"
  default     = "bastion-ssh"
}

variable ssh_source_ranges {
  type        = "list"
  description = "Constrain allowable sources that can connect to the ssh bastion."
}

variable generic_vm_svc_account {
  description = "Set a custom service account for the bastion compute instance"
}

variable generic_vm_svc_account_role {
  description = "Set appropriate role bindings for bastion instance service account"
  default     = "roles/container.admin"
}

variable generic_vm_oath_scopes {
  description = "Constrain GCP services scopes for bastion instance."

  default = [
    "https://www.googleapis.com/auth/cloud-platform",
  ]
}
