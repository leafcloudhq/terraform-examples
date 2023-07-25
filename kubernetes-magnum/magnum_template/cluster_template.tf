variable "name" {
  type = string
}

output "template_id" {
  value = openstack_containerinfra_clustertemplate_v1.production_template.id
}

resource "openstack_containerinfra_clustertemplate_v1" "production_template" {
  name                  = var.name
  image                 = "CoreOS-33" # use default
  coe                   = "kubernetes"
  flavor                = "ec1.medium"
  master_flavor         = "cc1.medium"
  docker_storage_driver = "overlay2"
  docker_volume_size    = 18
  network_driver        = "calico" # use default 
  volume_driver         = "cinder" # use default
  external_network_id   = "external"
  floating_ip_enabled   = false
  master_lb_enabled = true
  #   server_type           = "vm"     # use default
  #   master_lb_enabled     = false    # use default
  #   floating_ip_enabled   = false    # use default

  labels = {

  }
}

