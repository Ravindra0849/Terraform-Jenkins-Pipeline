variable "VPC_Cidr" {
    type = string
    description = "Provide CIDR Block Range for VPC"
}

variable "Public_cidr" {
    type = string
    description = "Provide CIDR Block Range for Public Subnet"
}

variable "Private_cidr" {
    type = string
    description = "Provide CIDR Block Range for Private Subnet"
}

variable "ami" {
    type = string
    description = "Provide Ami id for the Instance"
}

variable "instance_type" {
    type = string
    description = "Provide Instance type for the Instance"
}

variable "key_name" {
    type = string
    description = "Provide key pair name for the Instance"
}
