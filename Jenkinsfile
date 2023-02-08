/* Requires the Docker Pipeline plugin */
pipeline {
    agent { docker { image 'maven:3.8.7-eclipse-temurin-11' } }
    stages {
        stage('docker build') {
            steps {
                sh "docker build -t myflaskapp ."
            }
        }
    }
}
