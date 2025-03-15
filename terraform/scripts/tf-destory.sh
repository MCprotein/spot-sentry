#!/bin/bash
# 비싼 자원들 제거
terraform destroy -target awb_ebs_volume.sentry \
           -target aws_instance.sentry \
           -target aws_ami.sentry \
           -target aws_volume_attachment.sentry \
           -target aws_network_interface.sentry