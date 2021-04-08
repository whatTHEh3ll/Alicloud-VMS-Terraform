variable "key" {
  type        = string
  description = "alibaba access key"
}

variable "secret" {
  type  = string
  description = "alibaba secret key"
}

variable "region" {
  type  = string
  description = "region"
}

variable "zone" {
  type  = string
  description = "zone"
}

variable "public_key_path" {
  type        = string
  description = "The path to the public key used to connect to the instance"
}

variable "host_name" {
  type        = string
  description = "Host name of the instance"
}



