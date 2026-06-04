FROM amazonlinux

RUN yum update -y && \
    yum install httpd -y && \
    yum clean all

# Change Apache port from 80 to 8080
RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf

# Also update VirtualHost
RUN sed -i 's/<VirtualHost \*:80>/<VirtualHost *:8080>/' /etc/httpd/conf/httpd.conf

COPY public.html /var/www/html/

EXPOSE 8080

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
