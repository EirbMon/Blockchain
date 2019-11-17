pipeline {
  agent any
  stages {
     stage('Truffle for prod') {
      when {
        branch "master"
      }
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
    stage('Truffle for dev') {
      when {
        branch "dev"
      }
      agent {
        docker {
          image 'node:8'
          args '-v /home/eirbmon/Documents/SharedFileDev:/Shared --network="host"'
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