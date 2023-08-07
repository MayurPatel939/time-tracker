pipeline {
    agent any
    
    environment {
        TOMCAT_HOST = '4.240.15.40'
        TOMCAT_PORT = '8081'
        TOMCAT_USERNAME = '<tomcat_username>'
        TOMCAT_PASSWORD = '<tomcat_password>'
        WAR_FILE_NAME = 'my-web-app.war'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    def mvnHome = tool name: 'Maven', type: 'hudson.tasks.Maven$MavenInstallation'
                    def mvnCmd = "${mvnHome}/bin/mvn"
                    
                    sh "${mvnCmd} clean package"
                }
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                script {
                    def warFilePath = "${workspace}/target/${WAR_FILE_NAME}"
                    def tomcatUrl = "http://${TOMCAT_HOST}:${TOMCAT_PORT}/manager/text"
                    
                    sh "curl --upload-file ${warFilePath} --user ${TOMCAT_USERNAME}:${TOMCAT_PASSWORD} ${tomcatUrl}/deploy?path=/${WAR_FILE_NAME}"
                }
            }
        }
    }
    
    post {
        always {
            script {
                def tomcatUrl = "http://${TOMCAT_HOST}:${TOMCAT_PORT}/manager/text"
                
                sh "curl --user ${TOMCAT_USERNAME}:${TOMCAT_PASSWORD} ${tomcatUrl}/undeploy?path=/${WAR_FILE_NAME}"
            }
        }
    }
}
