pipeline {
    agent any
 
   tools
    {
       maven "maven"
    }
 stages {
      stage('checkout') {
           steps{
                git branch: 'master', url: 'https://github.com/MayurPatel939/time-tracker.git' 
          }
        }
        stage('Execute Maven') {
            steps{  
                sh 'mvn package'             
            }
        }
        stage('Docker Build and Tag') {
            steps{
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp mayurchhabhaiya/mayurdevops:latest'
            }
        }
     
        stage('Publish image to Docker Hub'){
            steps{
                withDockerRegistry([ credentialsId: "dockerHub", url: "" ]){
                sh  'docker push mayurchhabhaiya/mayurdevops:latest'
            }          
        }
    }
        stage('Run Docker container on Jenkins Agent'){
             steps{
                sh "docker run -d -p 8001:8080 mayurchhabhaiya/samplewebapp"
            }
        }
        stage('Run Docker container on remote hosts'){
            steps{
                sshagent(credentials: ['azure-vm'], ignoreMissing: true) {
                sh "docker -H ssh://azureuser@4.240.15.40 run -d -p 8001:8080 mayurchhabhaiya/samplewebapp"
                }
            }
        }
    }
}
