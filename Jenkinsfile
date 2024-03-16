pipeline {
    agent any;
    stages {
        stage('build'){
            steps{
                sh '''
                aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 533267090797.dkr.ecr.us-east-1.amazonaws.com
                docker build -t 533267090797.dkr.ecr.us-east-1.amazonaws.com/docker_project:${BUILD_NUMBER} .
                docker push 533267090797.dkr.ecr.us-east-1.amazonaws.com/docker_project:${BUILD_NUMBER}
                '''                
            }
        }
        stage('deploy'){
            steps{
                sh '''
                ssh -i /var/lib/jenkins/siva_8.pem -o StrictHostKeyChecking=no ubuntu@ec2-3-89-207-110.compute-1.amazonaws.com 'bash -s' < ./deploy.sh \${BUILD_NUMBER}
                '''
            }
        }
    }
}