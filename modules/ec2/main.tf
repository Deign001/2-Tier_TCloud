resource "random_id" "server" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    ami_id = var.ami_id
  }

  byte_length = 4
}

resource "aws_instance" "web" {
  tags = {
    Name          = "2-Tier ${random_id.server.hex}"
    ami           = var.ami
    instance_type = var.aws_instance
    subnet_id     = var.region_a

    #   vpc_security_group_ids = [aws_security_group.web-sg.id]

    user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              sed -i -e 's/80/8080/' /etc/apache2/ports.conf
              echo "This is the Web Tier!" > /var/www/html/index.html
              systemctl restart apache2
              EOF
  }
}
resource "aws_instance" "app" {
  tags = {
    Name          = "2-Tier ${random_id.server.hex}"
    ami           = var.ami
    instance_type = var.aws_instance
    subnet_id     = var.region_b

  }
}  