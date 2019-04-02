variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 8080
}

variable "elb_port" {
  description = "The port the elastic load balancer will use for HTTP requests"
  default = 80
}