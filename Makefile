DOCKER_IMAGE_TAG ?= latest
DOCKER_REGISTRY ?= thomaspturner

start_vms:
	cd vagrant && vagrant up --provision

accept_keys:
	cd vagrant && vagrant ssh salt -c 'sudo salt-key -Ay'

apply_states:
	cd vagrant && vagrant ssh salt -c 'sudo salt --log-level=debug "*" state.apply'

up: start_vms accept_keys apply_states

jenkins_master_image:
	docker build jenkins-master -t $(DOCKER_REGISTRY)/jenkins-with-plugins:$(DOCKER_IMAGE_TAG)

jenkins_agent_image:
	docker build jenkins-agent -t $(DOCKER_REGISTRY)/jenkins-dnd-agent:$(DOCKER_IMAGE_TAG)

build_images: jenkins_agent_image jenkins_agent_image

push_jenkins_master_image: 
	docker push $(DOCKER_REGISTRY)/jenkins-with-plugins:$(DOCKER_IMAGE_TAG)

push_jenkins_agent_image:
	docker push $(DOCKER_REGISTRY)/jenkins-dnd-agent:$(DOCKER_IMAGE_TAG)

push_images: push_jenkins_agent_image push_jenkins_master_image

update_images: build_images push_images

cleanup:
	docker rmi $(DOCKER_REGISTRY)/jenkins-with-plugins:$(DOCKER_IMAGE_TAG)
