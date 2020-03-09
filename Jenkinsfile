pipeline {
    agent any
    stages {
        stage ('Docker build and push'){
            steps{
                script {
                    docker.withRegistry("https://index.docker.io/v1/", 'f901b70e-5861-4ea2-83bf-daa0ca415ed4') {
                        def customImage = docker.build("larcbp/kiper-sre-challenge:${BUILD_NUMBER}", ".")
                        /* Push the container to the custom Registry */
                        customImage.push()
                    }
                }
            }
        }
        stage('Create new definition'){
            steps{
                sh 'sed "s/latest/${BUILD_NUMBER}/g" -i terraform/definition.json'
                sh 'cd terraform && aws ecs register-task-definition --cli-input-json file://definition.json'
            }
        }
        stage('teste'){
            steps{
                def taskRevision = sh ( script: "aws ecs describe-task-definition  --task-definition graphql | egrep 'revision'| tr ',' ' '| awk '{print \$2}'").trim()
	        sh  "aws ecs update-service  --cluster graphql --service graphql --task-definition graphql:${taskRevision} --desired-count 1"
            }
        }
    }
}
