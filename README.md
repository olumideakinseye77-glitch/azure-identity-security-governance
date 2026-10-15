# Azure Identity, Security & Governance Platform

Azure Cloud Engineering portfolio project focused on identity, RBAC, Key Vault, managed identities, Azure Policy, governance, and security automation with Terraform.

## Project Status

**Current phase:** Governance and RBAC foundation  
**Overall progress:** In progress

## Goals

This project demonstrates:

- Azure RBAC and least-privilege access
- Service principals and managed identities
- Azure Key Vault
- Azure Policy and governance enforcement
- Resource locks
- Monitoring and auditability
- Terraform-first Infrastructure as Code
- GitHub Actions CI
- Azure OIDC authentication
- Deliberate security and governance failure tests

## Completed So Far

- [x] Create project structure
- [x] Create Terraform foundation
- [x] Create governance resource group
- [x] Create custom policy requiring the `Environment` tag
- [x] Assign the policy at resource-group scope
- [x] Prove policy denial using a deliberately non-compliant storage account
- [x] Create a dedicated test service principal
- [x] Assign Reader access at resource-group scope
- [ ] Validate read vs write RBAC behaviour
- [ ] Add managed identity
- [ ] Add Key Vault
- [x] Add resource locks
- [x] Add monitoring and audit evidence
- [x] Add GitHub Actions and OIDC
- [ ] Complete final architecture and troubleshooting documentation


## Validation Evidence

- Azure Policy denied creation of a storage account without the required `Environment` tag with `RequestDisallowedByPolicy`.
- A Reader-scoped service principal could read the project resource group but was denied `Microsoft.Storage/storageAccounts/write` with `AuthorizationFailed`.
- A user-assigned managed identity retrieved a Key Vault secret using Azure RBAC without a stored application password.
- The Key Vault `CanNotDelete` management lock blocked an attempted deletion with `ScopeLocked`.


## Monitoring and Audit Evidence

- Azure Activity Log captured management operations including container lifecycle actions, management lock creation, RBAC changes, Key Vault changes, and managed identity creation.
- Azure Policy state showed the custom `require-environment-tag` policy evaluating project resources as compliant.
- RBAC listing confirmed the dedicated test service principal retained the `Reader` role at the project resource-group scope.


## CI/CD and OIDC Validation

- GitHub Actions validates Terraform formatting and configuration on changes to the Terraform code.
- GitHub Actions authenticates to Azure using OpenID Connect (OIDC) with no stored client secret.
- The workflow successfully verified Azure access to the project resource group.
