pipeline {
  agent any

  environment {
    DOCKER_IMAGE    = "sathwikgudipudi/trend:latest"
    KUBECONFIG_CRED = "kubeconfig-id"      // Secret file with kubeconfig
    DOCKER_CRED     = "dockerhub-creds"    // Username/password cred for DockerHub
  }

  stages {

    stage('Checkout Code') {
      steps {
        git branch: 'main', url: 'https://github.com/sathwikGudipudi/Trend-deploy.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh '''
          echo "Building Docker image..."
          docker build -t $DOCKER_IMAGE .
        '''
      }
    }

    stage('Login to DockerHub & Push Image') {
      steps {
        withCredentials([usernamePassword(
          credentialsId: DOCKER_CRED,
          usernameVariable: 'DOCKER_USER',
          passwordVariable: 'DOCKER_PASS'
        )]) {
          sh '''
            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
            docker push $DOCKER_IMAGE
          '''
        }
      }
    }

    stage('Deploy to Kubernetes') {
      steps {
        withCredentials([file(credentialsId: KUBECONFIG_CRED, variable: 'KUBECONFIG_FILE')]) {
          sh '''
            mkdir -p ~/.kube
            cp "$KUBECONFIG_FILE" ~/.kube/config

            echo "Applying Kubernetes manifests..."
            kubectl apply -f k8s/deployment.yaml
            kubectl apply -f k8s/service.yaml
          '''
        }
      }
    }
  }
}
