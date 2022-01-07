{% set agent_workdir = '/srv/jenkins-master/' %}
{% set agent_compose_file = 'docker-compose.jenkins-agent.yml' %}

include:
    - docker

jenkins/ssh-agent:
    docker_image.present: []

{{agent_workdir}}{{agent_compose_file}}:
    file.managed:
        - source: salt://resources/jenkins-agent/{{agent_compose_file}}
        - makedirs: true

start-jenkins:
    cmd.run:
        - name: 'docker-compose -f {{agent_workdir}}{{agent_compose_file}} up -d'
    require:
        - file: {{agent_workdir}}{{agent_compose_file}}
