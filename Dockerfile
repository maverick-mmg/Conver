FROM tomcat:10.1.24-jdk21-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# IMPORTANT pour OpenShift (UID arbitraire / GID 0) : autoriser l'écriture
RUN chgrp -R 0 /usr/local/tomcat && chmod -R g=u /usr/local/tomcat

EXPOSE 8080
CMD ["catalina.sh","run"]