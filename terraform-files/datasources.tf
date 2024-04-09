#Defining the datasources, in this case the owner of the AMI is specified and the image is set using the name with a wildcard in the end to ignore the last date that it was

data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}