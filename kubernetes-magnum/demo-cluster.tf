

module "demo_template_v1" {
  source = "./magnum_template"
  name   = "terraform-demo-template_v1"
}

resource "local_file" "kubeconfig" {
  content  = openstack_containerinfra_cluster_v1.terraform_demo_cluster.kubeconfig.raw_config
  filename = "../kubeconfig"
}


resource "openstack_containerinfra_cluster_v1" "terraform_demo_cluster" {
  name                = "terraform_demo_cluster"
  cluster_template_id = module.demo_template_v1.template_id
  master_count        = 1
  node_count          = 1
  #keypair            = "<your custom keypair>"
  floating_ip_enabled = true
  
  # fixed_network       = openstack_networking_network_v2.messier22v1.id
  # fixed_subnet        = openstack_networking_subnet_v2.default_sn.id

  # labels = {
  #   kube_dashboard_enabled = "true"
  # }
  # # merge_labels = true
}





