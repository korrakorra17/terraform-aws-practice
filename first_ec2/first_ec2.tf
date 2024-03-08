terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.0"
    }
}
}

#Configure the provider
provider "aws"{
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}


/*

#Individual EC2 Instances created separately

resource "aws_instance" "web-server-new1" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    key_name = "MAHAD-WEBSRV-1"
    tags = {
                Name = "web-server-new1"
    }
}

resource "aws_instance" "web-server-new2"{
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    key_name = "MAHAD-WEBSRV-1"
    tags = {
                Name = "web-server-new2"
    }
}

resource "aws_instance" "web-server-new3"{
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t2.micro"
    key_name = "MAHAD-WEBSRV-1"
    tags = {
                Name = "web-server-new3"
    }
}

*/


#MULTIPLE Individual EC2 Instances created in a FOR loop
#5 servers are created

variable "instance_count" {
  default = 5
}

resource "aws_instance" "DHAAN_server" {
  count = var.instance_count

  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name      = "MAHAD-WEBSRV-1"
  
  tags = {
    Name = "DHAAN-server-${count.index + 1}"
  }
}
