
terraform {
  required_version = ">= 0.13"
   required_providers {
      ibm = {
         source = "IBM-Cloud/ibm"
         version = "1.31.0"
      }
    }  
}
