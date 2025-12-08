resource "yandex_compute_instance" "web_server" {
  count = 2

  name = "web-${count.index+1}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8jgooo35tigfr6kj9g" # Debian 11 Image ID
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

  depends_on = [yandex_compute_instance.db_server]
}