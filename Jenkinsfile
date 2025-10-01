pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/razanmujawar2211-create//ci-cd-flask-app.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo 'Running SonarQube analysis (will set up soon)'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t flask-ci-cd:latest ."
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Skipping for now - will add DockerHub later'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                echo 'Skipping for now - will add K8s later'
            }
        }
    }
}
