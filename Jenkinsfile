pipeline {
  agent any
  stages {
    stage('Check dependencies') {
      agent {
        docker {
          image 'node:8'
          args '-v /home/eirbmon/Documents/SharedFile:/Shared --network="host"'
        }

      }
      steps {
        sh 'npm install -g truffle'
        sh 'npm install'
        sh 'truffle compile'
        sh 'truffle migrate --reset'
        sh 'cp build/contracts/Eirbmon.json /Shared'
        echo 'copy'
      }
    }
  }
}