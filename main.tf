terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # Apni region adjust kar sakte hain
}
e
data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "web_sg" {
  name        = "custom-ports-sg"
  description = "Allow HTTP, SSH, 8080, 2701, and 4000"
  vpc_id      = data.aws_vpc.default.id

  # Port 80 (HTTP)
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Port 8080 (Web App / Alt HTTP)
  ingress {
    description = "Custom Port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Port 22 (SSH)
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Port 2701
  ingress {
    description = "Custom Port 2701"
    from_port   = 2701
    to_port     = 2701
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Port 4000
  ingress {
    description = "Custom Port 4000"
    from_port   = 4000
    to_port     = 4000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-custom-ports"
  }
}

# 2. EC2 Instances (2 Servers create honge)
resource "aws_instance" "Jenkins Server" {
  count         = 2
  ami           = "ami-0c7217cdde317cfec" #  2S
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Server-${count.index + 1}"
  }
}

# Both Servers ke Public IPs Output
output "server_public_ips" {
  value = aws_instance.my_servers[*].public_ip
}
