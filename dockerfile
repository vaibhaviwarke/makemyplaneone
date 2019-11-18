# Pull tomcat latest image from dockerhub
FROM tomcat:8.0.51-jre8-alpine
MAINTAINER vaibhavi
# copy war file on to container
ADD /var/lib/jenkins/workspace/makemyplan/target/makemyplaneone.war /usr/local/tomcat/webapps
EXPOSE  8080
USER makemyplaneone
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]