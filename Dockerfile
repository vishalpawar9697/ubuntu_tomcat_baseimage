FROM ubuntu:latest
ENV CATALINA_HOME=/opt/apache-tomcat-8.5.16
ENV PATH=$CATALIN_HOME/bin:$PATH
RUN apt-get update
RUN apt-get install default-jdk -y
ADD http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.tar.gz/opt/
WORKDIR /opt/
RUN tar -xvzf apache-tomcat-8.5.16.tar.gz
WORKDIR /opt/apache-tomcat-8.5.16/bin/
EXPOSE 8080
CMD ["catalina.sh", "run"]