# Use an official OpenJDK runtime as a parent image
FROM eclipse-temurin:17-jre


# Set the working directory in the container
WORKDIR /lifehub/tomcat

# Download and extract Apache Tomcat
ARG TOMCAT_VERSION=9.0.83
RUN apt-get update && \
    apt-get install -y wget curl && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar -xvzf apache-tomcat-${TOMCAT_VERSION}.tar.gz --strip-components=1 && \
    rm apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    apt-get purge -y wget curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose port 8080 for Tomcat
EXPOSE 8080

# Define the command to run Tomcat
CMD ["bin/catalina.sh", "run"]