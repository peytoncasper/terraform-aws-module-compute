resource "aws_instance" "web" {
  ami           = "ami-03368e982f317ae48"
  instance_type = var.instance_type

  vpc_security_group_ids = var.security_group_ids

  associate_public_ip_address = false
}