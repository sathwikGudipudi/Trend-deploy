# 🚀 Trend Application Deployment (CI/CD + Kubernetes + Monitoring)

This project demonstrates the full deployment lifecycle of a React-based web application using modern DevOps tooling including **Docker**, **Terraform**, **AWS EC2, ECR, EKS**, **GitHub**, **Jenkins**, **Kubernetes**, **Prometheus**, and **Grafana**.

---

## 📌 Project Overview

| Component                   | Technology Used      |
| --------------------------- | -------------------- |
| Source Code                 | React Application    |
| Version Control             | Git + GitHub         |
| CI/CD                       | Jenkins Pipeline     |
| Containerization            | Docker               |
| Image Registry              | DockerHub            |
| Infrastructure Provisioning | Terraform            |
| Cloud Platform              | AWS                  |
| Orchestration               | Kubernetes (EKS)     |
| Monitoring                  | Prometheus + Grafana |

---

## 🔧 Application Setup

1. Clone the application:

```bash
git clone https://github.com/Vennilavan12/Trend.git
cd Trend
```

2. Install dependencies and run locally:

```bash
npm install
npm run build
```

Application runs on **port 3000**.

---

## 🐳 Docker Build & Push

1. Create Dockerfile (included in repo):
2. Build Image:

```bash
docker build -t sathwikgudipudi/trend:latest .
```

3. Run container locally:

```bash
docker run -p 3000:80 sathwikgudipudi/trend:latest
```

4. Push to DockerHub:

```bash
docker push sathwikgudipudi/trend:latest
```

---

## ☁️ Infrastructure using Terraform

Terraform provisions:

* VPC
* Subnets (public + private)
* Internet Gateway
* EC2 (Jenkins Server)
* IAM Roles
* EKS Cluster

Run:

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

---

## ⚙️ Jenkins CI/CD Setup

Plugins Installed:

* Docker Pipeline
* Kubernetes CLI
* Git
* Credentials Binding
* Pipeline Plugin

Credentials added:

| ID                | Type              | Purpose                 |
| ----------------- | ----------------- | ----------------------- |
| `dockerhub-creds` | Username/Password | Push image to DockerHub |
| `kubeconfig-id`   | Secret file       | Access EKS cluster      |
| `AWS creds`       | Access Key/Secret | Required on EC2         |

### ▶️ Jenkins Pipeline (Jenkinsfile)

Stages:

* Checkout Code
* Build Docker Image
* Push to DockerHub
* Deploy to Kubernetes using kubectl

Pipeline triggers automatically using **GitHub Webhook**.

---

## ☸️ Kubernetes Deployment

Deployment & Service YAMLs located in `/k8s` folder.

Apply Manually (if needed):

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

Check resources:

```bash
kubectl get nodes
tkubectl get pods -o wide
kubectl get svc
```

Application is accessible via AWS LoadBalancer URL.

---

## 📊 Monitoring Setup

Installed via Helm chart:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring --create-namespace
```

Expose Grafana:

```bash
kubectl expose service monitoring-stack-grafana -n monitoring --type=LoadBalancer --name=grafana-lb
```

Retrieve admin password:

```bash
kubectl get secret -n monitoring monitoring-stack-grafana -o jsonpath="{.data.admin-password}" | base64 --decode
```

Grafana dashboards show real-time Kubernetes metrics.

---

## 🔥 Final Output

✔️ CI/CD automated
✔️ Kubernetes scalable deployment ready
✔️ Application available via AWS LoadBalancer
✔️ Monitoring enabled (Grafana + Prometheus)

---

## 📎 Submission Includes

* GitHub repo link
* CI/CD working pipeline
* Terraform infra
* Working Kubernetes deployment
* Monitoring dashboard

---

### 📁 Repository Link

👉 [https://github.com/sathwikGudipudi/Trend-deploy](https://github.com/sathwikGudipudi/Trend-deploy)

---

### ✨ Submitted By:

**Satwiksai Gudipudi**

---

📌 Status: **COMPLETE ✔️**
