provider "google" {
  credentials = file("terraform-keyfile.json")
  project     = "{{}}"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
      ssd_dsik = 100
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = ""
    access_config {
    }
  }
}

