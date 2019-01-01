# create a dedicate network for our cluster
resource "google_compute_network" "acme-labs" {
  name = "${var.network_name}"

  # disable auto-created subnets to prevent "overlap"
  auto_create_subnetworks = "${var.auto_create_subnetworks}"
}

# create a dedicated subnet for our cluster
resource "google_compute_subnetwork" "acme-labs" {
  name                     = "${var.network_name}"
  ip_cidr_range            = "${var.ip_cidr_range}"
  network                  = "${google_compute_network.acme-labs.self_link}"
  region                   = "${var.region}"
  private_ip_google_access = "${var.private_ip_google_access}"

  # enable secondary IP range for pods and services:
  secondary_ip_range = [
    {
      range_name    = "${var.network_name}-subnet1"
      ip_cidr_range = "${var.subnet1_ip_cidr_range}"
    },
    {
      range_name    = "${var.network_name}-subnet2"
      ip_cidr_range = "${var.subnet2_ip_cidr_range}"
    },
  ]
}
