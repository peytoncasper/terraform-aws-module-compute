resource "aws_network_interface" "subnet" {
  subnet_id   = var.subnet_id
  private_ips = ["10.0.10.100"]
  security_groups = var.security_group_ids
  
  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-03368e982f317ae48"
  instance_type = "t3.medium"

  network_interface {
    network_interface_id = aws_network_interface.subnet.id
    device_index         = 0
  }
}