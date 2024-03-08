variable "ami" {
    type = string
}

variable "key_name" {
    type = string
}

variable "access_key"{
    type = string
}

variable "secret_key"{
    type = string
}

variable "instance_type" {
    type = string
}

variable "instance_names_map" {
    type = map(string)
}