// Create Google Provider for Terraform
provider "google" {
  credentials = "terraform-key.json"
  project     = var.project
  region      = "var.region"

}

// Create Project VPC
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

// Create Public Subnet 1
resource "google_compute_subnetwork" "public-subnetwork1" {
  name          = "public-subnetwork1"
  ip_cidr_range = var.subnet1_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.name
}

// Create Public Subnet 2
resource "google_compute_subnetwork" "public-subnetwork2" {
  name          = "public-subnetwork2"
  ip_cidr_range = var.subnet2_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.name
}

// Create Public Subnet 3
resource "google_compute_subnetwork" "private-subnetwork3" {
  name          = "private-subnetwork3"
  ip_cidr_range = var.subnet3_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.name
}

// Create Public Subnet 4
resource "google_compute_subnetwork" "protected-subnetwork4" {
  name          = "protected-subnetwork4"
  ip_cidr_range = var.subnet4_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_network.name
}

// Create Route for VPC
resource "google_compute_router" "router" {
  name    = "my-router"
  region  = var.region
  network = google_compute_network.vpc_network.name
}

// Create NAT Gateway
resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  // This provides the list of subnetworks that are accessible to NAT GW
  subnetwork {
    name                    = google_compute_subnetwork.private-subnetwork3.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  subnetwork {
    name                    = google_compute_subnetwork.protected-subnetwork4.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
