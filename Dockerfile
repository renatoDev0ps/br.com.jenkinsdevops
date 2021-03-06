FROM jenkins/jenkins:2.223-jdk11

LABEL Author="Renato do Nascimento Oliveira"

ARG master_image_version="v.2.1.0"
ENV master_image_version $master_image_version

USER jenkins
# Plugin Setup
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
# Auto Configuration Script
COPY src/main/groovy/* /usr/share/jenkins/ref/init.groovy.d/
COPY src/main/resources/*.properties ${JENKINS_HOME}/config/