pipeline {
  agent {
    docker { image 'node:16.13.1-alpine' }
  }
  stages {
    stage('Example'){
      steps {
        sh 'node --version'
      }
    }
  }
}
