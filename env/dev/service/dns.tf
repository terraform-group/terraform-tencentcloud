resource "tencentcloud_dnspod_record" "tfdemo" {
  domain      = "idevops.site"
  record_type = "A"
  record_line = "默认"
  value       = module.dev-clb.clb_instance_vip[0]
  sub_domain = "tfdemo"
}