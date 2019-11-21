provider "aws"{
    region = var.aws_region
    access_key =  var.access_key
    secret_key =  var.secret_key
}

### Security Group
resource "aws_security_group" "instance" {
  name = "public-access-group"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
    ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }
    
    tags = {
    Name = "allow_all"
  }
}


## EC2
resource "aws_instance" "webserver-terraform"{
    ami = var.ami_image
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.instance.id]
   
    tags = {
        Name = "webserver"
        Creator = "Terraform"
  }
}

