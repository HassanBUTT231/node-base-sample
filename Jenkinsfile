pipeline {
    agent any

    environment {
        APP_NAME = "node-app-testing"
        RELEASE = "latest"
        DOCKER_USER = "hassanbutt520"
        IMAGE_NAME = "${DOCKER_USER}/${APP_NAME}"
        // DOCKER_PASS is not defined here for security. Use Jenkins credentials instead.
    }

    stages {
        stage('Cloning') {
            steps {
                echo 'Cloning the code'
                git url: "https://github.com/HassanBUTT231/node-base-sample", branch: "main"
                echo "Successfully cloned"
            }
        }

        stage("Build & Push Docker Image") {
            steps {
                script {
                    def imageTag = "${RELEASE}-${env.BUILD_NUMBER}"

                    // Login with Jenkins credentials ID
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
                        def dockerImage = docker.build("${IMAGE_NAME}:${imageTag}")
                        dockerImage.push()
                    }

                    // Save the tag for later use
                    env.FULL_IMAGE = "${IMAGE_NAME}:${imageTag}"
                }
            }
        }

        stage('Update Docker Swarm Service') {
            steps {
                script {
                    sh "docker service update --image ${env.FULL_IMAGE} node-app1_nodeapp"
                }
            }
        }
    }
}
