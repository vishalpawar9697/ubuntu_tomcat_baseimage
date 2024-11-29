# # Use Ubuntu as the base image
#   ubuntu_tomcat_baseimage     # image size = 751MB
# =================================================================================================
# FROM ubuntu:latest

# # Set environment variables for non-interactive installation
# ENV DEBIAN_FRONTEND=noninteractive

# # Update the package list and install required packages
# RUN apt-get update && apt-get install -y \
#     openjdk-11-jdk curl wget && \
#     rm -rf /var/lib/apt/lists/*

# # Set JAVA_HOME environment variable
# ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
# ENV PATH $JAVA_HOME/bin:$PATH

# # Define Tomcat version
# ENV TOMCAT_VERSION 9.0.97

# # Download and install Apache Tomcat
# RUN wget https://downloads.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
#     tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
#     mv apache-tomcat-${TOMCAT_VERSION} /usr/local/tomcat && \
#     rm apache-tomcat-${TOMCAT_VERSION}.tar.gz

# # Set environment variables for Tomcat
# ENV CATALINA_HOME /usr/local/tomcat
# ENV PATH $CATALINA_HOME/bin:$PATH

# # Expose Tomcat's default port
# EXPOSE 8080

# # Set the working directory
# WORKDIR /usr/local/tomcat

# # Start Tomcat
# CMD ["bin/catalina.sh", "run"]

# ===================================================================================================

# New code ubuntu tomcat_base_image with small size image.    # image size= 692MB

# ===================================================================================================


 FROM ubuntu:20.04
 ENV CATALINA_HOME=/opt/apache-tomcat-9.0.97
 ENV PATH=$CATALINA_HOME/bin:$PATH
 RUN apt-get update
 RUN apt-get install default-jdk -y 
 ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz /opt/
 WORKDIR /opt/
 RUN tar -xzf apache-tomcat-9.0.97.tar.gz
 WORKDIR /opt/apache-tomcat-9.0.97/bin/
 EXPOSE 8080
 CMD ["catalina.sh", "run"]

