pipeline {
    agent any;
    stages {
      stage('Test') {
        agent {
          docker {
            image 'node:lts-alpine3.10' 
            args '-p 3000:3000 -u root:root'
          }
        }
        steps {
          sh 'rm -rf cibersec-node-docker-jenkins-deploy'
          sh 'apk add --no-cache git'
          sh 'git clone https://github.com/mbujes/cibersec-node-docker-jenkins-deploy/'
          dir("cibersec-node-docker-jenkins-deploy") {
              sh "npm install"
          }
          dir("cibersec-node-docker-jenkins-deploy") {
            sh "npm run test"
          }
        }
      }
      stage('Deploy') { 
        steps {
          dir("cibersec-node-docker-jenkins-deploy") {
            sh 'docker build -t nodejs-production .'
            sh 'docker run -d -p 3100:3000 --name nodejs-production nodejs-production'
          }
        }
      }
    }
}

