resource "aws_instance" "pubec2" {
    count = "${var.ec2_count}"
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.subnet_id}"
    vpc_security_group_ids = [aws_security_group.public_sg.id]
    associate_public_ip_address = var.associate_public_ip
    tags = {
         Name = "${var.instance_tag}"
  }
}

resource "aws_instance" "prtec2" {
    count = "${var.ec2_count_prt}"
    ami = "${var.ami_id_prt}"
    instance_type = "${var.instance_type_prt}"
    vpc_security_group_ids = [aws_security_group.private_sg.id]
    subnet_id = "${var.subnet_id_prt}"
    tags = {
         Name = "${var.instance_tag_prt}"
  }
}

resource "aws_security_group" "public_sg" {
  name_prefix = var.public_sg_name
  vpc_id = var.vpcidpubsg 

  # Ingress rules for public security group
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule allowing all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  tags = {
    Name = "public-SG"
  }
}



resource "aws_security_group" "private_sg" {
  name_prefix = var.private_sg_name
  vpc_id =  var.vpcidpratsg


  # Ingress rules for private security group
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # Egress rule allowing all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["10.0.0.0/16"]
  }
  
  tags = {
    Name = "private-SG"
  }
}



 
 
  