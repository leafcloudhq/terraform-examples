resource "openstack_networking_network_v2" "private" {
  name = "private_net"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "default_sn" {
  name = "default_sn"
  cidr = "192.168.42.0/24"
  ip_version = 4
  network_id = openstack_networking_network_v2.private.id
}