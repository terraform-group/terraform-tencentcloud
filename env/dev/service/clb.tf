locals {
  clb_name          = "dev-clb"
  vpc_ids           = data.terraform_remote_state.network-data.outputs.vpc_id
  subnet_ids        = data.terraform_remote_state.network-data.outputs.subnet_id
  env_name          = "dev"
  listener_name     = "dev-listener"
  listener_port     = 80
  listener_protocol = "TCP"
  scheduler         = "WRR"
  instance_ids      = module.dev-cvm.*.instance_id
  backend_port      = 80
  backend_weight    = 100
}

module "dev-clb" {
  source            = "../../../modules/clb"
  clb_name          = local.clb_name
  vpc_id            = local.vpc_ids
  subnet_id         = local.subnet_ids
  env_name          = local.env_name
  listener_name     = local.listener_name
  listener_port     = local.listener_port
  listener_protocol = local.listener_protocol
  scheduler         = local.scheduler
  instance_ids      = local.instance_ids
  backend_port      = local.backend_port
  backend_weight    = local.backend_weight
}