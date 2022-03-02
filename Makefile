DOCKER_IMAGE_TAG ?= latest
DOCKER_REGISTRY ?= thomaspturner

start_vms:
	cd vagrant && vagrant up --provision

accept_keys:
	cd vagrant && vagrant ssh salt -c 'sudo salt-key -Ay'

apply_states:
	cd vagrant && vagrant ssh salt -c 'sudo salt --log-level=debug "*" state.apply'

up: start_vms accept_keys apply_states

jenkins_image:
	docker build jenkins-master -t $(DOCKER_REGISTRY)/jenkins-with-plugins:$(DOCKER_IMAGE_TAG)

cleanup:
	docker rm
