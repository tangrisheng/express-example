pipeline {
    agent any
    parameters {
        string(name: '~/express-example')
    }
    environment {
        NODE_ENV = 'dev'
    }

    stages {
        stage('stop pm2') {
            steps {
                sshagent(credentials: ['557481da-4f94-40c8-b323-870b3a16ee13']) {
                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@52.82.65.180 "rm -rf ${params.name}-${env.NODE_ENV}"'
                }
            }
        }
        stage('deploy') {
            steps {
                sshagent(credentials: ['557481da-4f94-40c8-b323-870b3a16ee13']) {
                    sh 'echo "-------mkdir----------"'
                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@52.82.65.180 "mkdir -p ${params.name}-${env.NODE_ENV}"'
                    sh 'echo "-------copy files----------"'
                    sh 'scp -r ./* ec2-user@52.82.65.180:~/express-example/'
                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@52.82.65.180 "cd ${params.name}-${env.NODE_ENV} && npm install && pm2 restart pm2.json --env ${env.NODE_ENV}"'
                }
            }
        }
    }
}