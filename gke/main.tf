provider "google" {
  credentials = file("account.json")
  project = "hoks-io"
  region  = "us-east4"
  zone    = "us-east4-c"
}

resource "google_container_cluster" "default" {
  name        = "${var.name}"
  project     = "${var.project}"
  description = "hoks gke cluster"
  location    = "${var.location}"

  remove_default_node_pool = true
  initial_node_count = "${var.initial_node_count}"

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "preemptibles" {
  name       = "${var.name}-node-pool"
  project     = "${var.project}"
  location   = "${var.location}"
  cluster    = "${google_container_cluster.default.name}"
  node_count = 1

  autoscaling {
    min_node_count = "${var.initial_node_count}"
    max_node_count = "${var.max_node_count}"
  }

  node_config {
    preemptible  = true
    machine_type = "${var.machine_type}"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_write",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}