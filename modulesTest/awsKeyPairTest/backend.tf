terraform {
  backend "s3" {
    bucket         = "devopslearningcircle-terraform-statefile"
    key            = "modulesTest/awsKeyPairTest/terraform.tfstate"
    region         = "us-east-1"
    use_lockfile = true
  }
}
