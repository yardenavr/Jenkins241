/* Requires the Docker Pipeline plugin */
pipeline {
    agent any
    stages {
        stage('docker build') {
            steps {
                sh "docker build -t myflaskapp ."
            }
        }
        stage('docker run') {
            steps {
                sh "docker run -d -p 5000:5000 myflaskapp"
            }
        }
    }
}
