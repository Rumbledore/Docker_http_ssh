touch /root/docker.log
echo "${root_password}" | passwd --stdin root
/usr/sbin/sshd -D &  >> /root/docker.log
/usr/sbin/httpd -D FOREGROUND & >> /root/docker.log
tail -f /root/docker.log
