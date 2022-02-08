data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

resource "ibm_resource_instance" "cos_instance" {
  name     = var.service_instance_name
  service  = var.service_offering
  plan     = var.plan
  location = "global"
  resource_group_id = data.ibm_resource_group.cos_group.id
}
