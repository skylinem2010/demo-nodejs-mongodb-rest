pipeline {

    agent {
        label 'master'
    }

    environment {
        image = "atisak/demo-nodejs"
        registry = "hub.docker.com"
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

        
    }
}

