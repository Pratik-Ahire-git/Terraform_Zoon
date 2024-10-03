variable "web_instances" {
  type    = list(string)
  default = ["web-a", "web-b"]
}

variable "db_instances" {
  type    = list(string)
  default = ["db-a", "db-b", "db-c"]
}