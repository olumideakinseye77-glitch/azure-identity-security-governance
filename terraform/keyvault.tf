data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
  name                = "kv-olu-gov-0be06fbd"
  location            = azurerm_resource_group.governance.location
  resource_group_name = azurerm_resource_group.governance.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name                   = "standard"
  rbac_authorization_enabled = true

  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Owner       = "Olu"
  }
}

resource "azurerm_role_assignment" "managed_identity_keyvault_secrets" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_user_assigned_identity.workload.principal_id
}
