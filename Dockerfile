# Stage 1: Build the registration image
FROM ubuntu as registration
RUN apt update -y && apt install apache2 -y
COPY register.html /var/www/html/
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

# Stage 2: Build the login image
FROM ubuntu as login
RUN apt update -y && apt install apache2 -y
COPY login.html /var/www/html/
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

# Stage 3: Build the landing image
FROM ubuntu as landing
RUN apt update -y && apt install apache2 -y
COPY index.html /var/www/html/
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
