## Firstname : Olivier

## Surname : Djatchue-Tchokothe

## For Eazytraining's 18th DevOps Bootcamp

## Period : march-april-may


>![image](https://github.com/user-attachments/assets/8248aab4-eb89-4a8e-8535-a366b494ebff)

This project utilizes Terraform to deploy a web application on AWS by provisioning an EC2 instance with Ubuntu Bionic, an EBS volume, a public IP address, and a security group.

# Project Structure
The project is organized into reusable modules for easier management and maintenance of the infrastructure:
1) modules/ebs-modul: Defines an EBS volume.
2) modules/ebs-modul: Configures an EC2 instance with Ubuntu Bionic, installs nginx, and uses an SSH key for access.
3) modules/eip-modul: Assigns a public IP to the EC2 instance and records this address in ip_ec2.txt.
4) modules/sg-modul: Creates a security group that allows HTTP, HTTPS, and SSH traffic.
4) app: Contains the application configuration that uses the modules to deploy the EC2 instance.

# Prerequisites
1) Terraform v0.12+ installed on your local machine.
2) AWS CLI configured with the appropriate credentials.
3) An S3 bucket for the Terraform backend (already created and configured in app/main.tf).
4) An SSH key named terraformkey must be available and configured in AWS.

# Quick Start
1) Clone this repository to your local machine:
´´´bash
https://github.com/OlivierDjatchue/mini-projet-terraform.git
2) cofigure aws CLI
```bash
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json
```
3) Navigate to the project folder (app) and initialize Terraform:
```bash
terraform init
```
4) apply the Terraform configure
```bash
Terraform init
```
5) Configuration
Default variables are defined in the variables.tf files of each module. These can be customized by overriding them in app/main.tf when calling the modules. Alternatively, you can create a terraform.tfvars file in the app folder or pass variables directly via the command line.


6) Outputs
After execution, Terraform will display the IDs of the created resources, including the EC2 instance ID and the name of the security group. The public IP address of the instance will also be available in the app/ip_ec2.txt file.

7) Cleanup
To destroy the infrastructure created by Terraform and avoid additional charges, run:
```bash
terraform destroy
```

8) Security
Never version your private keys or Terraform state files.
Use restrictive IAM policies to control access to AWS resources.

   

