# bastion firewall rule: all SSH from provided source network
resource "google_compute_firewall" "bastion-ssh" {
  name                    = "${var.ssh_firewall_rule_name}"
  network                 = "${google_compute_subnetwork.acme-labs.name}"
  source_ranges           = "${var.ssh_source_ranges}"
  target_service_accounts = ["bastion-svc@acme-inc-service.iam.gserviceaccount.com"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

# Firewall rules for intra-cluster member communication
# https://cloud.google.com/dataproc/docs/concepts/network
resource "google_compute_firewall" "internal_ipc_firewall" {
  name                    = "internal-ipc-firewall"
  network                 = "${google_compute_subnetwork.acme-labs.name}"
  source_ranges           = ["${var.subnet1_ip_cidr_range}", "${var.subnet2_ip_cidr_range}"]
  target_service_accounts = ["bastion-svc@acme-inc-service.iam.gserviceaccount.com"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
}
