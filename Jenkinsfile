pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'
                sh 'docker build -t kiper-sre-challenge:${BUILD_NUMBER} .'
            }
        }
        stage('Tag'){
            steps {
                echo 'Starting to build docker image'
                sh 'docker tag  kiper-sre-challenge:${BUILD_NUMBER} larcbp/kiper-sre-challenge:${BUILD_NUMBER}'
            }
        }
        stage('Push image') {
            steps {
                echo 'Pushing'
                sh 'docker push larcbp/kiper-sre-challenge:${BUILD_NUMBER}'
            }
        }
        stage('Deploy'){
            steps {
               echo 'sed'
               sh 'cd terraform && terraform apply -var 'build_number=${BUILD_NUMBER}''
            }
        }
    }
}
