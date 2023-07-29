provider "aws" {
    region = "us-east-1" 
}

variable "ingress" {
    type =list(number)
    default = [80,443]
  
}

variable "egress" {
    type =list(number)
    default = [80,443]
}

resource "aws_security_group" "webSG" {
    name = "Allow Web Traffic"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
          
        }

    }
        dynamic "egress" {
        iterator = port
        for_each = var.egress
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    
    }
  
}

resource "aws_instance" "db" {
    ami = "ami-06b09bfacae1453cb"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webSG.name]
    user_data = file("server-script.sh")

    tags = {
        Name = "db server"
}
}

resource "aws_instance" "ec2" {
    ami = "ami-06b09bfacae1453cb"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webSG.name]
    user_data = file("server-script.sh")

    tags = {
        Name = "web server"
}
}
     

output "PrivateIP" {
    value = aws_instance.db.private_ip
}

output "PublicIP" {
    value = aws_instance.ec2.public_ip
}