FROM tomcat:9.0-jdk11

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WebContent as ROOT app
COPY WebContent/ /usr/local/tomcat/webapps/ROOT/

# Copy compiled classes (from Eclipse output)
COPY build/classes/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/

EXPOSE 8080

CMD ["catalina.sh", "run"]
