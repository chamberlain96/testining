module "myvpc"{
    source                             = "../../modules/VPC"
    cidr_block                          = "10.0.0.0/16"
    vpc_name                             = "JOEL"
    vpc_id                                = "${module.myvpc.vpc_id}"
}

module "subnets"{
    source                             = "../../modules/subnets"
    prt_vpc_id                          = "${module.myvpc.vpc_id}"
    prt_subnet_cidr                      = "10.0.2.0/24"
    prtsn_name                            = "joelprt"

    public_vpc_id                      =  "${module.myvpc.vpc_id}"
    pubsn_name                          = "lyongapub"
    public_subnet_cidr                   = "10.0.3.0/24"

    NACL_name                           = "NACL"
    vpc_idnacl                     = "${module.myvpc.vpc_id}"
    public_subnet_id                    =   "${module.subnets.PUB_subnet_id}"
    private_subnet_id                     = "${module.subnets.PRAT_subnet_id}"
    public_nacl_id                      =  "${module.subnets.nacl_id}"
    private_nacl_id                      =  "${module.subnets.nacl_id}"
}
module "IGW_block" {
    source                             = "../../modules/IGW"
    IGW_vpc_id                          ="${module.myvpc.vpc_id}"
    igw_name                             = "lyongapubIGW"
  }

module "rtandroutes"{
    source                              = "../../modules/RT $ Routes"
    pubRT_name                           = "lyongapubrt"
    pub_route_table_vpcid                 = "${module.myvpc.vpc_id}"
    aws_subnet_PUB_id                      = "${module.subnets.PUB_subnet_id}"
    aws_route_table_PUBRTid                = "${module.rtandroutes.myPUBRT}"
    aws_route_table_PUBRTid_igw             = "${module.rtandroutes.myPUBRT}"
    destination_ipv4_cidr_block              = "0.0.0.0/0"
    aws_internet_gateway_IGW1id               = "${module.IGW_block.my_igw_id}"
   
    prtRT_name                          = "joelprtrt"
    prt_route_table_vpcid                = "${module.myvpc.vpc_id}"
    aws_subnet-PRATid                     = "${module.subnets.PRAT_subnet_id}"
    aws_route_table_PRATRTid               = "${module.rtandroutes.myPRATRT}"
    aws_route_table_PRATRTid_NAT            = "${module.rtandroutes.myPRATRT}"
    destination_ipv4_cidr_blockprat          = "0.0.0.0/0"
    aws_nat_gateway_NAT_GWid                  = "${module.natGW_EIP.nat_gateway_ids}"
}

module "natGW_EIP" {
    source                              = "../../modules/NATGW"
    elasticip_name                       = "natelsip"
    aws_eip_elasticipid                   = "${module.natGW_EIP.eip_id}"
    connectivity_type                       = "public"
    aws_subnetPUBid                        = "${module.subnets.PUB_subnet_id}"
    NATGW_name                              = "joelNGW"
 
  
}
module "ec2_instances" {
    source                                = "../../modules/EC2"
     ec2_count                              = "1"
     ami_id                                  = "ami-050e8a1e3661ac6b9"
     subnet_id                                 = "${module.subnets.PUB_subnet_id}"
     instance_tag                              = "travis12"
     instance_type                                = "t2.micro"
     associate_public_ip                             = true
     public_sg_name = "pub-sg"
    vpcidpubsg                            ="${module.myvpc.vpc_id}"
     
     
     ec2_count_prt                                 = "1"
     ami_id_prt                                      = "ami-050e8a1e3661ac6b9"
     subnet_id_prt                                     = "${module.subnets.PRAT_subnet_id}"
     instance_tag_prt                                     = "travis96"
     private_sg_name                                        = "prat-sg"
     instance_type_prt                                           = "t2.micro"
     vpcidpratsg                                            = "${module.myvpc.vpc_id}"
}
 