variable "server_type" {
    type = string
    description = "Instance type"
    default = "t3.nano"
  
}

variable "availability_zones" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}