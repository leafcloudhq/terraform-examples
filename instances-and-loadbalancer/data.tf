##
## Data objects help you to lookup existing resources if they exist
## 

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
