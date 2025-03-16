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

