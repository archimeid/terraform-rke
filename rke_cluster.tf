resource "rke_cluster" "main" {

  # Manager 1
  nodes {
    address = var.manager_1_ip
    internal_address = var.manager_1_internal_ip
    role = ["controlplane", "etcd"]
    user = var.ssh_user
    ssh_key = file(var.ssh_key_path)
  }

  # Manager 2
  nodes {
    address = var.manager_2_ip
    internal_address = var.manager_2_internal_ip
    role = ["controlplane", "etcd"]
    user = var.ssh_user
    ssh_key = file(var.ssh_key_path)
  }

  # Worker 1
  nodes {
    address = var.worker_1_ip
    internal_address = var.worker_1_internal_ip
    role = ["worker"]
    user = var.ssh_user
    ssh_key = file(var.ssh_key_path)
  }

  # Worker 2
  nodes {
    address = var.worker_2_ip
    internal_address = var.worker_2_internal_ip
    role = ["worker"]
    user = var.ssh_user
    ssh_key = file(var.ssh_key_path)
  }

  upgrade_strategy {
    drain = true
    max_unavailable_worker = "20%"
  }
}

resource "local_file" "kube_config" {
  filename = "./kube_config_cluster.yml"
  content = rke_cluster.main.kube_config_yaml
}