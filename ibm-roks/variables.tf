variable "ibmcloud_api_key" {
    default = "" 
}

variable "cos_service_name" {
    default = "gas-terra-de"
}

variable "cos_service_plan" {
    default = "standard"
}

variable "cluster_node_flavor" {
    default = "bx2.4x16"
}

variable "cluster_kube_version" {
    default = "4.7_openshift"
}

variable "deafult_worker_pool_count"{
    default = "1"
}

variable "region" {
  default = "us-south"
}

variable "resource_group" {
  default = "default"
}

variable "cluster_name" {
  default = "gas-terra-roks"
}

variable "worker_pool_name" {
  default = "workerpool"
}

variable "entitlement"{
  default = ""
}

