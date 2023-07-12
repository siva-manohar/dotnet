pipeline {
  agent any
  stages {

    stage('Docker build and push') {
      steps {
		sh '''
		 whoami
		 aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 092101872227.dkr.ecr.ap-southeast-1.amazonaws.com
		 docker build -t docker-automation .	
		 docker tag docker-automation:latest 092101872227.dkr.ecr.ap-southeast-1.amazonaws.com/docker-automation:${BUILD_NUMBER}
		 docker push 092101872227.dkr.ecr.ap-southeast-1.amazonaws.com/docker-automation:${BUILD_NUMBER}
		  '''
	     }	         
	   }

    stage('Deploy docker'){
      steps {
		sh '''
			  ssh -i /var/lib/jenkins/publickey.pem -o StrictHostKeyChecking=no ubuntu@ec2-18-139-219-5.ap-southeast-1.compute.amazonaws.com 'bash -s' < ./deploy.sh \${BUILD_NUMBER}
			  '''	 
		    
      		}
		}		    

}

 }
