locals {
  vm_web_name = "${var.vm_nm}-${var.vm_web_prefix}-${var.vm_web_env}"
  vm_db_name  = "${var.vm_nm}-${var.vm_db_prefix}-${var.vm_db_env}"
}