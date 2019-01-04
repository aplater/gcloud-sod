# create the service account for our compute instance identites
resource "google_service_account" "bastion_svc_account" {
  account_id   = "${var.bastion_svc_account}"
  display_name = "${var.bastion_svc_account}"
}

# Apply roles to bastion service account
resource "google_project_iam_member" "bastion_svc_account_member" {
  role   = "roles/compute.osLogin"
  member = "serviceAccount:${google_service_account.bastion_svc_account.email}"
}

resource "google_service_account" "generic_vm_svc_account" {
  account_id   = "generic-vm-svc"
  display_name = "generic vm service account"
}

# Apply Data Proc worker role to service account
resource "google_project_iam_member" "generic_vm_svc_account_member" {
  project = "${var.project}"
  count   = "${length(var.generic_vm_svc_account_roles)}"
  role    = "${element(var.generic_vm_svc_account_roles, count.index)}"
  member  = "serviceAccount:${google_service_account.generic_vm_svc_account.email}"
}
