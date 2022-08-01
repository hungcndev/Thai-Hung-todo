resource "azurerm_static_site" "todap_fe" {
  name                = "${var.prefix}-fe"
  location            = "eastasia"
  resource_group_name = var.resource_group_name
  tags                = var.tags
  # source_control {
  #   repo_url           = "https://github.com/hungcndev/Thai-Hung-todo"
  #   branch             = "master"
  #   manual_integration = true
  #   use_mercurial      = false
  # }
}

resource "azurerm_app_service" "todap_be" {
  name                = "${var.prefix}-be"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  https_only          = true

  site_config {
    always_on = true
    cors {
      allowed_origins = ["*"]
    }
  }

  app_settings = {
    NODE_ENV   = "development"
    PORT       = 5001
    JWT_SECRET = "clocked"

    DB_HOST     = azurerm_postgresql_database.postgres_db.name
    DB_USER     = azurerm_postgresql_server.postgres_server.administrator_login
    DB_PASSWORD = azurerm_postgresql_server.postgres_server.administrator_login_password

    DOCKER_REGISTRY_SERVER_URL      = azurerm_container_registry.acr.login_server
    DOCKER_REGISTRY_SERVER_USERNAME = azurerm_container_registry.acr.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD = azurerm_container_registry.acr.admin_password

    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
  }

  depends_on = [
    azurerm_app_service_plan.appserviceplan,
    azurerm_container_registry.acr,
  ]

  tags = var.tags
}

