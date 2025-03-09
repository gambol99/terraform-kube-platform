<!-- markdownlint-restore -->
<!--
  ***** CAUTION: DO NOT EDIT ABOVE THIS LINE ******
-->

![Github Actions](https://github.com/appvia/terraform-aws-module-template/actions/workflows/terraform.yml/badge.svg)

# Terraform Kubernetes Onboarding Module

## Description

This module is used to onboard a new Kubernetes cluster as a hub or spoke cluster, using the platform pattern outline in the [Kubernetes Platform](https://github.com/gambol99/kubernetes-platform). Please visit the following

- [Kubernetes Platform](https://gambol99.github.io/kubernetes-platform/) - the platform documentation
- [Kubernetes Platform Repository](https://github.com/gambol99/kubernetes-platform) - the platform repository
- [Platform Tenant Repository](https://github.com/gambol99/platform-tenant/) - an example tenant repository, consuming the platform and this module.

## Usage

The following example demonstrates how to use the module to provision the platform

```hcl
## Provision and bootstrap the platform using an tenant repository
module "platform" {
  count  = local.enable_platform ? 1 : 0
  source = "github.com/gambol99/terraform-aws-eks//modules/platform?ref=v0.1.1"

  ## Name of the cluster
  cluster_name = local.cluster_name
  # The type of cluster
  cluster_type = local.cluster_type
  # Any repositories to be provisioned
  repositories = var.argocd_repositories
  ## The platform repository
  platform_repository = local.platform_repository
  # The location of the platform repository
  platform_revision = local.platform_revision
  # The location of the tenant repository
  tenant_repository = local.tenant_repository
  # You pretty much always want to use the HEAD
  tenant_revision = local.tenant_revision
  ## The tenant repository path
  tenant_path = local.tenant_path

  depends_on = [
    module.eks
  ]
}
```

## Update Documentation

The `terraform-docs` utility is used to generate this README. Follow the below steps to update:

1. Make changes to the `.terraform-docs.yml` file
2. Fetch the `terraform-docs` binary (https://terraform-docs.io/user-guide/installation/)
3. Run `terraform-docs markdown table --output-file ${PWD}/README.md --output-mode inject .`

<!-- BEGIN_TF_DOCS -->

## Providers

No providers.

## Inputs

No inputs.

## Outputs

No outputs.

<!-- END_TF_DOCS -->
