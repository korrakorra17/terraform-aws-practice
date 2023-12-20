provider "aws" {
  region = "us-east-1"   # Set your desired region here
   access_key = ""
   secret_key = ""
}

resource "aws_instance" "ubuntu" {
  ami           = "ami-0aa2b7722dc1b5612"   # The ID of the Ubuntu 20.04 LTS AMI
  instance_type = "t2.micro"                # Set the instance type here

  # Set the instance details (tags, SSH key, etc.)
  tags = {
    Name = "MORPHIUS-WEBSRV-1"
  }
  key_name = "MORPHIUS-WEBSRV-1"                  # Set the name of your SSH key pair here

  # Set the network details (VPC, subnets, security groups, etc.)
  vpc_security_group_ids = [ "sg-05414c02d7983f7ea" ]   # Set the ID of your security group here
  subnet_id              = "subnet-0c279bf6216f787ea"  # Set the ID of your subnet here

  # Provision the instance with user data (cloud-init) to install Apache web server
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y apache2
              EOF
}

output "public_ip" {
  value = aws_instance.ubuntu.public_ip
}
