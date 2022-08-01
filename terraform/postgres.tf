resource "azurerm_postgresql_server" "postgres_server" {
  name                = "${var.prefix}-psqlserver"
  location            = var.resource_location
  resource_group_name = var.resource_group_name

  administrator_login          = "hung"
  administrator_login_password = "password@123"

  sku_name   = "B_Gen5_1"
  version    = "11"
  storage_mb = 5120

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  public_network_access_enabled    = true
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"

  tags = var.tags
}

resource "azurerm_postgresql_database" "postgres_db" {
  name                = "${var.prefix}-psqldb"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgres_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
