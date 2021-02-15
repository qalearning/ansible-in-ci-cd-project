output "aws-instance-ip" {
  value = aws_instance.qa_manager_node.public_ip
}
