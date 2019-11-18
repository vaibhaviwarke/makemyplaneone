# Pull tomcat latest image from dockerhub
FROM tomcat
MAINTAINER vaibhavi.warke79@gmail.com
# copy war file on to container
COPY /var/lib/jenkins/workspace/makemyplan/target/makemyplanone/makemyplaneone.war /usr/local/tomcat/webapps/
EXPOSE  8080
USER makemyplaneone
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]