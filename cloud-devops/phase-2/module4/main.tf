terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  credentials = "<YOUR_PROJECT_KEY>"
  project     = "<YOUR_PTOJECT_ID>"
  region      = "us-west1"
  zone        = "us-west1-b"
}

resource "google_compute_network" "vpc_network" {
  name = "web-network"
}

resource "google_compute_firewall" "vpc_network" {
  name    = "web-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "8080"]
  }

    source_ranges = ["0.0.0.0/0"]

  source_tags = ["web"]
}

resource "google_compute_instance" "vm_instance" {
  name         = "apache-web-server101"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }

  metadata_startup_script = <<EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    EOF

}

output "ip" {
  value = [google_compute_instance.vm_instance.network_interface.0.network_ip, google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip]
}
