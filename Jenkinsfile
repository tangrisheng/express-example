pipeline {
    agent any

    stages {
        stage('test stage') {
            steps {
                echo '${env.BRANCH_NAME}'
                if (env.BRANCH_NAME.startWith('release')) {
                    echo 'startWith release'
                }

            }
        }
        stage('pm2 stop and rm old files') {
            steps {
                sshagent(credentials: ['557481da-4f94-40c8-b323-870b3a16ee13']) {
                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@52.82.65.180 "cd ~/express-example && pm2 stop pm2.json --env dev && rm -rf ~/express-example"'
                }
            }
        }
        stage('deploy') {
            steps {
                sshagent(credentials: ['557481da-4f94-40c8-b323-870b3a16ee13']) {
                    echo "-------mkdir----------"
                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@52.82.65.180 "mkdir -p ~/express-example"'

                    echo "-------copy files----------"
                    sh 'scp -r ./* ec2-user@52.82.65.180:~/express-example/'

                    sh 'ssh -o StrictHostKeyChecking=no ec2-user@52.82.65.180 "cd ~/express-example && npm install && pm2 startOrRestart pm2.json --env dev"'
                }
            }
        }
    }
}