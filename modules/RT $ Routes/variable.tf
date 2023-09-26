variable "pubRT_name" {
     description = "pub route table name"
    type = string 
    default = "PUBRT"
}

variable "pub_route_table_vpcid" {
     description = "pub route table vpcid"
    type = string 
    default = "MYvpc2"
}

variable "prtRT_name" {
     description = "prt route table name"
    type = string 
    default = "PRT"
}

variable "prt_route_table_vpcid" {
     description = "pub route table vpcid"
    type = string 
    default = "MYvpc2"
}


# ASS rt
variable "aws_subnet_PUB_id" {
    type = string
    default = "TRAVIS PUB"
}
variable "aws_route_table_PUBRTid" {
    type = string
    default = "PUBRT"
}
variable "aws_route_table_PUBRTid_igw" {
    type = string
    default = "PUBRT"
}
variable "destination_ipv4_cidr_block" {
    type = string
    default = "0.0.0.0/0"
}
variable "aws_internet_gateway_IGW1id" {
    type = string
    default = "IGW12"
}
#var prat
variable "aws_subnet-PRATid" {
    type = string
    default = "TRAVIS Prat"
}
variable "aws_route_table_PRATRTid" {
    type = string
    default = "PRTRT"
}
variable "aws_route_table_PRATRTid_NAT" {
    type = string
    default = "PRTRT"
}
variable "destination_ipv4_cidr_blockprat" {
    type = string
    default = "0.0.0.0/0"
}
variable "aws_nat_gateway_NAT_GWid" {
    type = string
    default = "NAT22"
}