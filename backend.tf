
terraform {
  backend "s3" {
    bucket = "security-topologies"
    key    = "33872a58-7e34-4856-8742-86c433fa68f5"
    region = "eu-west-3"
  }
}
  