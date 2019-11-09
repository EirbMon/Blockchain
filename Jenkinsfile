pipeline {
  agent any
  stages {
    stage('Check dependencies') {
      agent {
        docker {
          image 'node:8'
        }

      }
      steps {
        sh 'npm install'
        echo 'Everything is okay, we can continue !'
      }
    }
    stage('Truffle') {
        steps {
        sh 'npm install truffle'
        sh 'truffle compile'
        sh 'truffle migrate'
        sh 'cp build/contracts/Eirbmon.json /home/eirbmon/Documents/SharedFile'
        echo 'Truffle ok'
        }
    }
  }
}