terraform {
  required_version = ">= 0.13"   
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "1.50.0"
    }
  }
  # required_providers {
  #   ibm = {
  #     source = "terraform.local/local/ibm"
  #     version = "1.50.0"
  #   }
  # }

}