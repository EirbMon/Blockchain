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
        sh 'npm install -g truffle'
        sh 'npm install'
        sh 'truffle compile'
        // sh 'truffle migrate'
        echo 'Everything is okay, we can continue !'
      }
    }
    stage('Truffle') {
        steps {
            sh 'ls'
            sh 'cd build'
            sh 'cp /var/jenkins_home/workspace/Blockchain/build/contracts/Eirbmon.json /home/eirbmon/Documents/SharedFile'
            echo 'Truffle ok'
        }
    }
  }
}