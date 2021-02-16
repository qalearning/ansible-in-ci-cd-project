resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "qa_manager_node" {
  ami                         = var.ami_id
  instance_type               = var.instance
  key_name                    = var.key_name
  associate_public_ip_address = var.enable_public_ip
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  user_data                   = var.user_data
  tags = {
    Name = var.name
  }
}
