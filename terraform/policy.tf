resource "azurerm_policy_definition" "require_environment_tag" {
  name         = "require-environment-tag"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Require Environment tag"

  metadata = jsonencode({
    category = "Governance"
  })

  policy_rule = jsonencode({
    if = {
      field  = "tags['Environment']"
      exists = "false"
    }

    then = {
      effect = "deny"
    }
  })
}

resource "azurerm_resource_group_policy_assignment" "require_environment_tag" {
  name                 = "require-env-tag"
  resource_group_id    = azurerm_resource_group.governance.id
  policy_definition_id = azurerm_policy_definition.require_environment_tag.id

  display_name = "Require Environment tag on resources"
  description  = "Blocks resources that do not include the Environment governance tag."
}
