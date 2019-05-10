pipeline {
    agent any
    stages {
        stage('deploy') {
        steps {
            sshagent(credentials: ['557481da-4f94-40c8-b323-870b3a16ee13']) {
                sh '-------make express-example dir----------'
                sh 'ssh -o StrictHostKeyChecking=no ec2-user@52.82.65.180 "mkdir -p ~/express-example"'
                sh '-------copy files----------'
                sh 'mkdir -p ~/express-example && scp -r ./* ec2-user@52.82.65.180:~/express-example/'
            }
        }

        }
    }
}