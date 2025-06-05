variable "yc_token" {
  description = "API токен для доступа к Yandex Cloud"
  type        = string
}

variable "yc_cloud_id" {
  description = "ID облака в Yandex Cloud"
  type        = string
}

variable "yc_folder_id" {
  description = "ID каталога в Yandex Cloud"
  type        = string
}

variable "yc_zone" {
  description = "Зона доступности (ru-central1-a)"
  type        = string
  default     = "ru-central1-b"
}

variable "subnet_cidr" {
  description = "CIDR блок для подсети"
  type        = list(string)
  default     = ["192.168.10.0/24"]
}

variable "vm_core" {
  description = "Количество ядер VM"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Количество оперативной памяти VM"
  type        = number
  default     = 4
}

variable "vm_disk_size" {
  description = "Количество памяти хранилиша VM"
  type        = number
  default     = 20
}

variable "vm_image_id" {
  description = "ID для загрузочного диска ВМ"
  type        = string
  default     = "fd80bm0rh4rkepi5ksdi" # ubuntu-24-04-lts-v20250324
}

variable "ssh_pub_key_path" {
  description = "Путь к публичному SSH-ключу"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}