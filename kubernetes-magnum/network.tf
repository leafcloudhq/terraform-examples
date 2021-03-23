# resource "openstack_networking_network_v2" "messier22v1" {
#   name           = "messier22v1"
#   admin_state_up = "true"
# }

# resource "openstack_networking_subnet_v2" "default_sn" {
#   name       = "default_sn"
#   cidr       = "10.0.0.0/24"
#   ip_version = 4
#   network_id = openstack_networking_network_v2.messier22v1.id

#   allocation_pool {
#     start = "10.0.0.100"
#     end   = "10.0.0.200"
#   }
# }
