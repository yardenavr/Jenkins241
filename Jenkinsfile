/* Requires the Docker Pipeline plugin */
pipeline {
    agent any
    stages {
        stage('docker build') {
            steps {
                sh "docker build -t myflaskapp ."
            }
        }
        /*stage('docker run') {
            steps {
                sh "docker run -d -p 5000:5000 myflaskapp"
            }
        }*/
        stage('push to ECR') {
            steps {
                sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 266339035537.dkr.ecr.us-east-1.amazonaws.com"
                sh "docker tag myflaskapp:latest 266339035537.dkr.ecr.us-east-1.amazonaws.com/myflaskapp:latest"
                sh "docker push 266339035537.dkr.ecr.us-east-1.amazonaws.com/myflaskapp:latest"
            }
        }
    }
}
