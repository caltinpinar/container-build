FROM registry.access.redhat.com/ubi8/httpd-24

# Add application sources
COPY ./index.html /var/www/html/

EXPOSE 8080

USER 1001

# Run script uses standard ways to run the application
CMD run-httpd
