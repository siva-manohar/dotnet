pipeline {
    agent any
    stages {
        stage ('build') {
            steps {
                sh '''
                aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 590183962065.dkr.ecr.us-east-1.amazonaws.com
                docker build -t docker-project .
                docker tag docker-project:latest 590183962065.dkr.ecr.us-east-1.amazonaws.com/docker-project:${BUILD_NUMBER}
                docker push 590183962065.dkr.ecr.us-east-1.amazonaws.com/docker-project:${BUILD_NUMBER}
                '''
            }
        }

        stage('deploy'){
            steps {
                sh '''
                ssh -i /var/lib/jenkins/ssh-key.pem -o StrictHostKeyChecking=no ubuntu@ec2-54-221-32-102.compute-1.amazonaws.com 'bash -s' < ./deploy.sh \${BUILD_NUMBER}
                '''
            }
        }
    }
}