{% set jenkins_workdir = '/srv/jenkins-master/' %}
{% set jenkins_compose_file = 'docker-compose.jenkins.yml' %}
{% set jenkins_compose_file = 'docker-compose.jenkins.yml' %}

include:
    - docker

jenkins/jenkins:
    docker_image.present:
        - tag: '2.322'

{{jenkins_workdir}}{{jenkins_compose_file}}:
    file.managed:
        - source: 
            - salt://resources/{{jenkins_compose_file}}

start-jenkins:
    cmd.run:
        - name: 'docker-compose -f {{jenkins_workdir}}{{jenkins_compose_file}} up -d'
