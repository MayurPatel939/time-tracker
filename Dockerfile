FROM tomcat:9-jdk21-openjdk-slim

LABEL maintainer="Mayur Chhabhaiya"

ADD /web/target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]

