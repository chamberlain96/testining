resource "aws_nat_gateway" "NAT_GW" {
  allocation_id = var.aws_eip_elasticipid
  connectivity_type = var.connectivity_type  #"public"
  subnet_id     = var.aws_subnetPUBid

 tags = {
    Name = var.NATGW_name
 }
}


resource "aws_eip" "elasticip" {
tags = {
    Name = var.elasticip_name
}
}
output "nat_gateway_ids" {
  value = "${aws_nat_gateway.NAT_GW.id}"
  }
  
output "eip_id" {
  value = "${aws_eip.elasticip.id}"
}