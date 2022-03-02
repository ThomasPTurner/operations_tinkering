FROM jenkins/jenkins:latest

# Disable the setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_master/cacsc_configs/jenkins-config.yml

COPY ./plugins.txt /var/jenkins_master/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /var/jenkins_master/plugins.txt
