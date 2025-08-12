# Stage 1: Build the registration image
FROM ubuntu as registration
RUN apt-get update -y && \
    apt-get install -y apache2
COPY registration.html /var/www/html/index.html
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
