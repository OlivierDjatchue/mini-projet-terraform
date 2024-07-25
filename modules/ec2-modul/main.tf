data "aws_ami" "ubuntu_ami" {
    most_recent = true
    owners = [ "099720109477" ]
    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]

    }
}

resource "aws_instance" "my_ec2" {
    ami = data.aws_ami.ubuntu_ami.id
    instance_type =   var.instance_type
    key_name = "terraformkey"
    security_groups = [ "${var.sg_name}" ]
    tags = var.aws_common_tag
    
    root_block_device {
        delete_on_termination = true
    }
   provisioner "remote-exec" {
     inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
     ]

  connection {
     type = "ssh"
     user = "ubuntu"
     private_key = file("../app/terraformkey.pem")
     host = self.public_ip
    }
  }
}
