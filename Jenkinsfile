pipeline {
  agent any
  stages {

    stage('Docker build and push') {
      steps {
		sh '''
		 whoami
		 aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 713179705108.dkr.ecr.us-east-1.amazonaws.com
		 docker build -t 713179705108.dkr.ecr.us-east-1.amazonaws.com/dotnet_project:${BUILD_NUMBER} .	
		 docker push 713179705108.dkr.ecr.us-east-1.amazonaws.com/dotnet_project:${BUILD_NUMBER}
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
