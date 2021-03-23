data "openstack_images_image_v2" "debian" {
  name        = "Debian-10.5"
  most_recent = true
}

# data "openstack_networking_network_v2" "private" {
#   name = "private"
# }

data "openstack_networking_network_v2" "external" {
  name = "external"
}

# data "openstack_networking_subnet_v2" "external_sn" {
#   network_id = data.openstack_networking_network_v2.private.id
#   # id = "e6a62d76-95ad-470d-89e6-b4bdc6d67191"
# }
