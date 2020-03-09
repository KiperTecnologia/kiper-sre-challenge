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
                script {
                    docker.withRegistry("https://index.docker.io/v1/", 'f901b70e-5861-4ea2-83bf-daa0ca415ed4') {
                        def customImage = docker.build("larcbp/kiper-sre-challenge:${BUILD_NUMBER}", ".")
                        /* Push the container to the custom Registry */
                        customImage.push()
                    }
                }
            }
        }
        stage('Deploy'){
            steps{
                sh 'sed "s/latest/${BUILD_NUMBER}/g" -i terraform/definition.json'
                sh 'cd terraform && aws ecs register-task-definition --cli-input-json file://definition.json'
                echo 'TASK_DEFINITION=$(aws ecs describe-task-definition --task-definition "graphql")'
                echo 'NEW_TASK_DEFINTIION=$(echo $TASK_DEFINITION | jq --arg IMAGE "larcbp/kiper-sre-challenge:${BUILD_NUMBER}" '.taskDefinition | .containerDefinitions[0].image = $IMAGE | del(.taskDefinitionArn) | del(.revision) | del(.status) | del(.requiresAttributes) | del(.compatibilities)')"'
                echo 'NEW_TASK_INFO=$(aws ecs register-task-definition --region "$AWS_DEFAULT_REGION" --cli-input-json "$NEW_TASK_DEFINTIION")'
                echo 'NEW_REVISION=$(echo $NEW_TASK_INFO | jq '.taskDefinition.revision')'
                sh 'aws ecs update-service --service graphql --desired-count 3 --cluster graphql --task-definition graphql:${NEW_REVISION}'
            }
        }
    }
}
