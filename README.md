# Envoy — Self-Service Ephemeral Environment Platform

A production-style internal developer platform that provisions isolated, 
production-like Kubernetes environments on demand, deploys containerized 
microservices, and tears them down automatically via TTL — solving slow 
environment provisioning, configuration drift, and cloud cost waste.

## 🏗️ Architecture

<img width="644" height="542" alt="Screenshot 2026-11-10 220809" src="https://github.com/user-attachments/assets/3b802daa-6424-49ad-aef0-0ae1c66a8f6b" />


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
<img width="1905" height="821" alt="Screenshot 2026-11-06 172455" src="https://github.com/user-attachments/assets/8dd247de-597a-49d9-8d8d-a6073d419770" />
<img width="1919" height="1072" alt="Screenshot 2026-11-06 172614" src="https://github.com/user-attachments/assets/30d0229d-7814-40d0-bf3f-e6d2ca2f4c29" />
<img width="1919" height="1079" alt="Screenshot 2026-11-06 172208" src="https://github.com/user-attachments/assets/d5fb29bd-fe17-401c-98b8-b4c9f7993248" />
<img width="1915" height="688" alt="Screenshot 2026-11-09 235757" src="https://github.com/user-attachments/assets/4ae1efc8-29ee-45f8-ab3a-89a092638076" />
<img width="1919" height="778" alt="Screenshot 2026-11-09 235916" src="https://github.com/user-attachments/assets/72b080ec-326f-4dcc-a9ce-d2f2548ec2e7" />


## 🏃 How to Run Locally

```bash
git clone git@github.com:viswanatt/envoy-platform.git
cd envoy-platform
docker-compose up -d
# UI: http://localhost:8080
# API: http://localhost:3000/health
