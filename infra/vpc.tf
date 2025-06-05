resource "yandex_vpc_network" "kittygram_network" {
  name = "kittygram-network"
}

resource "yandex_vpc_subnet" "kittygram_subnet" {
  name           = "kittygram-subnet"
  zone           = var.zone
  v4_cidr_blocks = var.subnet_cidr
  network_id     = yandex_vpc_network.kittygram_network.id
}

resource "yandex_vpc_security_group" "kittygram_sg" {
  name       = "kittygram-sg"
  network_id = yandex_vpc_network.kittygram_network.id

  egress {
    protocol       = "ANY"
    from_port      = 0
    to_port        = 65535
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    port           = "22"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "TCP"
    port           = "80"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}