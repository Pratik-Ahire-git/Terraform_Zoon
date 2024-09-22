variable "system-key" {
  type    = string
  default = "Masterkey"
}

variable "security_group" {
  type    = string
  default = "sg-0da832673ec76ae03"
}

variable "vpc" {
  type    = string
  default = "vpc-06de384b473568e37"

}

variable "all_availability_zone" {
  type    = string
  default = "ap-south-2a"

}

variable "subnet_id" {
  type    = string
  default = "subnet-0941a66b7c000365c"

}
