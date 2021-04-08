resource "alicloud_security_group" "default" {
  name = "default"
  vpc_id = alicloud_vpc.vpc.id
  inner_access_policy = "Accept"
}

resource "alicloud_security_group_rule" "allow_ssh" {
  # Refer the security group ID
  security_group_id = alicloud_security_group.default.id
  type              = "ingress"
  ip_protocol       = "tcp"
  # Since the security group is for using in the VPC, you need to set it to intranet: https://www.terraform.io/docs/providers/alicloud/r/security_group_rule.html
  nic_type          = "intranet"
  policy            = "accept"
  cidr_ip           = "0.0.0.0/0"
  port_range        = "22/22"
  priority          = 1
}

resource "alicloud_security_group_rule" "allow_2277" {
  security_group_id = alicloud_security_group.default.id
  type              = "ingress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  cidr_ip           = "0.0.0.0/0"
  port_range        = "2277/2277"
  priority          = 2
}

resource "alicloud_security_group_rule" "mosh" {
  security_group_id = alicloud_security_group.default.id
  type              = "ingress"
  ip_protocol       = "udp"
  nic_type          = "intranet"
  policy            = "accept"
  cidr_ip           = "0.0.0.0/0"
  port_range        = "60000/60020"
  priority          = 3
}

resource "alicloud_security_group_rule" "dns" {
  security_group_id = alicloud_security_group.default.id
  type              = "egress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  cidr_ip           = "0.0.0.0/0"
  port_range        = "53/53"
  priority          = 4
}

resource "alicloud_security_group_rule" "http" {
  security_group_id = alicloud_security_group.default.id
  type              = "egress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  cidr_ip           = "0.0.0.0/0"
  port_range        = "80/80"
  priority          = 5
}

resource "alicloud_security_group_rule" "https" {
  security_group_id = alicloud_security_group.default.id
  type              = "egress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  cidr_ip           = "0.0.0.0/0"
  port_range        = "443/443"
  priority          = 6
}

resource "alicloud_security_group_rule" "tor" {
  security_group_id = alicloud_security_group.default.id
  type              = "egress"
  ip_protocol       = "tcp"
  nic_type          = "intranet"
  policy            = "accept"
  cidr_ip           = "0.0.0.0/0"
  port_range        = "9050/9051"
  priority          = 7
}

resource "alicloud_security_group_rule" "wireguard" {
  security_group_id = alicloud_security_group.default.id
  type              = "ingress"
  ip_protocol       = "udp"
  nic_type          = "intranet"
  policy            = "accept"
  cidr_ip           = "0.0.0.0/0"
  port_range        = "51820/51820"
  priority          = 8
}

