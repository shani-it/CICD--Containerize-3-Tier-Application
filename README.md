## Architecture Workflow

![Cloud DevOps CI/CD Pipeline Architecture](assets/Cloud%20DevOps%20CI_CD%20Pipeline%20Diagram.png)
# Cloud DevOps CI/CD Pipeline Using Terraform, AWS, Jenkins, Docker & GitHub

## Project Overview

This project demonstrates an automated cloud-based DevOps CI/CD pipeline using Infrastructure as Code (IaC), Continuous Integration, Continuous Deployment, and containerization technologies.

The main objective is to automate cloud infrastructure provisioning and application deployment while reducing manual operations.

## Architecture Workflow

### 1. Infrastructure Provisioning – Terraform
Terraform is used to provision AWS cloud infrastructure through Infrastructure as Code (IaC).

- Create AWS EC2 instances.
- Configure required security groups and networking rules.
- Maintain infrastructure configuration through Terraform files.
- Automate and manage infrastructure provisioning.

### 2. Source Code Management – GitHub
GitHub is used to store and manage application source code. Developers push their code changes to the repository.

### 3. CI/CD Automation – Jenkins
Jenkins runs on a dedicated AWS EC2 instance and manages the CI/CD pipeline.

- Fetch source code from GitHub.
- Build and test the application.
- Prepare Docker images.
- Establish a secure SSH connection with the App Host.
- Deploy the application.

### 4. Secure Deployment – SSH
Jenkins communicates with the second AWS EC2 instance (App Host) through an SSH connection to perform deployment operations securely.

### 5. Application Containerization – Docker
The application is divided into three independent Docker containers:

- **React Frontend (Nginx):** Provides the user interface and serves frontend content.
- **Node.js Backend:** Handles business logic and API requests.
- **MongoDB Database:** Stores and manages application data.

Each service runs in its own isolated container.

## Technologies Used

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| AWS EC2 | Cloud Servers |
| GitHub | Source Code Management |
| Jenkins | CI/CD Automation |
| SSH | Secure Remote Deployment |
| Docker | Containerization |
| React | Frontend Development |
| Nginx | Frontend Web Server |
| Node.js | Backend Development |
| MongoDB | Database Management |

## Key Learning Objectives

- Understanding Infrastructure as Code (IaC).
- Provisioning AWS infrastructure using Terraform.
- Implementing CI/CD pipelines using Jenkins.
- Automating application deployment through SSH.
- Containerizing multi-tier applications using Docker.
- Understanding communication between frontend, backend, and database containers.
- Deploying applications on AWS EC2 infrastructure.

## Project Outcome

A cloud-based DevOps deployment architecture in which Terraform manages infrastructure provisioning, Jenkins automates the CI/CD workflow, and Docker runs the frontend, backend, and database services on AWS EC2.

This project provides practical experience with modern DevOps tools and cloud infrastructure management.
Pipeline Flow & Execution
Code Commit: Code is pushed to the main branch on GitHub.

Pipeline Trigger: Jenkins fetches the latest code and reads the Jenkinsfile.

SSH Deployment: Jenkins securely connects to the App Server (172.31.30.206) using SSH Key authentication.

Container Orchestration: Docker Compose rebuilds and restarts the 3 containers (literary-frontend, literary-backend, literary-db).
Live Access Ports
Frontend App: http://<APP_SERVER_PUBLIC_IP>:8080

Backend API: http://<APP_SERVER_PUBLIC_IP>:4000

