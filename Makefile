up: 
	cd vagrant && vagrant up --provision

accept_keys:
	cd vagrant && vagrant ssh salt -c 'sudo salt-key -Ay'

apply_states:
	cd vagrant && vagrant ssh salt -c 'sudo salt --log-level=debug "*" state.apply'

print_jenkins_password:
	cd vagrant && vagrant ssh jenkins-master -c "sudo docker exec jenkins-master_jenkins_1 cat /var/jenkins_home/secrets/initialAdminPassword"
