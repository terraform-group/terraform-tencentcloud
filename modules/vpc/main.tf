
resource "tencentcloud_vpc" "vpc" {
    name         = var.vpc_name
    cidr_block   = var.vpc_cidr_block
    tags = {
        "env" = var.env_name
    }
}

resource "tencentcloud_subnet" "subnet" {
  availability_zone = var.availability_zone
  name              = var.subnet_name
  vpc_id            = tencentcloud_vpc.vpc.id
  cidr_block        = var.subnet_cidr_block
}