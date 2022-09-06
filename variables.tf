variable "region" {
  default = "us-east-1"
}

variable "int_type" {
  description = "Tipo de instancia EC2 WEB"
  default     = "t3.micro"
}

variable "disable_api_termination" {
  description = "Protege a instancia contra delete acidental"
  type        = bool
  default     = false
}

variable "int_names" {
  description = "Lista de nomes para instancias"
  type        = list(string)
  default     = ["Helloworld", "Helloworld2", "Helloworld3", "Helloworld4"]
  #                   0               1             2
}

variable "amis" {
  description = "Amis para determinadas regioes"
  type        = map(any)
  default = {
    "us-east-1" = "ami-05fa00d4c63e32376"
    "us-east-2" = "ami-0568773882d492fc8"
  }
}
