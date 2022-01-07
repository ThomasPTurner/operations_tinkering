{% set jenkins_workdir = '/srv/jenkins-master' %}
{% set jenkins_compose_file = jenkins_workdir + '/docker-compose.jenkins.yml' %}
{% set jenkins_conf_file = jenkins_workdir + '/conf/jenkins-config.yml' %}

include:
    - docker

jenkins/jenkins:
    docker_image.present:
        - tag: '2.322'

{{ jenkins_compose_file }}:
    file.managed:
        - source: salt://resources/jenkins/docker-compose.jenkins.yml
        - makedirs: true

{{ jenkins_conf_file }}:
    file.managed:
        - source: salt://resources/jenkins/jenkins-config.yml
        - makedirs: true

start-jenkins:
    cmd.run:
        - name: 'docker-compose -f {{ jenkins_compose_file }} up -d'
    require:
        - pkg: docker-compose-package-install-pkgs
        - file: {{ jenkins_compose_file }}
        - file: {{ jenkins_conf_file }}
