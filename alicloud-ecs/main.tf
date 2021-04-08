terraform { # Terraform related configs
  backend "local" { # We use local backend to keep it simple
    path = "terraform.tfstate" # The file where the Terraform states stores in
  }
}

provider "alicloud" {
  # Here you can find the "Region ID": https://www.alibabacloud.com/help/doc-detail/40654.htm
 # How to create a pair of access_key and secret_key: https://www.alibabacloud.com/help/doc-detail/53045.htm
  access_key = var.key
  secret_key = var.secret 
  region     = var.region
}

resource "alicloud_vpc" "vpc" {
  vpc_name     = "tf_test_foo"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "vsw" {
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "172.16.0.0/21"
  zone_id = var.zone 
}


resource "alicloud_key_pair" "default" {
  key_name   = "alicloud.pub"
  public_key = var.public_key_path
}

resource "alicloud_instance" "instance" {
  availability_zone = var.zone 
  security_groups = alicloud_security_group.default. *.id
  host_name       = var.host_name
  key_name        = alicloud_key_pair.default.key_name
  vswitch_id      = alicloud_vswitch.vsw.id # Refer to the vswitch ID                = 
  instance_type        = "ecs.hfg6.large"
  instance_charge_type = "PostPaid" # Of course post paid!
  system_disk_category = "cloud_efficiency"
  image_id             = "ubuntu_18_04_64_20G_alibase_20190624.vhd"
  instance_name        = "test_foo"
  #password = "<replace_with_your_password>"
    # You can find the image IDs on https://ecs.console.aliyun.com/ > Instances & Images > Images > Public Image
  system_disk_size              = 20
  # Disable the useless "security enhancement" features
  security_enhancement_strategy = "Deactive"
  credit_specification = "Standard"
  spot_strategy        = "NoSpot"

  internet_max_bandwidth_in  = 100
  internet_max_bandwidth_out = 100
  internet_charge_type       = "PayByTraffic" # Of course pay by traffic!!
}



