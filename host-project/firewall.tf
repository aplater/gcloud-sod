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
