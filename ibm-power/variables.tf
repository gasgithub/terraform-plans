// Service / Account
variable "ibm_cloud_api_key" {
  description = "API Key"
  type        = string
  default     = "<key>"
}
variable "region" {
  description = "Reigon of Service"
  type        = string
  default     = "<e.g dal>"
}
variable "zone" {
  description = "Zone of Service"
  type        = string
  default     = "<e.g 12>"
}
variable "cloud_instance_id" {
  description = "Cloud Instance ID of Service"
  type        = string
  default     = "<cid>"
}
variable "resource_group" {
  description = "Resource group name"
  type        = string
  default     = "devOps"  
}


variable "cos_service_offering" {
  description = "COS Service offering name"
  default = "cloud-object-storage"
}

variable "cos_service_name" {
  description = "COS Service name"
  default = "gas-vsi-cos"
}

variable "cos_service_plan" {
  description = "COS Service plan"
  default = "standard"
}

// Image
variable "image_name" {
  description = "Name of the image to be used"
  type        = string
  default     = "<name>"
}

// Instance
variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "<name>"
}
variable "memory" {
  description = "Instance memory"
  type        = number
  default     = 2
}
variable "processors" {
  description = "Instance processors"
  type        = number
  default     = 0.25
}
variable "proc_type" {
  description = "Instance ProcType"
  type        = string
  default     = "shared"
}
variable "storage_type" {
  description = "The storage type to be used"
  type        = string
  default     = "tier3"
}
variable "sys_type" {
  description = "Instance System Type"
  type        = string
  default     = "s922"
}

// SSH Key
variable "ssh_key_name" {
  description = "Name of the ssh key to be used"
  type        = string
  default     = "<name>"
}
variable "ssh_key_rsa" {
  description = "Public ssh key"
  type        = string
  default     = "<rsa value>"
}

// Network
variable "network_name" {
  description = "Name of the network"
  type        = string
  default     = "gas-terra-net"
}
variable "network_type" {
  description = "Type of a network"
  type        = string
  default     = "pub-vlan"
}
variable "network_count" {
  description = "Number of networks to provision"
  type        = number
  default     = 1
}

// Volume
variable "volume_name" {
  description = "Name of the volume"
  type        = string
  default     = "gas-terra-vol"
}
variable "volume_size" {
  description = "Size of a volume"
  type        = number
  default     = 100
}
variable "volume_shareable" {
  description = "Is a volume shareable"
  type        = bool
  default     = true
}
variable "volume_type" {
  description = "Type of a volume"
  type        = string
  default     = "tier3"
}
