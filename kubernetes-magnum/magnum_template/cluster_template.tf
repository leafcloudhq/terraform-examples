variable "name" {
  type = string
}

output "template_id" {
  value = openstack_containerinfra_clustertemplate_v1.production_template.id
}

resource "openstack_containerinfra_clustertemplate_v1" "production_template" {
  name                  = var.name
  image                 = "FedoraCoreOS32" # use default
  coe                   = "kubernetes"
  flavor                = "ec1.medium"
  master_flavor         = "cc1.medium"
  dns_nameserver        = "1.1.1.1" # use default
  docker_storage_driver = "overlay2"
  docker_volume_size    = 18
  network_driver        = "calico" # use default 
  volume_driver         = "cinder" # use default
  external_network_id   = "external"
  floating_ip_enabled   = true
  #   server_type           = "vm"     # use default
  #   master_lb_enabled     = false    # use default
  #   floating_ip_enabled   = false    # use default

  labels = {
    auto_healing_controller       = "magnum-auto-healer"
    magnum_auto_healer_tag        = "latest"
    max_node_count                = 4
    min_node_count                = 1
    cloud_provider_tag            = "v1.18.2"
    monitoring_enabled            = "True"
    heat_container_agent_tag      = "ussuri-stable-1"
    auto_scaling_enabled          = "True"
    auto_healing_enabled          = "True"
    kube_tag                      = "v1.18.9"
    cinder_csi_enabled            = "True"
    master_lb_floating_ip_enabled = "True"
    boot_volume_size              = 10
    boot_volume_type              = "encrypted"
    etcd_volume_size              = 5
    etcd_volume_type              = "encrypted"
    docker_volume_type            = "encrypted"
    ingress_controller            = "octavia"
  }
}
