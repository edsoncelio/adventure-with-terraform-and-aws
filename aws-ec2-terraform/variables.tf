variable "aws_region" {
  description = "Regiao default da AWS para usar"
  default     = "us-east-1"
}

variable "access_key" {
    description = "AWS access key"
    type = string
}

variable "secret_key" {
    description = "AWS access secret key"
    type = string
}

variable "instance_type" {
  description = "Tipo de instancia"
  default     = "t2.micro"
}

variable "ami_image"{
  description = "AMI default"
  default     = "ami-00eb20669e0990cb4"
}

