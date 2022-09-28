# ssh-Key 
variable key_name {}


# AWS Credentials
variable secret_key {}
variable access_key {}


# Region & ami
variable region {}

variable ami {
  type        = string
  default     = "ami-0caef02b518350c8b"
}


# Instance variables
variable instance_type {
  type        = string
  default     = "t3.medium"
}

variable instance_count{
  type        = string
  default     = "2"
}

variable instance_tags {
  type = list(string)
  default = ["Master-i", "Node-i"]
}


# Security Group & Network
variable sg_name {
  type        = string
  default     = "app-sg"
}

variable vpc_name {
  type        = string
  default     = "app-vpc"
}
