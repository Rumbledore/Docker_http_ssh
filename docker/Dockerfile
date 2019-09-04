FROM centos:7
EXPOSE 80
EXPOSE 770
RUN yum install httpd  openssh-server passwd  net-tools -y
ADD ./start.sh /start.sh
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN sed  -i 's/\#Port 22/Port 770/g' /etc/ssh/sshd_config
RUN chmod 755 /start.sh
COPY app/ /var/www/html/
COPY start_service.sh /root/start_service.sh
RUN chmod 777  /root/start_service.sh
RUN chmod 777 /var/www/html/index.html
USER root

CMD ["/bin/bash", "/root/start_service.sh" ]


