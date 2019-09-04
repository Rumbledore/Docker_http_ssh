touch /root/docker.log
echo "${rootpassword}" | passwd --stdin root
/usr/sbin/sshd -D &  >> /root/docker.log
/usr/sbin/httpd -D FOREGROUND & >> /root/docker.log
tail -f /root/docker.log
