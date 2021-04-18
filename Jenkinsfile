pipeline {
    agent {
        docker {
            image 'node:lts-alpine3.10' 
            args '-p 3000:3000 -u root:root'
        }
    }
    stages {
        stage('Clone') {
            steps {
                sh 'rm -r cibersec-node-docker-jenkins-deploy'
                sh 'apk add --no-cache git'
                sh 'git clone https://github.com/mbujes/cibersec-node-docker-jenkins-deploy/'
            }
        }
        stage('NPM install') { 
            steps {
                dir("cibersec-node-docker-jenkins-deploy") {
                    sh "npm install"
                }
            }
        }
        stage('Check tests') {
          steps {
            dir("cibersec-node-docker-jenkins-deploy") {
              sh "npm run test"
            }
          }
       }
    }
}