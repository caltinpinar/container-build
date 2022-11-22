FROM registry.access.redhat.com/ubi8/httpd-24

USER 0


RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf 
RUN sed -i "s/#ServerName www.example.com:80/ServerName 0.0.0.0:8080/g" \
    /etc/httpd/conf/httpd.conf

# Add application sources
COPY ./index.html /var/www/html/

RUN chgrp -R 0 /var/log/httpd /var/run/httpd
RUN chmod -R g=u /var/log/httpd /var/run/httpd

EXPOSE 8080

USER 1001

# Run script uses standard ways to run the application
CMD run-httpd
