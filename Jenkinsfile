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
    stage('Build') {
      parallel {
        stage('Build prod') {
          steps {
            sh 'docker build -t eirbmon/blockchain .'
            echo 'Docker prod image built'
          }
        }
        stage('Stop old prod') {
          steps {
            sh 'docker stop eirbmon-blockchain || true'
            sh 'docker rm eirbmon-blockchain || true'
            sh 'docker rmi eirbmon/blockchain || true'
            echo 'Old prod container stopped'
          }
        }
      }
    }
    stage('Run prod container') {
      steps {
        sh 'docker run -p 5000:5000 -it -v /home/eirbmon/Documents/SharedFile:/Blockchain/build/contracts -d --name eirbmon-blockchain eirbmon/blockchain'
        echo 'Prod container ready !'
      }
    }
  }
}