# Trend-deploy (infrastructure)

This repo contains infra and k8s manifests to deploy the static Trend site.

Infra: infra/ (Terraform)
K8s manifests: k8s/
Docker image: sathwikgudipudi/trend:latest

See infra/variables.tf — set TF_VAR_ssh_key_name to your EC2 KeyPair name before `terraform apply`.
