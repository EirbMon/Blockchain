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
        sh 'pwd'
        sh 'truffle compile'
        sh 'truffle migrate'
        echo 'Truffle ok'
        }
    }
  }
}