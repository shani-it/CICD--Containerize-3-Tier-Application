![Uploading Cloud DevOps CI_CD Pipeline Infographic.png…]()

# 🚀 End-to-End DevOps CI/CD Pipeline with AWS, Terraform, Jenkins, Docker, Prometheus & Grafana

## 📌 Project Overview

This project demonstrates an end-to-end DevOps workflow for deploying and monitoring a containerized 3-tier web application on AWS. It combines Infrastructure as Code (IaC), Continuous Integration and Continuous Deployment (CI/CD), containerization, secure remote deployment, and infrastructure monitoring.

The infrastructure is provisioned using **Terraform**, the CI/CD pipeline is automated through **Jenkins**, and the application services are deployed using **Docker and Docker Compose**. **Prometheus** collects real-time system and container metrics, while **Grafana** provides interactive dashboards for monitoring resource utilization and application infrastructure.

The project aims to minimize manual deployment tasks, improve deployment consistency, and provide visibility into the application's running environment.

### Architecture Components

- **AWS EC2:** Hosts the Jenkins server, application services, and monitoring stack.
- **Terraform:** Automates AWS infrastructure provisioning.
- **GitHub:** Stores source code and triggers the CI/CD workflow.
- **Jenkins:** Automates the build, and deployment process.
- **Docker & Docker Compose:** Build, run, and manage application containers.
- **Prometheus:** Collects infrastructure and container metrics.
- **Grafana:** Visualizes monitoring data through dashboards.

---

## 🔄 Architecture Workflow

### 1. Infrastructure Provisioning — Terraform & AWS

Terraform automates the provisioning of cloud infrastructure on AWS.

- Creates EC2 instances for Jenkins, application deployment, and monitoring.
- Configures security groups and required networking rules.
- Defines infrastructure through reusable Terraform configuration files.
- Provides consistent and repeatable infrastructure deployments.

### 2. Source Code Management — GitHub

GitHub is used as the central repository for application source code and pipeline configuration.

- Maintains the application source code.
- Stores the `Jenkinsfile` for pipeline automation.
- Tracks code changes through Git.
- Provides the source for Jenkins builds and deployments.

### 3. CI/CD Automation — Jenkins

Jenkins runs on a dedicated AWS EC2 instance and manages the automated deployment pipeline.

- Retrieves the latest code from GitHub.
- Executes the pipeline defined in the `Jenkinsfile`.
- Automates the application deployment process.
- Establishes a secure SSH connection to the application server.
- Executes remote deployment commands.

### 4. Secure Remote Deployment — SSH

Jenkins securely connects to the App Host using SSH key-based authentication.

- Establishes secure communication between Jenkins and the App Host.
- Executes deployment commands remotely.
- Avoids manually logging into the application server for each deployment.

### 5. Application Containerization — Docker & Docker Compose

The web application is deployed as a three-tier architecture using separate Docker containers.

| Container | Technology | Responsibility |
|---|---|---|
| `literary-frontend` | React + Nginx | User interface and frontend content |
| `literary-backend` | Node.js | Business logic and REST API |
| `literary-db` | MongoDB | Application data storage |

Docker Compose manages the application containers, their configuration, and communication between services.

### 6. Monitoring & Observability — Prometheus & Grafana

The monitoring stack provides real-time visibility into infrastructure and container performance.

**Prometheus**
- Collects system and container metrics.
- Scrapes metrics from Node Exporter and cAdvisor.
- Stores time-series monitoring data.
- Provides metrics for monitoring resource utilization and container health.

**Grafana**
- Connects to Prometheus as a data source.
- Displays metrics through interactive dashboards.
- Visualizes CPU, memory, network, and container resource usage.
- Helps identify performance issues and resource bottlenecks.

---

## 🛠️ Technologies Used

| Category | Technology | Purpose |
|---|---|---|
| Cloud Infrastructure | AWS EC2 | Cloud-based server hosting |
| Infrastructure as Code | Terraform | Automated infrastructure provisioning |
| Source Control | Git & GitHub | Version control and source code management |
| CI/CD | Jenkins | Automated build and deployment pipeline |
| Secure Communication | SSH | Secure remote server access |
| Containerization | Docker | Application containerization |
| Container Management | Docker Compose | Multi-container deployment and management |
| Frontend | React | User interface |
| Web Server | Nginx | Serves the frontend application |
| Backend | Node.js | API and application logic |
| Database | MongoDB | Persistent application data |
| Metrics Collection | Prometheus | Infrastructure and container metrics collection |
| Metrics Exporter | Node Exporter | Host-level system metrics |
| Container Monitoring | cAdvisor | Container resource metrics |
| Visualization | Grafana | Monitoring dashboards and data visualization |

---

## 🔁 CI/CD Pipeline Execution

The deployment workflow is automated from code commit to application deployment and monitoring.

1. **Code Commit:** Developer pushes code changes to the GitHub `main` branch.
2. **Pipeline Execution:** Jenkins retrieves the repository and executes the `Jenkinsfile`.
3. **Build & Deployment:** Jenkins initiates the automated deployment workflow.
4. **SSH Authentication:** Jenkins securely connects to the App Host using SSH keys.
5. **Docker Compose Deployment:** Docker Compose rebuilds and restarts the application services.
6. **Container Startup:** The frontend, backend, and MongoDB containers are deployed.
7. **Monitoring:** Prometheus collects system and container metrics.
8. **Visualization:** Grafana displays real-time monitoring data through dashboards.

---

## 🌐 Live Access & Monitoring

Replace the IP placeholders with your actual AWS EC2 public IP addresses.

| Service | URL | Port |
|---|---|---|
| Frontend Web App | `http://<APP_SERVER_PUBLIC_IP>:8080` | 8080 |
| Backend API | `http://<APP_SERVER_PUBLIC_IP>:4000` | 4000 |
| Prometheus | `http://<MONITORING_SERVER_PUBLIC_IP>:9090` | 9090 |
| Grafana Dashboard | `http://<MONITORING_SERVER_PUBLIC_IP>:3000` | 3000 |

> **Note:** Access to these services depends on EC2 availability, security group configurations, and the respective service being up and running.

---

## 🎯 Key Learning Outcomes

- Implementing Infrastructure as Code using Terraform.
- Provisioning and managing AWS EC2 infrastructure.
- Building CI/CD pipelines with Jenkins.
- Integrating GitHub with Jenkins for automated deployments.
- Implementing secure SSH-based remote deployment.
- Containerizing a multi-tier application using Docker.
- Managing multi-container environments using Docker Compose.
- Understanding frontend, backend, and database communication.
- Configuring infrastructure and container monitoring using Prometheus.
- Visualizing real-time metrics using Grafana.
- Understanding DevOps automation, deployment workflows, and observability.

---

## 📈 Project Outcome

Successfully implemented an automated cloud DevOps workflow combining infrastructure provisioning, application deployment, and monitoring.

Terraform manages cloud infrastructure, Jenkins automates the CI/CD pipeline, Docker Compose deploys the 3-tier application, and Prometheus with Grafana provides monitoring and visualization of server and container metrics.

This project demonstrates practical implementation of modern DevOps tools and workflows across the complete application lifecycle — **from infrastructure provisioning and code integration to deployment and monitoring.**

---

⭐ *A hands-on DevOps project focused on automation, cloud infrastructure, containerization, CI/CD, and observability.*
