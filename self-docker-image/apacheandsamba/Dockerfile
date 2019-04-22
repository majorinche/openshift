FROM ubuntu:14.04

MAINTAINER majorinche

RUN apt-get -yqq update && apt-get install -yqq apache2 samba supervisor

COPY service.conf /etc/supervisor/conf.d/

COPY smb.conf /etc/samba/

EXPOSE 80 137/udp 138/udp 139 445

#CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
#CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
CMD supervisord -n -c /etc/supervisor/supervisord.conf
