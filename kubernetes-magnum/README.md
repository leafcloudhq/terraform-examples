# Kubernetes Magnum

This folder holds an example terraform definition for an Openstack Magnum Kubernetes cluster

Note that the provider config goes in the module subfolder. This is because different modules may use different provider configurations


At the moment of writing the Openstack provider for Magnum doesn't support resizing of the cluster (due to a bug? https://github.com/terraform-provider-openstack/terraform-provider-openstack/issues/1102).

Most changes will likely cause a recreate. This is obviously annoying as you probably want to keep your cluster alive. Therefore making changes here
is not necessarily recommended; and this becomes more or less a "create once" template.


## Default storageclass

In order to auto create volumes on request of a PVC you need to add a storageclass. In the kubernetes_resouces folder you'll find the setup of a default using the required `cinder.csi.openstack.org` provider