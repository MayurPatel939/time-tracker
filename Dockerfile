FROM tomcat:9-jdk21-openjdk-slim

LABEL maintainer="Mayur Chhabhaiya"

COPY /var/lib/jenkins/workspace/java-application/web/target/time-tracker-web-0.5.0-SNAPSHOT.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]

