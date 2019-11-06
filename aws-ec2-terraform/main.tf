provider "aws"{
    region = "${var.aws_region}"
    access_key =  "${var.access_key}"
    secret_key =  "${var.secret_key}"
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
}


## EC2
resource "aws_instance" "webserver-terraform"{
    ami = "${var.ami_image}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = [aws_security_group.instance.id]
    
    #user_data = <<-EOF
    #          #!/bin/bash
    #          echo "Hello, World" > index.html
    #          nohup busybox httpd -f -p 8080 &
    #         EOF
    
    tags = {
        Name = "webserver"
        Creator = "Terraform"
  }
}

