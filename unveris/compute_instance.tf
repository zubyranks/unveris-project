// Create a list of available zones
data "google_compute_instance" "appserver" {
  name = "webserver"
  zone = var.zone
}

// Create webserver vm
resource "google_compute_instance" "vm-instance" {
  name                    = "webserver"
  metadata_startup_script = file("startup.sh")
  machine_type            = var.machine-type
  zone                    = var.zone

  tags = ["all"]

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.public-subnetwork1.name

    access_config {
      // Ephemeral IP
    }
  }
}
