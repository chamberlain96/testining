resource "aws_vpc" "MYVPC1" {
  cidr_block = var.cidr_block#"10.0.0.0/16"
  tags = {
    Name = var.vpc_name
  }
}
output "vpc_id" {
  value = "${aws_vpc.MYVPC1.id}" #vpc343425254362673536
}
