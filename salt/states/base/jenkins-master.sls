{% set jenkins_workdir = '/srv/jenkins-master' %}
{% set jenkins_compose_file = jenkins_workdir + '/docker-compose.jenkins.yml' %}
{% set jenkins_conf_file = jenkins_workdir + '/conf/jenkins-config.yml' %}

include:
    - docker

jenkins/jenkins:
    docker_image.present:
        - tag: '2.328'

{{ jenkins_compose_file }}:
    file.managed:
        - source: salt://resources/jenkins/docker-compose.jenkins.yml
        - makedirs: true

{{ jenkins_conf_file }}:
    file.managed:
        - source: salt://resources/jenkins/jenkins-config.yml
        - makedirs: true

jenkins-plugins-file:
    file.managed:
        - name: {{ jenkins_workdir }}/plugins.txt
        - source: salt://resources/jenkins/plugins.txt
        - makedirs: true

jenkins-with-plugins-dockerfile:
    file.managed:
        - name: {{ jenkins_workdir }}/Dockerfile
        - source: salt://resources/jenkins/jenkins-with-plugins.Dockerfile
        - makedirs: true

agent-private-key:
    file.managed:
        - name: {{ jenkins_workdir }}/ssl/agent-private-key
        - contents_pillar: jenkins-master:agent-private-key
        - makedirs: true

build-configured-jenkins-image:
    cmd.run:
        - name: "docker build -t jenkins-with-plugins {{ jenkins_workdir }}"

jenkins-with-plugins:
    docker_image.present: []

start-jenkins:
    cmd.run:
        - name: 'docker-compose -f {{ jenkins_compose_file }} up -d'
    require:
        - pkg: docker-compose-package-install-pkgs
        - file: {{ jenkins_compose_file }}
        - file: {{ jenkins_conf_file }}
        - file: jenkins-plugins-file
        - file: agent-private-key
    watch:
        - file: {{ jenkins_conf_file }}
