pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'echo "======begin build======"'
        sh 'npm install'
        sshagent()
      }
    }
  }
}