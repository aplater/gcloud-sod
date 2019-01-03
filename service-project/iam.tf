# create the service account for our cluster worker nodes

# TODO: In order to use the configured oauth_scopes for logging and monitoring, 
# the service account being used needs the roles/logging.logWriter 
# and roles/monitoring.metricWriter roles.

# create the service account for our cluster worker nodes
resource "google_service_account" "bastion-svc-account" {
  account_id   = "${var.bastion_svc_account}"
  display_name = "${var.bastion_svc_account}"
}

# apply cluster admin policy to bastion service account
resource "google_project_iam_member" "bastion-svc-account-member" {
  project = "${var.project}"
  role    = "${var.bastion_svc_account_role}"
  member  = "serviceAccount:${google_service_account.bastion-svc-account.email}"
}

# resource "google_service_account" "generic-vm-svc-account" {
#   account_id   = "${var.generic_vm_svc_account}"
#   display_name = "${var.generic_vm_svc_account}"
# }


# # apply cluster admin policy to generic VM service account
# resource "google_project_iam_member" "generic-vm-svc-account-member" {
#   project = "${var.project}"
#   role    = "${var.generic_vm_svc_account_role}"
#   member  = "serviceAccount:${google_service_account.generic-vm-svc-account.email}"
# }

