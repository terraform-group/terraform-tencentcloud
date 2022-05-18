# Create security group
resource "tencentcloud_security_group" "default" {
  name        = var.security_group_name
  description = var.security_group_desc
}

resource "tencentcloud_security_group_rule" "web" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "80,8080"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "ssh" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "ingress"
  cidr_ip           = "0.0.0.0/0"
  ip_protocol       = "tcp"
  port_range        = "22"
  policy            = "accept"
}

resource "tencentcloud_security_group_rule" "all" {
  security_group_id = tencentcloud_security_group.default.id
  type              = "egress"
  cidr_ip           = "0.0.0.0/0"
  policy            = "accept"
}