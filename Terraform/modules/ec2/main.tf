resource "aws_default_security_group" "default-sg" {
  vpc_id = var.vpc_id
  ingress {
    description      = "all from myip"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.my_ip]
    
  }
/*
  ingress {
    description      = "http"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
*/
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    prefix_list_ids = []
  }
  tags = {
        Name: "${var.env_prefix}-default-sg"
    }
}

data "aws_ami" "latestami" {
  most_recent = true
  owners = [var.ami_owner]
  filter{
    name = "name"
    values = [var.image_name]

  }
}

# resource "aws_ebs_volume" "ebs1" {
#  availability_zone = aws_instance.docker-server.availability_zone
#  size = 20
#  tags= {
#     Name = "Docker volume"
#   }
# }

# resource "aws_volume_attachment" "ebs1-attachment" {
#  device_name = "/dev/sdh"
#  volume_id = aws_ebs_volume.ebs1.id
#  instance_id = aws_instance.docker-server.id 
# }


resource "aws_instance" "docker-server" {
  ami = data.aws_ami.latestami.id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_default_security_group.default-sg.id]
  availability_zone = var.avail_zone
  associate_public_ip_address = true
  key_name = var.key_name
  # user_data = file("entry-script.sh")
    tags = {
        Name: "${var.env_prefix}-server"
    }
    
    provisioner "local-exec" {
      working_dir = "../Ansible"
      command = "ansible-playbook --inventory ${self.public_ip}, --private-key ${var.ansible_ssh_key} --user ec2-user install-docker.yaml"
  } 
} 