locals {
  web_map = zipmap([for idx, server in yandex_compute_instance.web_server : server.id], yandex_compute_instance.web_server)
  db_map  = zipmap([for idx, server in values(yandex_compute_instance.db_server) : server.id], values(yandex_compute_instance.db_server))
}

resource "local_file" "inventory" {
  filename = "${path.module}/inventory.ini"
  content  = templatefile("${path.module}/inventory.tpl", {
    web_servers     = values(local.web_map)
    database_servers = values(local.db_map)
    storage         = yandex_compute_instance.storage
  })
}
output "debug_data" {
  value = yandex_compute_instance.web_server[0].network_interface[0].nat_ip_address
}
output "debug_types" {
  value = {
    web_servers     = values(local.web_map)
    database_servers = values(local.db_map)
    storage         = yandex_compute_instance.storage
  }
}

output "debug_web_servers" {
  value = values(local.web_map)
}

output "debug_database_servers" {
  value = values(local.db_map)
}

output "debug_storage" {
  value = yandex_compute_instance.storage
}

output "debug_external_ip" {
  value = yandex_compute_instance.web_server[0].network_interface[0].nat_ip_address
}

