#!/bin/sh

batch_copy(){

	for i in `seq 2 3`;do 
		scp -rp okd02:/etc/docker/certs.d/docker-repo.sonic.com okd00${i}:/etc/docker/certs.d/
		ssh okd00${i} mv /etc/docker/certs.d/docker-repo.sonic.com/docker-repo.sonic.com.cert /etc/docker/certs.d/docker-repo.sonic.com/docker-repo.sonic.com.crt
		ssh okd00${i} service docker restart
	done
}

single_copy(){
	scp -rp okd01:/etc/docker/certs.d/docker-repo.sonic.com /etc/docker/certs.d/
        mv /etc/docker/certs.d/docker-repo.sonic.com/docker-repo.sonic.com.cert /etc/docker/certs.d/docker-repo.sonic.com/docker-repo.sonic.com.crt
	service docker restart
	cat /etc/docker/certs.d/docker-repo.sonic.com/docker-repo.sonic.com.crt >> /etc/pki/tls/certs/ca-bundle.crt
}

# ssh connection does not support redirection function, like >>
#cat /etc/docker/certs.d/docker-repo.sonic.com/docker-repo.sonic.com.crt >> /etc/pki/tls/certs/ca-bundle.crt
single_copy
