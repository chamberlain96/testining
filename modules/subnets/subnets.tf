resource "aws_subnet" "PUB" {
  vpc_id     =  var.public_vpc_id
  cidr_block = var.public_subnet_cidr#"10.0.1.0/24"

  tags = {
    Name =  var.pubsn_name
  }
}

resource "aws_subnet" "PRAT" {
  vpc_id     = var.prt_vpc_id
  cidr_block = var.prt_subnet_cidr#"10.0.2.0/24"

  tags = {
    Name = var.prtsn_name
  }
}




#NACL
resource "aws_network_acl" "NACL" {
  vpc_id   = var.vpc_idnacl
  tags = {
    Name = var.NACL_name
  }
}

resource "aws_network_acl_rule" "ingress_allow_all" {
  network_acl_id = aws_network_acl.NACL.id
  rule_number    = 100  # You can adjust the rule number as needed
  egress         = false
  protocol       = "-1"  # TCP protocol
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65535
}

resource "aws_network_acl_rule" "egress_allow_all" {
  network_acl_id = aws_network_acl.NACL.id
  rule_number    = 200  # You can adjust the rule number as needed
  egress         = true
  protocol       = "-1"  # TCP protocol
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 65535
}


resource "aws_network_acl_association" "public_subnet_association" {
  subnet_id          = var.public_subnet_id
  network_acl_id     = var.public_nacl_id
} 

resource "aws_network_acl_association" "private_subnet_association" {
  subnet_id          = var.private_subnet_id
  network_acl_id     = var.private_nacl_id
}  

 

output "PUB_subnet_id" {
value = "${aws_subnet.PUB.id}" 
}
output "PRAT_subnet_id" {
value = "${aws_subnet.PRAT.id}" 
}
output "nacl_id" {
  description = "ID of the created Network ACL"
  value       = "${aws_network_acl.NACL.id}"
}
