output "vpc_id" {
  value = module.dev-vpc.vpc_id

}

output "subnet_id" {
  value = module.dev-vpc.subnet_id
}

output "security_group_id" {
  value = module.dev-sec-group.security_group_id
}