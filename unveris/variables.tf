// Project variable
variable "project" {
  type    = string
  default = "zubyranksacloudguruproject"
}

// Project Region variable
variable "region" {
  type    = string
  default = "us-central1"
}

// Project Zone variable
variable "zone" {
  type    = string
  default = "us-central1-a"
}

// Internet CIDR
variable "internet" {
  type    = string
  default = "0.0.0.0/0"
}

// Public Subnet CIDR variable
variable "subnet1_cidr_range" {
  type    = string
  default = "10.0.1.0/24"
}

// Public Subnets CIDR variable
variable "subnet2_cidr_range" {
  type    = string
  default = "10.0.2.0/24"
}

// Private Subnet CIDR variable
variable "subnet3_cidr_range" {
  type    = string
  default = "10.0.3.0/24"
}

// Protected Subnet CIDR variable
variable "subnet4_cidr_range" {
  type    = string
  default = "10.0.4.0/24"
}

// Machine type variable
variable "machine-type" {
  type    = string
  default = "f1-micro"
}

