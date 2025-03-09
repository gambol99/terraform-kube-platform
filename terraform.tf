terraform {
  required_version = ">= 1.6.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.0-pre2"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = "2.1.3"
    }
  }
}
