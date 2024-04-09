# Terraform AWS Infrastructure Deployment

This repository contains Terraform configuration files for deploying an AWS infrastructure, including a Virtual Private Cloud (VPC), public subnet, internet gateway, route table, security group, SSH key pair, and an EC2 instance.

## File Structure

- `main.tf`: Main Terraform configuration file defining AWS resources.
- `userdata.tpl`: Template file for EC2 user data script.
- `windows-ssh-config.tpl`: Template file for generating SSH configuration for Windows instances.

## Terraform Resources Overview

### 1. VPC Configuration

- Creates an AWS Virtual Private Cloud (VPC) with the specified CIDR block and DNS settings.

### 2. Subnet Configuration

- Creates a public subnet within the previously defined VPC.

### 3. Internet Gateway Configuration

- Creates an internet gateway and attaches it to the VPC.

### 4. Route Table Configuration

- Creates a public route table, a default route directing traffic to the internet gateway, and associates the route table with the public subnet.

### 5. Security Group Configuration

- Creates a security group to control inbound and outbound traffic for instances.

### 6. Key Pair Configuration

- Creates an SSH key pair to be used for EC2 instances.

### 7. EC2 Instance Configuration

- Launches an EC2 instance within the public subnet with specified configurations.

## Usage

1. Ensure you have Terraform installed on your local machine.
2. Clone this repository to your local machine.
3. Modify `main.tf` file if necessary to match your requirements.
4. Run `terraform init` to initialize Terraform.
5. Run `terraform plan` to see the execution plan.
6. Run `terraform apply` to apply the changes and deploy the infrastructure.

## Notes

- Make sure to handle sensitive information securely, such as SSH keys and AWS credentials.
- Review and customize the Terraform configurations according to your specific needs and security requirements.
- Always follow best practices for infrastructure as code (IaC) development and deployment.

## Contributors

- [Edilson Panizza](https://github.com/edinhozor)