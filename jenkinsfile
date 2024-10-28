pipeline {
        agent any
        environment {
            DOCKER_IMAGE = 'arshad200/trivy'
        }
    
        stages {
            stage('Checkout') {
                steps {
                    git 'https://github.com/Arshu200/Jenkins.git'
                }
            }
    
            stage('Docker Build') {
                steps {
                    script {
                        sh "docker build -t ${DOCKER_IMAGE}:${env.BUILD_ID} ."
                        echo "Docker image build successfully"
                        sh "docker images"
                }
            }
            }

        stage("TRIVY"){
            steps{
                catchError(buildResult: 'SUCCESS', stageResult: 'UNSTABLE') {
                    sh "trivy image --no-progress --exit-code 1 --severity MEDIUM,HIGH,CRITICAL --format table ${DOCKER_IMAGE}:${env.BUILD_ID}"
                 }   
            }
        }   
        }
    }