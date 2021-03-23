
module "production_template_v1" {
  source = "./magnum_template"
  name   = "production-template_v1"
  providers = {
    openstack = openstack.openstack_external
  }
}

module "kubernetes_resources" {
  source = "./kubernetes_resources"
}

resource "openstack_containerinfra_cluster_v1" "messier_22" {
  name                = "messier22v1"
  cluster_template_id = module.production_template_v1.template_id
  master_count        = 1
  node_count          = 2
  keypair             = "production_nodes"
  floating_ip_enabled = true
  # fixed_network       = openstack_networking_network_v2.messier22v1.id
  # fixed_subnet        = openstack_networking_subnet_v2.default_sn.id

  # labels = {
  #   kube_dashboard_enabled = "true"
  # }
  # # merge_labels = true
}
