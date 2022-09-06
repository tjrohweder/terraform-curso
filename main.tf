terraform {
  required_version = ">= 1.1.0"
  required_providers {
    aws = ">= 4"
  }

  backend "s3" {
    bucket = "tjrohweder-terraform-curso-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  profile                  = "default"
  shared_credentials_files = ["~/.aws/credentials"]
  region                   = var.region
}


resource "aws_instance" "web" {
  ami                     = var.amis[var.region]
  instance_type           = var.int_type
  disable_api_termination = var.disable_api_termination
  user_data               = base64encode(file("./files/userdata.sh"))

  tags = {
    Name = element(var.int_names, 2)
  }
}

resource "aws_instance" "web" {
  count                   = length(var.int_names)
  ami                     = var.amis[var.region]
  instance_type           = var.int_type
  disable_api_termination = var.disable_api_termination
  user_data               = file("./files/userdata.sh")

  tags = {
    Name = var.int_names[count.index]
  }
}

resource "aws_instance" "web1" {
  for_each = {
    Helloworld  = "t3.nano"
    Helloworld2 = "t3.micro"
    Helloworld3 = "t3.small"
  }
  ami                     = var.amis[var.region]
  instance_type           = each.value
  disable_api_termination = var.disable_api_termination
  user_data               = file("./files/userdata.sh")

  tags = {
    Name = each.key
  }
}
