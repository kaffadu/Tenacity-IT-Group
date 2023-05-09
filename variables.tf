variable "region" {
  default = "eu-west-2"  
  type = string
  description = "AWS Region"
}

variable "environment" {
  type = string
  default     = "Tenacity"
  description = "Prefix and tag name for all created resources"
  
}

variable "cidr_block" {
  type = string
  default = "10.0.0.0/16"
  description = "VPC Cidr Block"
}

variable "Prod-pub-sub1_cidr" {
  type = string
  default = "10.0.1.0/24"
  description = "Public subnet 1 Cidr"
}

variable "Prod-pub-sub2_cidr" {
  type = string
  default = "10.0.2.0/24"
  description = "Public subnet 2 Cidr"
}

variable "Prod-priv-sub1_cidr" {
  type = string
  default = "10.0.3.0/24"
  description = "Private subnet 1 Cidr"
}

variable "Prod-priv-sub2_cidr" {
  type = string
  default = "10.0.4.0/24"
  description = "Private subnet 2 Cidr"
}


variable "aws_eip" {
  type = bool
  default = true
  description = "Enable or disable elastic IP"
}
