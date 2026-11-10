# Envoy — Self-Service Ephemeral Environment Platform

A production-style internal developer platform that provisions isolated, 
production-like Kubernetes environments on demand, deploys containerized 
microservices, and tears them down automatically via TTL — solving slow 
environment provisioning, configuration drift, and cloud cost waste.

## 🏗️ Architecture

[INSERT ARCHITECTURE DIAGRAM — see instructions below]

## 🛠️ Tech Stack

- **Cloud:** AWS (EKS, ECR, VPC, IAM, ALB)
- **Containerization:** Docker (multi-stage builds, non-root, healthchecks)
- **Orchestration:** Kubernetes (EKS + minikube for local dev)
- **IaC:** Terraform (VPC, EKS, ECR, IAM, KMS)
- **CI/CD:** Jenkins (declarative pipeline, Hadolint, Trivy, smoke tests)
- **Languages:** Node.js (API), Nginx (UI)
- **Security:** Non-root containers, least-privilege IAM, ECR image scanning, Trivy CVE gates

## 🚀 What It Does

1. Developer requests an environment via API/UI
2. Platform provisions a dedicated Kubernetes namespace
3. Deploys the Envoy API and UI into that namespace
4. Exposes the environment via a public URL
5. Enforces TTL — environments auto-expire and tear down

## 📸 Screenshots

<img width="1919" height="1079" alt="Screenshot 2026-11-06 171928" src="https://github.com/user-attachments/assets/33ff475f-2667-4797-8aaa-fa63807d8923" />


## 🏃 How to Run Locally

```bash
git clone git@github.com:viswanatt/envoy-platform.git
cd envoy-platform
docker-compose up -d
# UI: http://localhost:8080
# API: http://localhost:3000/health
