resource "yandex_compute_instance" "kittygram_vm" {
  name = "kittygram-vm"

  platform_id = "standart-v3"

  resources {
    memory = var.vm_memory
    cores  = var.vm_cores
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.image.id
      size     = var.vm_disk_size
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.kittygram_subnet.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.kittygram_sg.id]
  }

  metadata = {
    ssh-keys  = "ubuntu:${file(var.ssh_pub_key_path)}"
    user-data = file("cloud-init.yaml")
  }
}
