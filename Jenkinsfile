pipeline {

    agent {
        label 'master'
    }

    environment {
        image = "atisak/demo-nodejs"
        registry = "docker.io"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Print Environment') {
            steps {
                sh('ls -al')
                sh('printenv')
            }
        }
        
        stage('Build docker image') {
            steps {
                script {
                    docker.withRegistry("https://${env.registry}", "docker hub") {
                        def slackImage = docker.build("${env.image}:${BUILD_NUMBER}")
                        //slackImage.push('latest')
                       
                    }
                    
                     sh 'docker push "${env.image}":latest'
                }
            }
        }

        stage('Verify new docker image(s)') {
            steps {
                sh('docker images')
            }
        }

    }
}

