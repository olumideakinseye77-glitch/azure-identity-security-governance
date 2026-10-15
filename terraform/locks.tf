resource "azurerm_management_lock" "key_vault" {
  name       = "lock-keyvault-delete"
  scope      = azurerm_key_vault.main.id
  lock_level = "CanNotDelete"

  notes = "Protects the Project 3 Key Vault from accidental deletion."
}
