# Stage 1: Build the registration image
FROM ubuntu as registration
RUN yum update -y
RUN yum install apache2 -y
COPY login.html /var/www/html/
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

# Stage 2: Build the login image
FROM ubuntu as login
RUN yum update -y
RUN yum install apache2 -y
COPY registration.html /var/www/html/
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

# Stage 3: Build the landing image
FROM ubuntu as landing
RUN yum update -y
RUN yum install apache2 -y
COPY resume.html /var/www/html/
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
