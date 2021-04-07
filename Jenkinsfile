env.DOCKER_REGISTRY = credentials('raxer')
env.DOCKER_IMAGE_FRONTEND = credentials('frontend-sp4')
env.DOCKER_IMAGE_BACKEND = credentials('backend-sp4')

pipeline {
    agent any 
    stages {
        stage('Hello World') { 
            steps {
                sh "whoami"
            }
        }
        stage('Get File Github') { 
            steps {
                sh "echo 'HAHAHA'"
                sh "ls -la"
            }
        }
        stage('Docker Build Image') { 
            steps {
                sh "docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE_FRONTEND:${BUILD_NUMBER} ./MERN-app/"
                sh "docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE_BACKEND:${BUILD_NUMBER} ./MERN-app/backend"
            }
        }
        stage('Push Docker Image') { 
            steps {
                sh "docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_FRONTEND:${BUILD_NUMBER}"
                sh "docker push $DOCKER_REGISTRY/$DOCKER_IMAGE_BACKEND:${BUILD_NUMBER}"
            }
        }
        // stage('Deploy Image to Kubernetes') { 
        //     steps {
        //         sh """ sed -i 's;raxer/backend-sp4 ;raxer/frontend-sp4:${BUILD_NUMBER};g' ./MERN-app/backend/Production/backend-deployment.yml """
        //         sh """ sed -i 's;raxer/backend-sp4 ;raxer/backend-sp4:${BUILD_NUMBER};g' ./MERN-app/backend/Production/front-end-deployment.yml """
    	//         sh "kubectl apply -f ./MERN-app/backend/Production/"
        //     }
        // }
        stage('Delete Image') { 
            steps {
                sh "docker rmi $DOCKER_REGISTRY/$DOCKER_IMAGE_FRONTEND:${BUILD_NUMBER}"
                sh "docker rmi $DOCKER_REGISTRY/$DOCKER_IMAGE_BACKEND:${BUILD_NUMBER}"
            }
        }
        stage('Cleaning FIle....') { 
            steps {
                cleanWs()
            }
        }
    }
}
