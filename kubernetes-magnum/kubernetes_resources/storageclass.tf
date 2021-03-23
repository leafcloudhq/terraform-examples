
resource "kubernetes_storage_class" "default" {
  metadata {
    name = "cinder"
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }
  storage_provisioner    = "cinder.csi.openstack.org"
  reclaim_policy         = "Retain"
  allow_volume_expansion = false
}
