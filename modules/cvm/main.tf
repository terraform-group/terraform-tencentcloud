resource "tencentcloud_instance" "instance" {
  instance_name              = var.instance_name
  availability_zone          = var.availability_zone
  image_id                   = var.image_id
  instance_type              = var.instance_type
  system_disk_type           = "CLOUD_PREMIUM"
  system_disk_size           = 50
  allocate_public_ip         = false
#   internet_charge_type       = "BANDWIDTH_POSTPAID_BY_HOUR"
  internet_max_bandwidth_out = 0
  security_groups            = var.security_group_id
  vpc_id                     = var.vpc_id
  subnet_id                  = var.subnet_id
  password                   = "root@123"
  user_data_raw              =  <<-EOF
                                #!/bin/bash 
                                yum -y install nginx 
                                echo `hostname` >/usr/share/nginx/html/index.html
                                systemctl restart nginx 
                                EOF
  lifecycle {
    create_before_destroy = true
  }
}