variable "prt_vpc_id" {
    description = "vpc id prat"
    type = string
    default = "MYvpc2"
}

variable "prt_subnet_cidr" {
    description = " prat subnet cidr"
    type = string
    default = "10.0.2.0/24"
  
}

variable "prtsn_name" {
    description = " prat subnet name"
    type = string
    default = "TRAVIS PRAT"
}



#SBNT VAR.PUB
variable "public_vpc_id" {
    description = "vpc id pub"
    type = string
    default = "MYvpc2"
}
variable "pubsn_name" {
    description = " pub subnet name"
    type = string
    default = "TRAVIS PUB"
}
 
variable "public_subnet_cidr" {
    description = " public subnet cidr"
    type = string
    default = "10.0.3.0/24"
}



#NACL
variable "vpc_idnacl" {
    type = string

  
}
variable "public_subnet_id" {
  description = "ID of the public subnet to associate with the NACL"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet to associate with the NACL"
  type        = string
}
 
 variable "NACL_name" {
    type = string
    default = "NACL"
 }
variable "public_nacl_id" {
    type = string
  
}
variable "private_nacl_id" {
    type = string
  
}
 