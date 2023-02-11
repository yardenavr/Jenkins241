/* Requires the Docker Pipeline plugin */
pipeline {
    agent any
    stages {
        stage('docker build') {
            steps {
                sh "docker build -t repo-flask-app ."
            }
        }
        stage('docker run') {
            steps {
                sh "docker run -d -p 5000:5000 repo-flask-app"
            }
        }
        stage('aws credentials') {
            steps {
                withCredentials([string(credentialsId: 'AWS_ACCESS_KEY_ID', variable: 'AWS_ACCESS_KEY_ID'),
                                 string(credentialsId: 'AWS_SECRET_ACCESS_KEY', variable: 'AWS_SECRET_ACCESS_KEY')]) {
                    sh 'aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID'
                    sh 'aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY'
                    sh 'aws configure set default.region us-east-1'
                }
            }
        }
        stage('push to ECR') {
            steps {
                sh "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 266339035537.dkr.ecr.us-east-1.amazonaws.com"
                sh "docker tag repo-flask-app:latest 266339035537.dkr.ecr.us-east-1.amazonaws.com/repo-flask-app:latest"
                sh "docker push 266339035537.dkr.ecr.us-east-1.amazonaws.com/repo-flask-app:latest"
            }
        }
        stage('pull from ECR') {
            steps {
                sshagent(credentials: ['devops.pem']) {
                    sh '''
                        ssh -o StrictHostChecking=no ubuntu@3.87.198.138
                        echo "Successfully connected to flask server"
                    '''
                    sh "aws ecr describe-repositories"
                    sh "aws ecr describe-images --repository-name repo-flask-app"
                    sh "docker pull 266339035537.dkr.ecr.us-east-1.amazonaws.com/repo-flask-app:latest"
                }
             }
        }
        stage('docker run on flask app') {
             steps {
                sshagent(credentials: ['devops.pem']) {
                    sh '''
                        ssh -o StrictHostChecking=no ubuntu@3.87.198.138
                        echo "Successfully connected to flask server"
                    '''
                    sh "docker run -d -p 5000:5000 266339035537.dkr.ecr.us-east-1.amazonaws.com/repo-flask-app:latest"
                }
             }
        }
    }
}
