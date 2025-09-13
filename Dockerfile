FROM tomcat:9-jdk11
LABEL maintainer="you@example.com"

COPY target/amazonprime*.war /usr/local/tomcat/webapps/amazonprime.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
