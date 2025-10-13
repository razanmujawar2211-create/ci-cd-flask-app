pipeline {
    agent any

    environment {
        SONARQUBE = credentials('sonar-token-final') // your SonarQube token credentials ID in Jenkins
        DOCKER_IMAGE = 'flask-ci-cd-app:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out the latest code from GitHub...'
                git url: 'https://github.com/razanmujawar2211-create/ci-cd-flask-app.git', branch: 'main'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo 'Running code quality analysis using SonarQube...'
                withSonarQubeEnv('SonarQube') {
                    script {
                        def scannerHome = tool 'SonarScanner' // <-- use exact name from Jenkins Tools
                       sh """
			${scannerHome}/bin/sonar-scanner \
  			-Dsonar.projectKey=flask-ci-cd \
  			-Dsonar.sources=./ \
  			-Dsonar.host.url=http://host.docker.internal:9000 \
  			-Dsonar.token=$SONARQUBE \
  			-Dsonar.projectBaseDir=$WORKSPACE
			"""

                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker image...'
                sh "docker build -t ${DOCKER_IMAGE} -f Dockerfile ."
            }
        }

        stage('Deploy Container') {
            steps {
                echo 'Deploying container...'
                sh '''
                    docker stop flask-ci-cd-app || true
                    docker rm flask-ci-cd-app || true
                    docker run -d --name flask-ci-cd-app -p 5000:5000 flask-ci-cd-app:latest
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline executed successfully!'
        }
        failure {
            echo '❌ Pipeline failed! Check logs for errors.'
        }
    }
}
