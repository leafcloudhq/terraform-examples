resource "openstack_compute_instance_v2" "blue" {
  # The amount of instances you want to start
  count = 2

  name            = "blue_${count.index}"
  flavor_name     = "ec1.large"
  key_pair        = "thatcher_oatcake"
  security_groups = ["default"]
  image_name      = "Ubuntu-18.04"
  # user_data       = file("cloud-init-blue.yaml")

  network {
    name = openstack_networking_network_v2.private.name
    # Here we get the value of the count and add 20, 
    # so that each instance gets it's own unique I
    fixed_ip_v4 = "192.168.42.${count.index + 10}"
  }
}

