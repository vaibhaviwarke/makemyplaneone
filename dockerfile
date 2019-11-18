# Pull tomcat latest image from dockerhub
FROM tomcat
MAINTAINER vaibhavi.warke79@gmail.com
# copy war file on to container
ADD /target/makemyplaneone.war /usr/local/tomcat/
EXPOSE  8080
USER makemyplaneone
WORKDIR /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]