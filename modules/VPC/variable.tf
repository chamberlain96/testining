variable "cidr_block" {
    description = "vpc cidr block"
    type        = string
    default     = "10.0.0.0/16"

} 

variable "vpc_name" {
    description = "vpc tags"
    type = string
    default = "MYvpc2"
}
variable "vpc_id" {}