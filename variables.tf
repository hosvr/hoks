variable "name" {
  default = "hoks-gke"
}

variable "project" {
  default = "hoks-io"
}

variable "location" {
  default = "us-east4"
}

variable "initial_node_count" {
  default = 1
}

variable "max_node_count" {
  default = 3
}

variable "machine_type" {
  default = "n1-standard-1"  
}
