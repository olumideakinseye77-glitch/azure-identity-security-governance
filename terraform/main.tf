resource "azurerm_resource_group" "governance" {
  name     = "rg-olu-identity-security-governance"
  location = var.location

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Owner       = "Olu"
  }
}
