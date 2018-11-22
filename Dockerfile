# Ubuntu 18.04 LTS
# Oracle Java 11.0.1+13 64 bit
# Maven 3.6.0
# Python 3

FROM ubuntu:18.04

MAINTAINER Piotr Choczynski

# this is a non-interactive automated build - avoid some warning messages
ENV DEBIAN_FRONTEND noninteractive

# update dpkg repositories
RUN apt-get update 

# install wget
RUN apt-get install -y wget

# get maven 3.3.9
RUN wget --no-verbose -O /tmp/apache-maven-3.6.0.tar.gz http://archive.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz

# verify checksum
# RUN echo "fae9c12b570c3ba18116a4e26ea524b29f7279c17cbaadc3326ca72927368924d9131d11b9e851b8dc9162228b6fdea955446be41207a5cfc61283dd8a561d2f /tmp/apache-maven-3.6.0.tar.gz" | md5sum -c

# install maven
RUN tar xzf /tmp/apache-maven-3.6.0.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.6.0 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.6.0.tar.gz
ENV MAVEN_HOME /opt/maven

# install JDK
RUN apt-get install -y openjdk-11-jdk
RUN java -version

# remove download archive files
RUN apt-get clean

CMD [""]
