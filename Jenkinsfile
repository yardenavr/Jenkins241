/* Requires the Docker Pipeline plugin */
pipeline {
    agent any
    stages {
        stage('docker build') {
            steps {
                sh "docker build -t myflaskapp ."
            }
        }
    }
}
