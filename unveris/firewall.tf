// Create firewall for Public Subnet
resource "google_compute_firewall" "public_subnet" {
  name          = "public-firewall"
  network       = google_compute_network.vpc_network.name
  source_ranges = [var.internet]
  allow {
    protocol = "tcp"
    ports    = ["80", "8080","22", "1000-2000"]
  }
  allow {
    protocol = "icmp"
  }

  source_tags = ["all"]
}

// Create firewall for Private Subnet
resource "google_compute_firewall" "private_subnet" {
  name          = "private-firewall"
  network       = google_compute_network.vpc_network.name
  source_ranges = [var.subnet1_cidr_range, var.subnet2_cidr_range, var.subnet4_cidr_range]
  allow {
    protocol = "icmp"
  }

  source_tags = ["private"]
}

// Create firewall for Protected Subnet
resource "google_compute_firewall" "protected_subnet" {
  name          = "protected-firewall"
  network       = google_compute_network.vpc_network.name
  target_tags   = ["protected"]
  source_ranges = [var.subnet3_cidr_range]
  allow {
    protocol = "icmp"
  }
}
