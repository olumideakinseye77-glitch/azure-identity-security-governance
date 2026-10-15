resource "azurerm_user_assigned_identity" "workload" {
  name                = "id-olu-governance-workload"
  location            = azurerm_resource_group.governance.location
  resource_group_name = azurerm_resource_group.governance.name

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Owner       = "Olu"
  }
}
