resource "aws_route_table" "PUBRT" {
  vpc_id = var.pub_route_table_vpcid
    tags = {
        Name = var.pubRT_name
    }
  
}

resource "aws_route_table" "PRATRT" {
  vpc_id = var.prt_route_table_vpcid

    tags = {
        Name =  var.prtRT_name
    }
}
output "myPUBRT" {
  description = "The ID of the PUBRT"
  value       = "${aws_route_table.PUBRT.id}"
}
output "myPRATRT" {
  description = "The ID of the PRATRT"
  value       = "${aws_route_table.PRATRT.id}"
}