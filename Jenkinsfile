pipeline {
    agent any
    tools{
        Maven: 'maven'
    }  
 }

    stages {
        stage('Build') {
            steps {
                script {
                    sh "mvn clean package"
                }
            }
        }