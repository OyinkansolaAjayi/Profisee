module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.13.1"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access = var.public_access
  cluster_endpoint_private_access = var.private_access

  enable_irsa = var.irsa

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id =  data.terraform_remote_state.vpc.outputs.vpc_id    
  subnet_ids = data.terraform_remote_state.vpc.outputs.private[*]

  eks_managed_node_groups = {
    general = {
      desired_size = 2
      min_size     = 2
      max_size     = 10

      labels = {
        role = "general"
      }

      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
    }
  }
}
