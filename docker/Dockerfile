FROM centos:7
EXPOSE 80
RUN yum install httpd  -y
COPY app/ /var/www/html/
RUN chmod 777 /var/www/html/index.html
EXPOSE 90
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]