pipeline {
    agent any
    stages {
        stage (SCA) {           #source code analysis --> Sonarqube/Sonarcloud
            steps {
                
            }
        }

        stage (build) {         # build stage --> docker build
            steps {
                sh '''
                1. dockerfile
                2. build the dockerfile --> After building the dockerfile. result : image

                    command: docker build

                3. saving the image ( Container registry )
                    
                    pushing the image to the space 
                    
                    command : docker push
                '''
            }

        }

        stage (deploy) {
            steps {
                sh '''
                4. docker pull --> downloading image

                5. docker run
                '''    
            }
        }
    }
}




1. dockerfile
2. build the dockerfile --> result : image

	command: docker build

3. saving the image ( Container registry )
	
	pushing the image to the space 
	
	command : docker push


Dockerhub 
             ( jenkins, grafana ) ---> software companies

4. docker pull --> downloading image

5. docker run 