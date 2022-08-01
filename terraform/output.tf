output "postgresql_server_id" {
  value = azurerm_postgresql_server.postgres_server.id
}

output "postgresql_database_id" {
  value = azurerm_postgresql_database.postgres_db.id
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "app_service_plan_id" {
  value = azurerm_app_service_plan.appserviceplan.id
}

output "app_service_id" {
  value = azurerm_app_service.todap_be.id
}
