locals {
  security_group_name = "dev-sec-group"
  security_group_desc = "dev env group"
}

module "dev-sec-group" {
  source              = "../../../modules/security_group"
  security_group_desc = local.security_group_desc
  security_group_name = local.security_group_name
}