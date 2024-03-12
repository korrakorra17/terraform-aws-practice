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


variable "buckets_csv_file" {
  description = "Path to the CSV file containing bucket names"
  default     = "buckets.csv"
}


locals {
  bucket_names = [
    for name in split("\n", file("${path.module}/${var.buckets_csv_file}")) : 
    trimspace(name)
  ]
}

resource "aws_s3_bucket" "buckets" {
  count  = length(local.bucket_names)
  bucket = local.bucket_names[count.index]

  
  # Add other bucket configurations here if needed
}

output "bucket_names" {
  value = [for idx, bucket in aws_s3_bucket.buckets : {
    name = bucket.bucket
  }]
}
