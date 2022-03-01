jenkins-agent:
    public-key: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLmrkHLiDaU1/WtbJocg36BfR8c3Q5bEuP8YrBz/lKYOzELzoYYH10HPmzY9AHsErEO4nQ07sUAhC3sn0s/hFg8V6f0oYywtKA+aWR1VlDiTQG2PzF9LEt+aOU/RsTHW/V+DFM7cXNJetC2Rs+8n+MaEbMLaqkRsuWbsPGlzbSYsf5aZ4q3gK99pA9PKkQBZzGEGNwNUAoZ4+ZJYVP36+RdsyM7EDTg0MlFkK8hl0Fx3wvgh6+MzPc+5kd0GW+dahZkhc8PSMYqF55R/X9wasBNcQDi21RmRlnhgLyN/8ETw3iXYNLNT4AnZw0cAZ1fq447a0shgxqVg1CXKaB76/H

mine_functions:
    network.ip_addrs:
        cidr: 10.20.30.0/24
    # in prod this would be:
    public_ip:
        - mine_function: grains.get
        - fqdn_ip4
