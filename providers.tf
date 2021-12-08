terraform {
  required_providers {
    rke = {
      source = "rancher/rke"
      version = "1.2.4"
    }
  }
}

provider "rke" {
  # debug = true
  # log_file = "<RKE_LOG_FILE>"
}