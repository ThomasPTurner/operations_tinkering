up: 
	cd vagrant && vagrant up --provision

accept_keys:
	cd vagrant && vagrant ssh salt -c 'docker exec salt_salt_1 salt-key -Ay'

apply_states:
	cd vagrant && vagrant ssh salt -c 'docker exec salt_salt_1 salt "*" state.apply'
