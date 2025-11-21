pipeline {
  agent any
  environment {
    IMAGE = "sathwikgudipudi/trend:latest"
    KUBECONFIG_CRED = 'kubeconfig-id'
  }
  stages {
    stage('Deploy to Kubernetes') {
      steps {
        withCredentials([file(credentialsId: env.KUBECONFIG_CRED, variable: 'KUBECONFIG_FILE')]) {
          sh 'mkdir -p ~/.kube && cp $KUBECONFIG_FILE ~/.kube/config'
          sh 'kubectl apply -f k8s/deployment.yaml'
          sh 'kubectl apply -f k8s/service.yaml'
        }
      }
    }
  }
}
