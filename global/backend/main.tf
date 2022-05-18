provider "tencentcloud" {
  region = var.region
}

//获取用户的APP_ID
data "tencentcloud_user_info" "users" {}

# output "app_id" {
#     value = data.tencentcloud_user_info.users.app_id
# }


resource "tencentcloud_cos_bucket" "mycos" {
  bucket            = "tfbackend-${data.tencentcloud_user_info.users.app_id}"
  acl               = "private"
  versioning_enable = true
}
