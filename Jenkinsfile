pipeline {
  agent any
  stages {

    stage('Docker build and push') {
      steps {
		sh '''
		 whoami
		 aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 933542948767.dkr.ecr.ap-southeast-1.amazonaws.com
		 docker build -t docker1 .
		 docker tag docker1:latest 933542948767.dkr.ecr.ap-southeast-1.amazonaws.com/docker1:${BUILD_NUMBER}
		 docker push 933542948767.dkr.ecr.ap-southeast-1.amazonaws.com/docker1:${BUILD_NUMBER}
		  '''
	     }	         
	   }

    stage('Deploy docker'){
      steps {
		sh '''
			  ssh -i /var/lib/jenkins/publickey.pem -o StrictHostKeyChecking=no ubuntu@ec2-54-84-21-88.compute-1.amazonaws.com 'bash -s' < ./deploy.sh \${BUILD_NUMBER}
			  '''	 
		    
      		}
		}		    

}

 }
