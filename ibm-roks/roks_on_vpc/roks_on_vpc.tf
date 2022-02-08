resource "random_id" "name1" {
  byte_length = 2
}

resource "random_id" "name2" {
  byte_length = 2
}
resource "random_id" "name3" {
  byte_length = 2
}

locals {
  ZONE1 = "${var.region}-1"
  ZONE2 = "${var.region}-2"
  ZONE3 = "${var.region}-3"  
}

resource "ibm_is_vpc" "vpc1" {
  name = "dev-build-vpc-${random_id.name1.hex}"
}

resource "ibm_is_public_gateway" "dev-build_gateway1" {
    name = "dev-build-public-gateway-${random_id.name1.hex}"
    vpc = ibm_is_vpc.vpc1.id
    zone = local.ZONE1
}

resource "ibm_is_public_gateway" "dev-build_gateway2" {
    name = "dev-build-public-gateway-${random_id.name2.hex}"
    vpc = ibm_is_vpc.vpc1.id
    zone = local.ZONE2
}
resource "ibm_is_public_gateway" "dev-build_gateway3" {
    name = "dev-build-public-gateway-${random_id.name3.hex}"
    vpc = ibm_is_vpc.vpc1.id
    zone = local.ZONE3
}

resource "ibm_is_security_group_rule" "dev-build_security_group_rule_tcp" {
    group = ibm_is_vpc.vpc1.default_security_group
    direction = "inbound"
    tcp {
        port_min = 30000
        port_max = 32767
    }
 }

resource "ibm_is_subnet" "subnet1" {
  name                     = "dev-build-subnet-${random_id.name1.hex}"
  vpc                      = ibm_is_vpc.vpc1.id
  zone                     = local.ZONE1
  total_ipv4_address_count = 256
  public_gateway = ibm_is_public_gateway.dev-build_gateway1.id
}

resource "ibm_is_subnet" "subnet2" {
  name                     = "dev-build-subnet-${random_id.name2.hex}"
  vpc                      = ibm_is_vpc.vpc1.id
  zone                     = local.ZONE2
  total_ipv4_address_count = 256
  public_gateway = ibm_is_public_gateway.dev-build_gateway2.id
}
resource "ibm_is_subnet" "subnet3" {
  name                     = "dev-build-subnet-${random_id.name3.hex}"
  vpc                      = ibm_is_vpc.vpc1.id
  zone                     = local.ZONE3
  total_ipv4_address_count = 256
  public_gateway = ibm_is_public_gateway.dev-build_gateway3.id
}


data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

resource "ibm_resource_instance" "kms_instance1" {
    name              = "dev-build-kms"
    service           = "kms"
    plan              = "tiered-pricing"
    location          = var.region
}
  
resource "ibm_kms_key" "dev-build" {
    instance_id = "${ibm_resource_instance.kms_instance1.guid}"
    key_name = "dev-build_root_key"
    standard_key =  false
    force_delete = true
}

resource "ibm_container_vpc_cluster" "cluster" {
  name              = "${var.cluster_name}-${random_id.name1.hex}"
  vpc_id            = ibm_is_vpc.vpc1.id
  kube_version      = var.kube_version
  flavor            = var.flavor
  worker_count      = var.worker_count
  resource_group_id = data.ibm_resource_group.resource_group.id
  entitlement       = var.entitlement
  cos_instance_crn  = var.cos_instance_crn

  zones {
    subnet_id = ibm_is_subnet.subnet1.id
    name      = local.ZONE1
  }
  zones {
    subnet_id = ibm_is_subnet.subnet2.id
    name      = local.ZONE2
  }
  zones {
    subnet_id = ibm_is_subnet.subnet3.id
    name      = local.ZONE3
  }  

  kms_config {
    instance_id = ibm_resource_instance.kms_instance1.guid
    crk_id = ibm_kms_key.dev-build.key_id
    private_endpoint = false
  }

}



