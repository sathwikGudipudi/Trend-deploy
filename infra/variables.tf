variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "trend-deploy"
}

variable "ssh_key_name" {
  description = "EC2 KeyPair name (the name as shown in AWS console)"
  type        = string
}

variable "jenkins_admin_password" {
  description = "Optional Jenkins admin password"
  type        = string
  default     = ""
}
