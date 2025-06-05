resource "yandex_compute_instance" "kittygram_vm" {
  name = "kittygram-vm"

  platform_id = "standard-v3"

  resources {
    memory = var.vm_memory
    cores  = var.vm_core
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image_id
      size     = var.vm_disk_size
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.kittygram_subnet.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.kittygram_sg.id]
  }

  metadata = {
    SSH_KEY  = var.ssh_pub_key
    user-data = file("cloud-init.yaml")
  }
}
