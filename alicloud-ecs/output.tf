output "public_ip" {
  value = alicloud_instance.instance.public_ip
}

// Ansible inventory
resource "local_file" "inventory" {
  filename = "hosts.ini"
    content     = <<-EOF
    [Alicloud]
    ${alicloud_instance.instance.public_ip}

    [all:vars]
    ansible_python_interpreter=/usr/bin/python3
    EOF
}