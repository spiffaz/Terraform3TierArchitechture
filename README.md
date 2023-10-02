# 3 Tier Architecture in AWS using Terraform

![3 Tier Architecture](https://user-images.githubusercontent.com/35563797/201526460-ceaf1b55-63bc-4d57-b9b6-a19a774b39c5.png)

## Overview

This Terraform project creates a scalable and highly available 3-tier architecture on AWS. It includes VPC, Subnets, Route Tables, Internet Gateway, NAT Gateway, IAM, AWS Secrets Manager, EC2 instances, Auto Scaling groups, Load balancers, Security groups, S3, and RDS. The architecture is designed to be resilient, secure, and cost-effective.

You can clone this repository using the following link: [Terraform3TierArchitechture.git](https://github.com/spiffaz/Terraform3TierArchitechture.git)

## Features

- Use of S3 remote backend to store Terraform state files securely.
- Creation of a VPC with 9 subnets (3 public and 6 private) across 3 availability zones.
- Automatic assignment of IPv4 and IPv6 (for public subnets) CIDR blocks.
- High Availability (HA) NAT Gateways in each public subnet.
- IAM roles attached to EC2 instances for secure database access.
- Auto Scaling groups for each tier to handle traffic fluctuations.
- Automatic server provisioning using user data shell scripts.
- Provisioning of a Multi-AZ RDS database across all used availability zones.
- Application Load Balancers for traffic distribution.
- Security groups to restrict traffic between tiers.
- Generation and storage of random database passwords in AWS Secrets Manager.

## Best Practices Followed

- Infrastructure as Code (IaC) principles using Terraform.
- Highly available architecture with multi-AZ deployment.
- Proper tagging for resources.
- Secure access control using IAM roles and security groups.
- Use of remote state for Terraform state management.
- AWS Secrets Manager for sensitive data storage.
- Resilience against server failures with Auto Scaling.
- Segregation of resources into public and private subnets.
- Centralized control with VPC and subnet management.

## Benefits of 3 Tier Architectures

- **Scalability**: Easily scale each tier independently based on demand.
- **High Availability**: Redundancy and load balancing provide fault tolerance.
- **Security**: Network isolation between tiers enhances security.
- **Maintainability**: Isolating layers simplifies maintenance and updates.
- **Cost Optimization**: Efficient resource utilization and scalability reduce costs.

## Areas for Improvement

- Enhance security further with more granular security group rules.
- Implement continuous integration/continuous deployment (CI/CD) pipelines.
- Monitor and optimize resource utilization for cost-efficiency.
- Implement automated backups and disaster recovery for the database.

## Author

Connect with me on LinkedIn: [Azeta Spiff](https://www.linkedin.com/in/azeta-spiff/)

Check out my DevOps expertise on GitHub: [DevOps Repository](https://github.com/spiffaz/Devops)

## Getting Started

### Prerequisites

1. **AWS Account**: Ensure you have an AWS account with appropriate permissions.
2. **Terraform Installed**: Install Terraform on your local machine. [Download here](https://www.terraform.io/downloads.html).
3. **AWS Credentials**: Configure AWS credentials through AWS CLI or environment variables.

### Usage Steps

1. Clone the repository and navigate to the project folder.
   ```bash
   git clone https://github.com/spiffaz/Terraform3TierArchitechture.git
   cd Terraform3TierArchitechture
   ```

2. Configure AWS credentials:
   ```bash
   export AWS_ACCESS_KEY_ID="your-access-key"
   export AWS_SECRET_ACCESS_KEY="your-secret-key"
   export AWS_DEFAULT_REGION="us-east-1"  # Set your preferred region
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Customize Configuration (Optional):
   Edit `variables.tf` and `terraform.tfvars` to customize configurations (e.g., instance types, tags).

5. Plan the Deployment:
   ```bash
   terraform plan
   ```

6. Apply the Configuration:
   ```bash
   terraform apply
   ```

7. Monitor the Deployment:
   Terraform will create the infrastructure. Monitor the progress in the terminal.

8. Access Resources:
   Use the provided output variables, e.g., `app_lb` DNS name and `rds_hostname`, to access your application and database.

9. Destroy Resources (Optional):
   To tear down the infrastructure, run:
   ```bash
   terraform destroy
   ```
   Confirm destruction when prompted.

---

By following these steps, you can successfully deploy and manage the 3-tier architecture in your AWS environment using Terraform.
