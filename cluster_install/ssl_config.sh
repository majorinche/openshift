#!/bin/sh

for i in `seq 2 3`;do 
	scp -rp okd01:/etc/docker/certs.d/docker-repo.sonic.com okd00${i}:/etc/docker/certs.d/
	ssh okd00${i} mv /etc/docker/certs.d/docker-repo.sonic.com/docker-repo.sonic.com.cert /etc/docker/certs.d/docker-repo.sonic.com/docker-repo.sonic.com.crt
	ssh okd00${i} service docker restart
done

# ssh connection does not support redirection function, like >>
cat /etc/docker/certs.d/docker-repo.sonic.com/docker-repo.sonic.com.crt >> /etc/pki/tls/certs/ca-bundle.crt
