locals {
  agw_name                       = "agw-${local.environment_id}"
  environment_id                 = "${var.instance_id}-${var.environment}"
  frontend_ip_configuration_name = "public"
  backend_address_pool_name      = "private"
  ssl_certificate_name           = "ssl"

}