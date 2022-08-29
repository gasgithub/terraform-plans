variable "ibmcloud_api_key" {
    default = "" 
}

variable "cos_service_name" {
    default = "dev-build-cos"
}

variable "cos_service_plan" {
    default = "standard"
}

variable "cluster_node_flavor" {
    default = "bx2.8x32"
}

variable "cluster_kube_version" {
    default = "4.8_openshift"
}

variable "deafult_worker_pool_count"{
    default = "1"
}

variable "region" {
  default = "us-east"
}

variable "resource_group" {
  default = "dev-build"
}

variable "cluster_name" {
  default = "dev-build"
}

variable "worker_pool_name" {
  default = "workerpool"
}

variable "entitlement"{
  default = "cloud_pak"
}

