FROM jenkins/jenkins:2.440.2-lts-jdk21

USER root

COPY install.sh /tmp

ARG JENKINS_USER="jenkins"
ARG JENKINS_HOME="/var/jenkins_home"

ENV DEBIAN_FRONTEND=noninteractive
COPY install.sh /tmp/install.sh
RUN apt-get update -y && apt-get install -y --no-install-recommends && apt-get install -y tzdata curl wget \
&& chmod u+x /tmp/install.sh && /tmp/install.sh
WORKDIR /tmp
RUN chown root:root docker/docker \
&& chmod 755 docker/docker \
&& mv docker/docker /usr/bin \
&& rm -rf docker* \
&& groupadd -r docker \
&& usermod -aG docker ${JENKINS_USER} \
&& rm /tmp/install.sh \
&& apt-get remove -y wget
 
USER ${JENKINS_USER}
WORKDIR ${JENKINS_HOME}