pipeline {
    agent any;
    stages {
        stage ('build') {
            steps {
                sh '''
                aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 590183962065.dkr.ecr.us-east-1.amazonaws.com
                docker build -t docker_project .
                docker tag docker_project:latest 590183962065.dkr.ecr.us-east-1.amazonaws.com/docker_project:${BUILD_NUMBER}
                docker push 590183962065.dkr.ecr.us-east-1.amazonaws.com/docker_project:${BUILD_NUMBER}
                '''
            }
        }
        stage ('deploy') {
            steps {
                sh '''
                ssh -i /var/lib/jenkins/test-keypair.pem -o StrictHostKeyChecking=no ubuntu@ec2-3-82-105-58.compute-1.amazonaws.com 'bash -s' < ./deploy.sh \${BUILD_NUMBER}
                '''
            }
        }
    }
}
