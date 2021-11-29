up: 
	cd vagrant && vagrant up --provision

accept_keys:
	cd vagrant && vagrant ssh salt -c 'sudo salt-key -Ay'

apply_states:
	cd vagrant && vagrant ssh salt -c 'sudo salt --log-level=debug "*" state.apply'
