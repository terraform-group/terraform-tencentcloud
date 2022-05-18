resource "tencentcloud_clb_instance" "internal_clb" {
  network_type = "OPEN"
  clb_name     = var.clb_name
  vpc_id       = var.vpc_id
#   subnet_id    = var.subnet_id

  tags = {
    test = var.env_name
  }
}

resource "tencentcloud_clb_listener" "listener" {
  clb_id        = tencentcloud_clb_instance.internal_clb.id
  listener_name = var.listener_name
  port          = var.listener_port
  protocol      = var.listener_protocol
  health_check_switch        = true
  health_check_time_out      = 2
  health_check_interval_time = 5
  health_check_health_num    = 3
  health_check_unhealth_num  = 3
  session_expire_time        = 30
  scheduler                  = var.scheduler
}


resource "tencentcloud_clb_attachment" "foo" {
  clb_id      = tencentcloud_clb_instance.internal_clb.id
  listener_id = tencentcloud_clb_listener.listener.listener_id

  dynamic "targets" {
    for_each = [for instance in var.instance_ids : instance]
    content {
      instance_id = targets.value
      port        = var.backend_port
      weight      = var.backend_weight
    }
  }
}

