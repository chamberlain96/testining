resource "aws_internet_gateway" "IGW1" {
  vpc_id =  var.IGW_vpc_id

  tags = {
    Name =  var.igw_name
  }
}

output "my_igw_id" {
  description = "The ID of the Internet Gateway"
  value       = "${aws_internet_gateway.IGW1.id}"
}