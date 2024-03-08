#Individual EC2 Instances created separately

resource "aws_instance" "web-server-new1" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
            Name = values(var.instance_names_map)[0]
    }
}

resource "aws_instance" "web-server-new2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
                Name = values(var.instance_names_map)[1]
    }
}


output "my_server_name1" {
  value = aws_instance.web-server-new1.id
}


output "my_server_name2" {
  value = aws_instance.web-server-new2.id
}
