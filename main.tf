locals {
  domain = (var.vpc == true) ? "vpc" : null
}

resource "aws_eip" "this" {
  instance                  = var.instance
  network_interface         = var.network_interface
  associate_with_private_ip = var.associate_with_private_ip
  public_ipv4_pool          = var.public_ipv4_pool
  domain                    = local.domain

  tags = merge(var.tags, { "Name" = var.name })
}
