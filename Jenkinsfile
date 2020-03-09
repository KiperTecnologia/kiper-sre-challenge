pipeline {
    agent any
    stages {
        stage('Build image') {
            steps {
                echo 'Starting to build docker image'
                docker.withRegistry('http://registry.hub.docker.com', 'credentials-id') {
                    def customImage = docker.build("larcbp/kiper-sre-challenge:${env.BUILD_ID}")
                    customImage.push()
                }
            }
        }
    }
}
