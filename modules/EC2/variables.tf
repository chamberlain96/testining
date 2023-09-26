variable "ec2_count" {
    default = "1"
}

variable "ami_id" {}
 
 

variable "instance_type" {
    default = "t2.micro"
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP address with the EC2 instance"
  type        = bool
  default     = true  # Set to true by default, but can be overridden
}

variable "subnet_id" {}

variable "instance_tag" {
    default = "travis23"
}
 
#prat
variable "ec2_count_prt" {
    default = "1"
}

variable "ami_id_prt" {}

variable "instance_type_prt" {
    default = "t2.micro"
}

variable "subnet_id_prt" {}

variable "instance_tag_prt" {
    default = " travis1"
} 
  
variable "public_sg_name" {
  description = "Name for the public security group"
  default     = "public-sg"
}

variable "private_sg_name" {
  description = "Name for the private security group"
  default     = "private-sg"
}
variable "vpcidpratsg" {
    type = string
  
}
variable "vpcidpubsg" {
    type = string
  
}