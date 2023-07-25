## Default storageclass

In order to auto create volumes on request of a PVC you need to add a storageclass. In the kubernetes_resouces folder you'll find the setup of a default using the required `cinder.csi.openstack.org` provider

This example uses a .kubeconfig file that is located in the root directory.
After running the kubernetes_magnum terraform example the kubeconfig file will be configured to your newly created cluster.
