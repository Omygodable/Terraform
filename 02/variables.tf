###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}



###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = ""
  description = "ssh-keygen -t ed25519"
}
variable "authorized_key_path" {
  type        = string
  description = "/home/mike/src/service acount/.authorized_key.json"
}
variable "vm_db_env"{
  type        = string
  default     = "prod"
  description = "Окружение (dev/test/production)."
}
variable "vm_web_env"{
  type        = string
  default     = "develop"
  description = "Окружение (dev/test/production)."
}

variable "vm_nm"{
  type        = string
  default     = "netology"
  description = "название"
}
variable "vm_db_prefix"{
  type        = string
  default     = "platform"
  description = "Префикс имени второй ВМ"
}
variable "vm_web_prefix"{
  type        = string
  default     = "platform1"
  description = "Префикс имени первой ВМ"
}




variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
  }))
  description = "Настройки ресурсов для ВМ."
}

variable "metadata" {
  type = map(string)
  description = "Общие метаданные для всех ВМ."
}
