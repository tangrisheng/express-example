pipeline {
    agent any
    stages {
        stage('deploy') {
            steps {
               sshagent(credentials: ['557481da-4f94-40c8-b323-870b3a16ee13']) {
                   sh 'ssh -o StrictHostKeyChecking=no ec2-user@52.82.65.180'
                   sh 'echo login in zhiwen server'
                   sh 'scp ./* /home/ec2-user'
               }
            }

        }
    }
}