resource "aws_route" "private_subnet_nat_route" {
  route_table_id         = var.aws_route_table_PRATRTid_NAT
  destination_cidr_block = var .destination_ipv4_cidr_blockprat #"0.0.0.0/0"
  nat_gateway_id         = var.aws_nat_gateway_NAT_GWid
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = var.aws_subnet-PRATid
  route_table_id = var.aws_route_table_PRATRTid
}
resource "aws_route_table_association" "ass_sn" {
  subnet_id      = var.aws_subnet_PUB_id
  route_table_id = var.aws_route_table_PUBRTid
}
resource "aws_route" "ass_igw" {
  route_table_id = var.aws_route_table_PUBRTid_igw
  destination_cidr_block = var .destination_ipv4_cidr_block #"0.0.0.0/0"
  gateway_id     = var.aws_internet_gateway_IGW1id
  
}
