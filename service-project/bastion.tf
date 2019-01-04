# create a bastion host VM to access our Private resources

# Adding SSH Public Key in Project Meta Data
resource "google_compute_project_metadata_item" "ssh-keys" {
  key   = "ssh-keys"
  value = "${var.public_key}"
}

resource "google_compute_instance" "bastion" {
  name         = "bastion-${var.name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  service_account {
    email  = "${google_service_account.bastion_svc_account.email}"
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
    subnetwork         = "${var.subnetwork}"

    alias_ip_range {
      ip_cidr_range         = "/32"
      subnetwork_range_name = "acme-services-net-subnet1"
    }

    access_config {
      # leaving this empty assigns: ephemeral public ipv4 address
    }
  }
}
