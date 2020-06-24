variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-1"
}

variable "public_key_path" {
  description = <<DESCRIPTION
Path to the SSH public key to be used for authentication.
Ensure this keypair is added to your local SSH agent so provisioners can
connect.
Example: ~/.ssh/terraform.pub
DESCRIPTION
  type = string
}

variable "key_name" {
  description = "Desired name of AWS key pair"
  type = string
}

variable "aws_amis" {
  default = {
    eu-west-1 = "ami-089cc16f7f08c4457"
    us-east-1 = "ami-0ac80df6eff0e70b5"
    us-west-1 = "ami-0d705db840ec5f0c5"
    us-west-2 = "ami-003634241a8fcdec0"
  }
}