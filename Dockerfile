# Stage 1: Build the registration image
FROM ubuntu as registration
RUN apt-get update -y && \
    apt-get install -y apache2 && \
    rm -rf /var/www/html/*
COPY registration.html /var/www/html/index.html
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

# Stage 2: Build the login image
FROM ubuntu as login
RUN apt-get update -y && \
    apt-get install -y apache2 && \
    rm -rf /var/www/html/*
COPY login.html /var/www/html/index.html
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

# Stage 3: Build the landing image
FROM ubuntu as landing
RUN apt-get update -y && \
    apt-get install -y apache2 && \
    rm -rf /var/www/html/*
COPY resume.html /var/www/html/index.html
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
