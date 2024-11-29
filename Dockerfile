FROM ubuntu:20.04
ENV CATALINA_HOME=/opt/apache-tomcat-9.0.97
ENV PATH=$CATALIN_HOME/bin:$PATH
RUN apt-get update
RUN apt-get install default-jdk -y
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97 /bin/apache2-tomcat-9.0.97.tar.gz ./opt/
WORKDIR /opt/
RUN tar -xvzf apache-tomcat-9.0.97.tar.gz
WORKDIR /opt/apache-tomcat-9.0.97/bin/
EXPOSE 8080
CMD ["catalina.sh", "run"]