terraform {
  backend "s3" {
    bucket = "devopslearningcircle-terraform-statefile"
    key = "modulesTest/ec2_instance/terraform.tfstste"
    region = "us-east-1"
    use_lockfile = true

  }
}