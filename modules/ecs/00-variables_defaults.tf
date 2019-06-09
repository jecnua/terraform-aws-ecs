variable "ami_name_filter_regex" {
  type        = "string"
  description = "Regex to find the ami to use"
  default     = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
}

variable "ami_owner" {
  type        = "string"
  description = "ID of the owner of the ami (example 099720109477 for Canonical)"
  default     = "099720109477"
}

variable "ami_name_regex" {
  type        = "string"
  description = "The name regex"
  default     = "^.*"
}
