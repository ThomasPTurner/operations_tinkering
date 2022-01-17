FROM jenkins/jenkins

RUN jenkins-plugin-cli --plugins configuration-as-code
