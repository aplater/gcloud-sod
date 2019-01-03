# create the service account for our compute instance identites
resource "google_service_account" "bastion_svc_account" {
  account_id   = "${var.bastion_svc_account}"
  display_name = "${var.bastion_svc_account}"
}

# Apply roles to service account
resource "google_project_iam_member" "bastion_svc_account_member" {
  depends_on = [
    "google_service_account.bastion_svc_account",
  ]

  project = "${var.project}"
  count   = "${length(var.bastion_svc_account_roles)}"
  role    = "${element(var.bastion_svc_account_roles, count.index)}"
  member  = "serviceAccount:${google_service_account.bastion_svc_account.email}"
}
