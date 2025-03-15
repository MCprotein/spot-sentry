resource "aws_ebs_volume" "sentry" {
  availability_zone = "ap-northeast-2c"
  size              = 20

  tags = {
    Name = "aws_ebs_volume_this"
  }
}

data "aws_ami" "sentry" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  tags = {
    Name = "aws_ami_sentry"
  }
}

resource "aws_instance" "sentry" {
  ami = data.aws_ami.sentry.id
  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = "0.089"
    }
  }
  instance_type = "t3a.xlarge"


  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.sentry.id
  }

  tags = {
    Name = "aws_instance_sentry"
  }
}

resource "aws_volume_attachment" "sentry" {
  device_name = "/dev/sdf"
  instance_id = aws_instance.sentry.id
  volume_id   = aws_ebs_volume.sentry.id
}