pipeline {
	stages {
		stage ( " build the docker and push to ECR ") {
			steps {
				sh '''
				aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 440038317783.dkr.ecr.us-east-1.amazonaws.com
				docker build -t manual_docker_project .
				docker tag manual_docker_project:latest 440038317783.dkr.ecr.us-east-1.amazonaws.com/manual_docker_project:${BUILD_NUMBER}
				docker push 440038317783.dkr.ecr.us-east-1.amazonaws.com/manual_docker_project:${BUILD_NUMBER}
				'''
			}
		}
		stage (" download the image and run the image") {
			steps {
				sh '''
				ssh -i /var/lib/jenkins/publickey.pem -o StrictHostKeyChecking=no ubuntu@ec2-3-237-42-247.compute-1.amazonaws.com 'bash -s' < ./deploy.sh \${BUILD_NUMBER}
				'''
			}
		}	
	}
}