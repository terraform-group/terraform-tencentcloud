output "clb_instance_id" {
    value = tencentcloud_clb_instance.internal_clb.id
}

output "clb_instance_vip" {
    value = tencentcloud_clb_instance.internal_clb.clb_vips
}