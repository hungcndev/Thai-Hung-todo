resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "${var.prefix}-asp"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Basic"
    size = "B1"
  }
  tags = var.tags
}
