resource "yandex_compute_instance" "db_server" {
  for_each = { for i, val in var.each_vm : i => val }

  name = each.value.vm_name

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }

  boot_disk {
    initialize_params {
      image_id = "fd8jgooo35tigfr6kj9g" # Debian 11 Image ID
      size     = each.value.disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = {
    ssh-keys = var.public_ssh_key
  }

  allow_stopping_for_update = true

}