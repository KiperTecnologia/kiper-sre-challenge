pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'
                sh 'docker build -t kiper-sre-challenge .'
            }
        }
        stage('Tag'){
            steps {
                echo 'Starting to build docker image'
                sh 'docker tag  kiper-sre-challenge:latest larcbp/kiper-sre-challenge:latest'
            }
        }
        stage('Push image') {
            steps {
                echo 'Pushing'
                sh 'docker push larcbp/kiper-sre-challenge:latest'
            }
        }
        stage('Deploy'){
            steps {
               echo 'teste'
            }
        }
    }
}
