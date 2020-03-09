pipeline {
    agent any
    stages {
        // stage('Build image') {
        //     steps {
        //         echo 'Starting to build docker image'
        //         sh 'docker build -t kiper-sre-challenge:${BUILD_NUMBER} .'
        //     }
        // }
        // stage('Tag'){
        //     steps {
        //         echo 'Starting to build docker image'
        //         sh 'docker tag  kiper-sre-challenge:${BUILD_NUMBER} larcbp/kiper-sre-challenge:${BUILD_NUMBER}'
        //     }
        // }
        // stage('Push image') {
        //     steps {
        //         echo 'Pushing'
        //         sh 'docker push larcbp/kiper-sre-challenge:${BUILD_NUMBER}'
        //     }
        // }
        stage ('Docker build and push'){
            steps{
                docker.withRegistry("https://hub.docker.com", 'f901b70e-5861-4ea2-83bf-daa0ca415ed4') {
                    def customImage = docker.build("https://hub.docker.com/kiper-sre-challenge:${BUILD_NUMBER}", ".")
                    /* Push the container to the custom Registry */
                    customImage.push()
                }
            }
        }
    }
}
