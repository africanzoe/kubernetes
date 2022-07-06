
terraform {
  backend "s3" {
    bucket = "security-topologies"
    key    = "8cfd6057-091a-4b56-98fa-a1ea9ac271af"
    region = "eu-west-3"
  }
}
  