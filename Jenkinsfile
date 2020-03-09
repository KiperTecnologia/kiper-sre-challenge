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
                sh 'docker build -t kiper-sre-challenge .'
            }
        }
        stage('Push image') {
            steps {
                echo 'Pushing'
                sh 'docker push larcbp/kiper-sre-challenge .'
            }
        }
        stage('Deploy'){
            steps {
               echo 'teste'
            }
        }
    }
}
