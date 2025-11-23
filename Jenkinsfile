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
    withCredentials([
      file(credentialsId: 'kubeconfig-id', variable: 'KUBECONFIG_FILE'),
      usernamePassword(
        credentialsId: 'aws-eks-creds',
        usernameVariable: 'AWS_ACCESS_KEY_ID',
        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
      )
    ]) {
      sh '''
        echo "Deploying to EKS..."

        # Use kubeconfig from Jenkins credentials
        export KUBECONFIG=$KUBECONFIG_FILE

        # AWS credentials for getting EKS token
        export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
        export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
        export AWS_DEFAULT_REGION=us-east-1

        kubectl get nodes
        kubectl apply -f k8s/deployment.yaml
        kubectl apply -f k8s/service.yaml
      '''
    }
  }
}

  }
}
