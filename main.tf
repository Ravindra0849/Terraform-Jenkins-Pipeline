resource "aws_vpc" "new_vpc" {
    cidr_block = var.VPC_Cidr
    tags = {
        name = "My-VPC"
    }
}

resource "aws_subnet" "Public" {
    vpc_id = aws_vpc.new_vpc.id
    cidr_block = var.Public_cidr
    tags = {
        Name = "Public_Subnet"
    }
}

resource "aws_subnet" "Private" {
    vpc_id = aws_vpc.new_vpc.id
    cidr_block = var.Private_cidr
    tags = {
        Name = "Private_Subnet"
    }
}
resource "aws_security_group" "my-SG" {
    name = "first-SG"
    description = "Allow TLS inbound traffic"
    vpc_id = aws_vpc.new_vpc.id

    ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.new_vpc.cidr_block]
    }

    ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }
    tags = {
        Name = "my-SG"
    }  
}

resource "aws_instance" "New_Instance" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.my-SG.id]
    
    tags = {
        Name = "New_instance"
    }
}