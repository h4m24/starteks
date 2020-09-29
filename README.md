# Start EKS

Minimum set of terraform configurations to create an EKS cluster that is usable for common scenarios.

> This repository will give you a sane start of configurations to deploy K8s in AWS.


### How do i use this?
 The general steps are:
 - Create needed AWS resources in a specific AWS region

#### First AWS resources

this directory contains the cloud infrastructure needed for usage of AWS EKS, this is provisioned using terraform.

- provision terraform dependencies
- provision EKS resources

**notes:** 
- EKS uses [Amazon VPC Container Network Interface](https://docs.aws.amazon.com/eks/latest/userguide/cni-custom-network.html) its important to provide enough ip ranges to allow for cluster resource to allocate ip addresses to appropriate availability zones mapping for availability.
  we will be using subnets with /19 CIDR, with 3 subnets only to map to 3 availability zones.
  ![Subnet_Setup](static/subnets_setup.png)
- as a security measure of EKS, all EKS resources must be in a private subnets with private networking(in this repo the provided setup  exposes k8s API publicly)

#### Second Cluster Configurations
- configure and setup AWS/IAM RBAC setup
- setup affinity and anti affinity roles
- AWS secret manager
- Security Monitoring
- Availaiblity monitoring
- OPA?

### Tools and dependencies
- Terraform v0.13.3
- AWS VPC [official terraform module](https://github.com/terraform-aws-modules/terraform-aws-vpc)
- Terraform Aws Provider
  ```json
  {
    "registry.terraform.io/hashicorp/aws": {
      "hash": "h1:bZGW9CuoAOWqM3TVKa4kbnQhoZ9pFS+wH33Q/xRyXcw=",
      "version": "3.7.0"
    }
  }
  ```


#### ToDo
- encryption
- Create AWS IAM configs
- fixed AWS provider version
- fixed k8s/eks deployed version
- create makefile to manage the repo
- consider service mesh (istio vs aws mesh)