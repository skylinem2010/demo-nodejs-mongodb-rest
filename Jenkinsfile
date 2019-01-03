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

        stage('Ansible prepareation docker ') {
            steps{
                sh 'ANSIBLE_ROLES_PATH="$PWD/roles" ansible-playbook -vvv ./playbook/web-server/web-server.yml -i host -e state=prepareation -e tagnumber=${BUILD_NUMBER}'
            }
        }
        
        // stage('Build docker image') {
        //     steps {
        //         script {
        //             docker.withRegistry("https://${env.registry}", "docker hub") {
        //                 def slackImage = docker.build("${env.image}:${BUILD_NUMBER}")
        //                 //slackImage.push()
        //             }
        //         }
        //     }
        // }

        // stage('tag docker image') {
        //     steps {
        //        sh "docker tag ${env.image}:${BUILD_NUMBER} ${env.image}:latest"
        //     }
        // }

        // stage('push docker image') {
        //     steps {
        //        sh "docker push ${env.image}:latest"
        //     }
        // }

        // stage('Verify new docker image(s)') {
        //     steps {
        //         sh('docker images')
        //     }
        // }
        
        // stage('Build docker-compose Job for start Web') {
        //     steps {
        //        build job: 'StartImage'
        //     }
        // }
    }
}

