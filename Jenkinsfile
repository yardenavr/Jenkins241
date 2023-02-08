/* Requires the Docker Pipeline plugin */
pipeline {
    agent { docker { image 'python:3' } }
    stages {
        stage('docker build') {
            steps {
                sh "docker build -t myflaskapp ."
            }
        }
    }
}
