# create a bastion host VM to access our Private resources
resource "google_compute_instance" "bastion" {
  name         = "bastion-${var.name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  service_account {
    email  = "bastion-svc@acme-corp-admin.iam.gserviceaccount.com" # "${google_service_account.bastion-svc-account.email}"
    scopes = "${var.bastion_oath_scopes}"
  }

  boot_disk {
    initialize_params {
      image = "${var.bastion_image}"
    }
  }

  # local SSD disk
  scratch_disk {}

  # specify the dedicated subnet for our inside interface:
  network_interface {
    subnetwork_project = "${var.admin_project}"
    subnetwork = "${var.subnetwork}"
    access_config {
      # leaving this empty assigns: ephemeral public ipv4 address
    }
  }
}
