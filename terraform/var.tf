variable "name" {
    description = "name to used"
    type = string
    default = "gitops"
  
}

variable "region" {
    description = "region to use"
    type = string
    default = "us-central1-a"
  
}

variable "location" {
    description = "location to use"
    type = string
    default = "us-central1"
  
}

variable "machine-type" {
    description = "machine type to use"
    type = string
    default = "e2-medium"
  
}