data "tencentcloud_instance_types" "t2c2g" {
  cpu_core_count   = 2
  memory_size      = 2
  exclude_sold_out = true
  filter {
    name   = "instance-family"
    values = ["S3"]
  }
  filter {
    name   = "zone"
    values = ["ap-beijing-2"]
  }

  filter {
    name   = "instance-charge-type"
    values = ["POSTPAID_BY_HOUR"]
  }
}

data "tencentcloud_images" "images" {
  image_type = ["PUBLIC_IMAGE"]
  os_name    = "centos 7.5"
}

# output "instance_type" {
#   value = data.tencentcloud_instance_types.t2c2g.instance_types.0.instance_type
# }

# output "image_id" {
#     value = data.tencentcloud_images.images.images[0].image_id
# }

locals {
  instance_name     = "dev-instance"
  instance_type     = data.tencentcloud_instance_types.t2c2g.instance_types.0.instance_type
  image_id          = data.tencentcloud_images.images.images[0].image_id
  security_group_id = [data.terraform_remote_state.network-data.outputs.security_group_id]
  availability_zone = "ap-beijing-2"
  counts            = 2
  vpc_id            = data.terraform_remote_state.network-data.outputs.vpc_id
  subnet_id         = data.terraform_remote_state.network-data.outputs.subnet_id
}

module "dev-cvm" {
  source            = "../../../modules/cvm"
  count             = local.counts
  instance_name     = "${local.instance_name}-${count.index}"
  instance_type     = local.instance_type
  image_id          = local.image_id
  security_group_id = local.security_group_id
  availability_zone = local.availability_zone
  vpc_id            = local.vpc_id
  subnet_id         = local.subnet_id
}