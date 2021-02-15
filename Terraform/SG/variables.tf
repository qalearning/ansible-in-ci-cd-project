variable "sg_web_name" {
  default = "QAFinalProjectSG"
}

variable "sg_web_description" {
  default = "Allow SSH"
}

variable "ip_addresses" {
  default = "0.0.0.0/0"
}

variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 5000, 80]
}

variable "outbound_port" {
  description = "Port open to allow outbound connection"
  default     = 0
}

variable "vpc_id" {
  description = "VPC ID for SG"
}
