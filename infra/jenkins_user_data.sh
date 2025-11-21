#!/bin/bash
set -e
yum update -y
amazon-linux-extras install docker -y
systemctl enable --now docker
usermod -aG docker ec2-user
yum install -y java-11-amazon-corretto
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install -y jenkins
systemctl enable --now jenkins
if [ -f /var/lib/jenkins/secrets/initialAdminPassword ]; then
  echo "Jenkins initial admin password:"
  cat /var/lib/jenkins/secrets/initialAdminPassword
fi
