# create a generic VM for testing
resource "google_compute_instance" "generic-vm" {
  name         = "generic-vm-${var.name}"
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
      ip_cidr_range="10.40.0.6"
      subnetwork_range_name = "acme-services-net-subnet1"
    }

    # access_config {
    #   # leaving this empty assigns: ephemeral public ipv4 address
    # }
  }
}
