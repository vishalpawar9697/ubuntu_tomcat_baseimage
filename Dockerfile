# Use Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install required packages
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk curl wget && \
    rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

# Download and install Apache Tomcat
ENV TOMCAT_VERSION 9.0.80
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    mv apache-tomcat-${TOMCAT_VERSION} /usr/local/tomcat && \
    rm apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Expose Tomcat's default port
EXPOSE 8080

# Set the working directory
WORKDIR /usr/local/tomcat

# Start Tomcat
CMD ["bin/catalina.sh", "run"]

