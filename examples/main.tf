terraform {}

provider "aws" {
  region  = "eu-west-1"
  version = "~> 1.59"
}

provider "template" {
  version = "~> 2.0"
}

provider "random" {
  version = "~> 2.0"
}

module "cAdvisor" {
  providers = {
    aws      = "aws"
    template = "template"
    random   = "random"
  }

  source     = "../modules/cAdvisor"
  cluster_id = "xxx"
}
