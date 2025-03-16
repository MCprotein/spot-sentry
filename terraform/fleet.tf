resource "aws_launch_template" "sentry" {
  name_prefix   = "aws_launch_template_sentry-"
  image_id      = data.aws_ami.sentry.id
  instance_type = "t3a.xlarge"

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = "0.089"
    }
  }

  network_interfaces {
    device_index         = 0
    network_interface_id = aws_network_interface.sentry.id
  }

  block_device_mappings {
    device_name = "/dev/sdf"
    ebs {
      volume_size = 20
      volume_type = "gp2"
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "aws_launch_template_sentry"
    }
  }
}

resource "aws_ec2_fleet" "sentry" {
  type = "maintain"
  launch_template_config {
    launch_template_specification {
      launch_template_id = aws_launch_template.sentry.id
      version            = aws_launch_template.sentry.latest_version
    }
  }

  target_capacity_specification {
    default_target_capacity_type = "spot"
    total_target_capacity        = 2
  }

  terminate_instances                 = true
  terminate_instances_with_expiration = true
}