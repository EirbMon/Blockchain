pipeline {
  agent any
  stages {
    stage('Check dependencies') {
      agent {
        docker {
          image 'node:8'
          args '-v /home/eirbmon/Documents/SharedFile:/Shared'
        }

      }
      steps {
        sh 'npm install -g truffle'
        sh 'npm install'
        sh 'truffle compile'
        sh 'pwd'
        sh 'cp build/contracts/Eirbmon.json /Shared'
        echo 'copy'
      }
    }
  }
}