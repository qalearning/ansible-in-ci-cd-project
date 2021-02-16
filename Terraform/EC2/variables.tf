variable "instance" {
  description = "This variable states the instance type for your EC2"
  default     = "t2.medium"
}

variable "ami_id" {
  description = "This variable states which ami to use for new EC2 instances"
}

variable "key_name" {
  description = "This variable states the key pair used for all new EC2 instances"
  default     = "deployer-key"
}

variable "subnet_id" {
  description = "Subnet ID for EC2"
}

variable "name" {
  description = "Name of EC2 Instance"
  default     = "host-1"
}

variable "enable_public_ip" {
  description = "Enable if EC2 instace should have public ip address"
  default     = true
}

variable "vpc_security_group_ids" {
  description = "VPC Security Group IDs"
}

variable "user_data" {
  description = "script to run when creating instance"
  default     = "data.template_file.init.rendered"
}
