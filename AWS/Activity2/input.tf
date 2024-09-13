variable "vpc-cidr_block" {
  type        = string
  description = "Enter the Cidr block for the ntier Network "
  default     = "192.168.0.0/16"
}
## Ntier Network and it's subnets variable
variable "vpc-tag-Name" {
  type        = string
  description = "Enter the name "
  default     = "ntier"
}

# subnet-1
variable "subnet-1-cidr_block" {
  type        = string
  description = "Enter the cidr range of subnet-1"
  default     = "192.168.0.0/24"
}

variable "subnet-1-availability_zone" {
  type        = string
  description = "Enter the availabitity_zone for the subnet-1"
  default     = "ap-south-1a"
}
variable "subnet-1-name" {
  type        = string
  description = "Enter the name for the subnet-1"
  default     = "Web-1"

}

# subnet-1
variable "subnet-2-cidr_block" {
  type        = string
  description = "Enter the cidr range of subnet-2"
  default     = "192.168.1.0/24"
}

variable "subnet-2-availability_zone" {
  type        = string
  description = "Enter the availabitity_zone for the subnet-2"
  default     = "ap-south-1b"
}

variable "subnet-2-name" {
  type        = string
  description = "Enter the name for the subnet-2"
  default     = "Web-2"

}

# subnet-3
variable "subnet-3-cidr_block" {
  type        = string
  description = "Enter the cidr range of subnet-3"
  default     = "192.168.2.0/24"
}

variable "subnet-3-availability_zone" {
  type        = string
  description = "Enter the availabitity_zone for the subnet-3"
  default     = "ap-south-1a"
}

variable "subnet-3-name" {
  type        = string
  description = "Enter the name for the subnet-3"
  default     = "db-1"

}

# subnet-4
variable "subnet-4-cidr_block" {
  type        = string
  description = "Enter the cidr range of subnet-4"
  default     = "192.168.3.0/24"
}

variable "subnet-4-availability_zone" {
  type        = string
  description = "Enter the availabitity_zone for the subnet-4"
  default     = "ap-south-1b"
}

variable "subnet-4-name" {
  type        = string
  description = "Enter the name for the subnet-4"
  default     = "db-2"

}