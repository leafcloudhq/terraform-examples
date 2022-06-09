# Deploying Kubernetes to Leafcloud using Terraform and RKE2

This repository shows the usage of Terraform with the [terraform-openstack-rke2](http://github.com/remche/terraform-openstack-rke2) provider. While we recommend using Magnum for creating and managing Kubernetes on Leafcloud, the approach outlined in this example is a good alternative if you want to use Terraform, and want to have more control.

The most significant limitation is that node autoscaling is not supported.

## How it works

Using terraform you deploy machines for the K8S control plane, and create all other required OpenStack Resources, such as subnets and security groups. Instances are configured using cloud-init, and will use the [rancher rke2](https://docs.rke2.io) Kubernetes Distribution.

## Openstack integration

In Kubernetes the [Cloud Provider Openstack](https://github.com/kubernetes/cloud-provider-openstack/) enables creating resources such as Storage Volumes and LoadBalancers in Openstack based on K8S Resources.

Specifically we deploy both the Cloud Controller Manager (CCM) and Cinder Container Storage Interface (Cinder CSI).

## Usage

- Copy all files from this example to your own project
- Edit main.tf to match your desired setup
- `terraform init`
- `terraform apply`

For more information and configuration options, see [terraform-openstack-rke2](https://github.com/remche/terraform-openstack-rke2)

When successful, it should put a (rke2).yaml file with the credentials into the current working directory. Move this file to `~/config` and `export KUBECONFIG=~/config` to have kubectl use this config file.

In some cases you need to retrieve the config file from the controller node, and it can be found in /etc/rancher/rke2/rke2.yaml. Change the cluster-ip to reflect your cluster IP.

## Creating resources

If properly configured you can create a LoadBalancer like so:

```
apiVersion: v1
kind: Service
metadata:
  name: demo
  namespace: default
spec:
  type: LoadBalancer
  selector:
    app: demo-app
  ports:
    - port: 8000
      targetPort: 8000
      name: http
      protocol: TCP
```

And volumes like so:

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mypvc
spec:
  resources:
    requests:
      storage: 8Gi
  volumeMode: Filesystem
  accessModes:
    - ReadWriteOnce
  storageClassName: csi-cinder-sc-delete
```

(There are also other ways to create volumes)

## Debugging

You can tail the logs of the cloud controller manager.

```
kubectl logs -n kube-system -L app=openstack-cloud-controller-manager
```

### Default StorageClass. 
The template in os_cinder.yaml.tpl sets the 'retain' StorageClass to be the default. This means that if you don't specify a storageclass when creating a PVC it will not be deleted on delete of the PVC. Change this if you like a different behavior.
