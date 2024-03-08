#the following line means : user of this script needs terraform 5.0 or greater
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
    access_key = var.access_key
    secret_key = var.secret_key
}
