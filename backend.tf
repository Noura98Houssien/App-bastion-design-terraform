terraform {
  backend "s3" {
    bucket = "day3statefile"
    key    = "iti/dev/terraform.tfstate"
    region = "us-east-1"
   
  }
}