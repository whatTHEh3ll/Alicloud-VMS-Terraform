provider "alicloud" {
  alias  = "bj-prod"
  access_key = var.key
  secret_key = var.secret 
  region = var.region
}

resource "random_string" "random-name" {
  length  = 7
  upper   = false
  lower   = true
  number  = true
  special = false
}

resource "alicloud_oss_bucket" "bucket-new" {
  provider = alicloud.bj-prod

  bucket = "terraform-oss-backend-${random_string.random-name.result}"
  acl    = "private"
}