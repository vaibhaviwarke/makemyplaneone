pipeline {
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }
    agent any
    tools {
        maven 'maven_3.0.5'
    }
    stages {
        stage('Code Compilation') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
           steps {
                sh 'docker build -t makemyplanone .'
           }
         }
        stage('Upload Docker Image to AWS ECR') {
            steps {
			   script {
			      withDockerRegistry([credentialsId:'ecr:ap-south-1:makemyplanone-ecr', url:"https://708589318365.dkr.ecr.ap-south-1.amazonaws.com"]){
                  sh """
				  echo "Tagging the Docker Image: In Progress"
				  docker tag makemyplanone:latest 708589318365.dkr.ecr.ap-south-1.amazonaws.com/makemyplanone:1.0.1
				  echo "Tagging the Docker Image: Completed"
				  echo "Push Docker Image to ECR : In Progress"
				  docker push 708589318365.dkr.ecr.ap-south-1.amazonaws.com/makemyplanone:1.0.1
				  echo "Push Docker Image to ECR : Completed"
				  """
				  }
                }
            }
		}
        stage('Deploy to Production') {
            steps {
                sh 'date'
            }
        }
    }
}