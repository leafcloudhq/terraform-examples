resource "openstack_lb_loadbalancer_v2" "demo_lb" {
  name           = "demo-loadbalancer"
  vip_network_id = data.openstack_networking_network_v2.external.id
}

resource "openstack_lb_listener_v2" "listener_1" {
  protocol        = "HTTP"
  protocol_port   = 80
  loadbalancer_id = openstack_lb_loadbalancer_v2.demo_lb.id

  insert_headers = {
    X-Forwarded-For = "true"
  }
}

resource "openstack_lb_pool_v2" "main_pool" {
  protocol    = "HTTP"
  lb_method   = "ROUND_ROBIN"
  listener_id = openstack_lb_listener_v2.listener_1.id
}

resource "openstack_lb_members_v2" "members_1" {
  count   = 2
  pool_id = openstack_lb_pool_v2.main_pool.id

  member {
    address       = "192.168.42.${count.index + 10}"
    protocol_port = 80
  }
}
