resource "rke_cluster" "main" {

  # Manager 1
  nodes {
    address = var.manager_1_ip
    role = ["controlplane", "etcd"]
    user = var.ssh_user
    ssh_key = file(var.ssh_key_path)
  }

  # Manager 2
  nodes {
    address = var.manager_2_ip
    role = ["controlplane", "etcd"]
    user = var.ssh_user
    ssh_key = file(var.ssh_key_path)
  }

  # Worker 1
  nodes {
    address = var.worker_1_ip
    role = ["worker"]
    user = var.ssh_user
    ssh_key = file(var.ssh_key_path)
  }

  # Worker 2
  nodes {
    address = var.worker_2_ip
    role = ["worker"]
    user = var.ssh_user
    ssh_key = file(var.ssh_key_path)
  }
}