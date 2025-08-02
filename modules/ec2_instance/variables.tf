variable "ami" {}
variable "instance_type" {}
variable "availability_zone" { default = null}
variable "key_name" { default = null}
variable "subnet_id" {}
variable "vpc_security_group_ids" { type = list(string) }
variable "associate_public_ip_address" { 
  type = bool  
  default = false 
}
variable "ebs_optimized" { 
  type = bool 
  default = false 
}
variable "monitoring" { 
  type = bool 
  default = false
}
variable "iam_instance_profile" { default = null }
variable "user_data" { default = null }
variable "user_data_base64" { default = null }
variable "private_ip" { default = null }
variable "disable_api_termination" { 
  type = bool 
  default = false 
}
variable "shutdown_behavior" { default = "stop" }
variable "source_dest_check" { default = true }
variable "cpu_core_count" { default = null }
variable "cpu_threads_per_core" { default = null }
variable "get_password_data" { default = false }
variable "hibernation" { default = false }
variable "host_id" { default = null }
variable "tenancy" { default = "default" }
variable "cpu_credits" { default = "standard" }

variable "metadata_options" {
  type = object({
    http_endpoint               = string
    http_tokens                 = string
    http_put_response_hop_limit = number
    instance_metadata_tags      = string
  })
  default = {
    http_endpoint               = "enabled"
    http_tokens                 = "optional"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "disabled"
  }
}

variable "root_block_device" {
  type = object({
    volume_type           = string
    volume_size           = number
    delete_on_termination = bool
    encrypted             = bool
    # iops                  = number
    # throughput            = number
  })
  default = {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
    encrypted             = false
    # iops                  = 24
    # throughput            = 125
  }
}

variable "ebs_block_devices" {
  type = list(object({
    device_name           = string
    volume_type           = string
    volume_size           = number
    delete_on_termination = bool
    encrypted             = bool
    iops                  = number
    throughput            = number
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "ignore_changes" {
  type    = list(string)
  default = []
}