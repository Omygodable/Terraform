data "yandex_compute_image" "debian" {
  family = "debian-11"
}

resource "yandex_compute_disk" "data_disks" {
  count   = 3
  name    = "data-disk-${count.index}"
  size    = 1
  zone    = var.default_zone
  type    = "network-hdd"
}

resource "yandex_compute_instance" "storage" {
  name = "storage"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.debian.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  allow_stopping_for_update = true

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.data_disks
    content {
      disk_id = secondary_disk.value.id
    }
  }

  metadata = {
    ssh-keys = var.public_ssh_key
  }
}