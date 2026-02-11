# AWS Local Infrastructure (Terraform + LocalStack) ☁️

This repository contains a fully automated local cloud environment. It uses **Terraform** to orchestrate resources within **LocalStack**, simulating a real-world AWS deployment.

---

## 🚀 How to Run

### Step 1: Start the Environment
Run LocalStack via Docker to simulate the AWS APIs:
docker run -d -p 4566:4566 -p 4510-4559:4510-4559 --name localstack-main localstack/localstack

### Step 2: Initialize Terraform
Setup the project and download providers:
terraform init

### Step 3: Deploy
Provision all 9 infrastructure resources:
terraform apply -auto-approve

### Step 4: Access the Website
Once finished, open the S3 static link in your browser:
http://localhost:4566/bucket-projeto-daniel-2026/index.html

---

## 🏗️ Project Architecture

| Component | Description |
| :--- | :--- |
| **Networking** | VPC, Public Subnet, and Internet Gateway |
| **Security** | Security Group (Port 22) and SSH Key Pair (.pem) |
| **Compute** | EC2 Instance (Amazon Linux 2) |
| **Storage** | S3 Bucket with Static Website Hosting |

---

## 📁 File Organization

* `provider.tf`: LocalStack connection settings.
* `network.tf`: VPC and network topology.
* `compute.tf`: Server and security definitions.
* `storage.tf`: S3 bucket and file upload.
* `variables.tf`: Environment customization.
* `outputs.tf`: Automated links and IDs.

---

## 🔒 Security & Git
This project is configured with a `.gitignore` to prevent sensitive files like `*.pem` (Private Keys) and `*.tfstate` (Infrastructure Map) from being leaked.