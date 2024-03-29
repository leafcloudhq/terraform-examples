terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.0"
    }
  }
}

# Configure the OpenStack Provider to use the (newer) Octavia loadbalancer
provider "openstack" {
  use_octavia = true
  cloud = "leafcloud"
}
