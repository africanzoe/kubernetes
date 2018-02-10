# Kubernetes installation

This is an Ansible playbook based on the manual steps of [Kubernetes the hard way](https://github.com/kelseyhightower/kubernetes-the-hard-way).

## Requirements

This playbook is supposed to run on 6 VMs as the following:
* 3 VMs as masters and they embed on them an __etcd__ cluster
* 3 VMs as workers
* It assumes that there is an external loadbalancer (the IP of the LB should be provided beforehand to generate the certificates correctly)

# Role Variables

## Misc vars

- **user**: the name of the user running the cluster.
- **group**: the name of the group running the cluster.
- **pre_flight_dir**: the name of a local directory that will be used as a working directory for certificates generation (mainly). It defaults to:  "{{ role_path }}/local".
- **expiry_hours**: the validity of the certificates. It default to 8760 (One year).
- **bits**: the number of bits used during certifcates generation. It defaults to "4096".

## Common Certificates subject

- country: "FR".
- locality: "Paris".
- state: "Paris".

## Certificates default names

- ca_key: the name of the CA key. It defaults to "ca-key.pem".
- ca_crt: the name of the CA certificate. It defaults to "ca.pem".
- admin_key: the name of the apiserver key. It defaults to "admin-key.pem".
- admin_crt: the name of the apiserver ertificate. It defaults to "admin.pem".

## The exposed pubilc kubernetes IP

- kubernetes_public_ip: this is the public IP of kubernetes. It is supposed to be the IP of the loadbalancer. For ex: "10.100.200.73".

## The IP addresses of the workers

Please provide the IP addresses of the workers nodes, ex:
- { node: 'k8s-worker-1', internal_ip: '10.0.11.100', external_ip: '192.168.1.100' }
- { node: 'k8s-worker-2', internal_ip: '10.0.11.101', external_ip: '192.168.1.101'}
- { node: 'k8s-worker-3', internal_ip: '10.0.11.102', external_ip: '192.168.1.102'}

## The IPs of the controllers

Please provide the IP addresses of the masters nodes, ex:
- { node: 'k8s-controller-1', internal_ip: '10.0.11.10', external_ip: '192.168.1.10' }
- { node: 'k8s-controller-2', internal_ip: '10.0.11.20', external_ip: '192.168.1.20'}
- { node: 'k8s-controller-3', internal_ip: '10.0.11.30', external_ip: '192.168.1.30'}

**N.B**: the IP addresses of the masters and workers have 2 parts: one **internal** accessible ONLY between nodes, the other **external**.

## Cluster definition

- **cluster_name**: the name of the kubernetes cluster. It defaults to "kubernetes".
- **cluster_cidr**: the range of IP addresses handled by the cluster, ex: "10.0.11.0/24".
- **pod_cidr**: the range of IP addresses assigned dynamically to pods, ex: "10.0.11.0/24".


# Dependencies

N/A.

## License

GPLv3
