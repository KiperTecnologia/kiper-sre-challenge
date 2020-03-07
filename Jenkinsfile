pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'

                script {
                    def customImage = docker.build("kiper-sre-challenge:${env.BUILD_ID}")
                    customImage.push()
                }
            }
        }
    }
}
